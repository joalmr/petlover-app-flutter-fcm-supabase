import 'package:flutter/material.dart';
import 'package:google_maps_webservice/places.dart';
import 'package:proypet/global_variables.dart';
import 'package:proypet/src/models/establecimiento/establecimiento_model.dart';
import 'package:proypet/src/models/maps/address.dart';
import 'package:proypet/src/utils/preferencias_usuario/preferencias_usuario.dart';
import 'package:proypet/src/views/pages/reserva/buildVets/buildVet.dart';
import 'package:proypet/src/views/pages/reserva/vet_mapa_page.dart';
import 'package:proypet/src/providers/establecimiento_provider.dart';
import 'package:proypet/src/views/components/appbar_menu.dart';
import 'package:proypet/src/views/components/enddrawer/filtros_mapa.dart';
import 'package:proypet/src/views/components/transicion/pagina_app.dart';
import 'package:proypet/src/styles/styles.dart';
import 'package:proypet/src/utils/error_internet.dart';
import 'package:proypet/src/utils/icons_map.dart';
import 'package:proypet/src/utils/posicion.dart';
import 'package:select_dialog/select_dialog.dart';
import 'package:simple_autocomplete_formfield/simple_autocomplete_formfield.dart';
import 'package:http/http.dart' as http;

class ReservaList extends StatefulWidget {
  @override
  _ReservaListState createState() => _ReservaListState();
}

class _ReservaListState extends State<ReservaList> {
  final GlobalKey<ScaffoldState> _key = GlobalKey<ScaffoldState>();
  var refreshKey = GlobalKey<RefreshIndicatorState>();
  EstablecimientoProvider vetProvider = EstablecimientoProvider();
  // final _prefs = new PreferenciasUsuario();
  List<int> listaFiltros = [];
  var stream;
  String searchAddr = "";
  final _prefs = new PreferenciasUsuario();

  Future<List<EstablecimientoModel>> newFuture() =>
      vetProvider.getVets(listaFiltros); //, _prefs.position

  Future<Null> _onRefresh() async {
    refreshKey.currentState?.show();
    await Future.delayed(Duration(milliseconds: 2));

    setState(() {
      stream = newFuture();
    });
    return null;
  }

  @override
  void initState() {
    _onRefresh();
    super.initState();
  }

  @override
  void dispose() {
    fnGetPosition();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final dynamic filtrosData = ModalRoute.of(context).settings.arguments;

    if (filtrosData != null) {
      listaFiltros = filtrosData["filtros"];
    }

    return Scaffold(
      appBar: AppBar(
        // leading: leadingH,
        title: TextField(
          enableInteractiveSelection: false,
          cursorColor: colorMain,
          decoration: InputDecoration(
            prefixIcon: Icon(
              Icons.search,
            ),
          ),
        ),
        actions: <Widget>[
          IconButton(
            padding: EdgeInsets.all(0),
            icon: Icon(Icons.filter_list),
            onPressed: () => showDialog(
              context: context,
              child: AlertDialog(
                content: SingleChildScrollView(
                  child: Column(
                    children: <Widget>[
                      _autocompleteAddress(),
                    ],
                  ),
                ),
                actions: <Widget>[
                  FlatButton(
                    onPressed: () => Navigator.pop(context),
                    child: Text(
                      'Cerrar',
                      style: Theme.of(context)
                          .textTheme
                          .subtitle2
                          .apply(fontWeightDelta: 2),
                    ),
                  ),
                  FlatButton(
                    onPressed: () {},
                    child: Text(
                      'Buscar',
                      style: Theme.of(context)
                          .textTheme
                          .subtitle2
                          .apply(fontWeightDelta: 2, color: colorMain),
                    ),
                  )
                ],
              ),
            ), // => _key.currentState.openEndDrawer(),
          ),
          // IconButton(
          //   icon: Icon(Icons.filter_list),
          //   onPressed: () {}, // => _key.currentState.openEndDrawer(),
          // ),
        ],
      ),
      body: FutureBuilder(
        future: stream,
        builder: (BuildContext context,
            AsyncSnapshot<List<EstablecimientoModel>> snapshot) {
          if (snapshot.connectionState != ConnectionState.done)
            return LinearProgressIndicator();
          else {
            if (snapshot.hasError) {
              return errorInternet();
            }
            return FadeView(child: _onTab(snapshot.data));
          }
        },
      ),
    );
  }

  _autocompleteAddress() {
    return SimpleAutocompleteFormField<Prediction2>(
      decoration: InputDecoration(
        prefixIcon: Icon(Icons.location_searching),
      ),
      autofocus: true,
      maxSuggestions: 5,
      onSearch: (filter) async {
        var response = await http.get(
            "https://maps.googleapis.com/maps/api/place/autocomplete/json?key=$keyMap&language=es&input=$filter");
        var models = addressFromJson(response.body);
        return models.predictions;
      },
      onChanged: (Prediction2 data) {
        searchAddr = data.name;
        searchandNavigate(data);
        // Navigator.of(context).pop();
        // _onRefresh();
      },
      resetIcon: null,
      itemBuilder: (context, address) => Padding(
          padding: EdgeInsets.symmetric(vertical: 12.0, horizontal: 8.0),
          child: Text(address.name,
              style: TextStyle(fontWeight: FontWeight.bold))),
    );
  }

  searchandNavigate(dato) {
    if (searchAddr.trim() != "") {
      final places = new GoogleMapsPlaces(apiKey: keyMap);
      places.getDetailsByPlaceId(dato.placeId).then((value) {
        Location latlng = value.result.geometry.location;
        _prefs.position = "${latlng.lat},${latlng.lng}";
      });
    }
  }

  _onTab(List<EstablecimientoModel> vetLocales) {
    return Stack(
      children: <Widget>[
        RefreshIndicator(
          key: refreshKey,
          onRefresh: _onRefresh,
          child: CustomScrollView(
            slivers: <Widget>[
              (listaFiltros.length > 0)
                  ? _listarChip(listaFiltros)
                  : SliverToBoxAdapter(
                      child: SizedBox(
                        height: 0.0,
                      ),
                    ),
              (vetLocales.length < 1)
                  ? SliverToBoxAdapter(
                      child: SizedBox(
                        height: 50.0,
                        child: Center(
                          child: Padding(
                            padding: const EdgeInsets.symmetric(vertical: 10.0),
                            child: Text("No se encontró veterinarias"),
                          ),
                        ),
                      ),
                    )
                  : SliverList(
                      delegate: SliverChildBuilderDelegate(
                        (BuildContext context, int index) {
                          return buildVets(context, vetLocales[index]);
                        },
                        childCount: vetLocales.length,
                      ),
                    ),
              SliverToBoxAdapter(
                child: SizedBox(height: 50.0),
              ),
            ],
          ),
        ),
        Positioned(
          bottom: 15,
          right: 10,
          child: FloatingActionButton(
            onPressed: (vetLocales.length == 0)
                ? null
                : () => Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) =>
                            VetMapaPage(establecimientos: vetLocales),
                      ),
                    ),
            child: Icon(Icons.location_on),
          ),
        )
      ],
    );
  }

  _listarChip(dynamic chips) {
    if (chips != null) {
      return SliverToBoxAdapter(
        child: SizedBox(
          height: 35.0,
          child: SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            padding: EdgeInsets.symmetric(horizontal: 20.0),
            child: ListView.builder(
              shrinkWrap: true,
              scrollDirection: Axis.horizontal,
              itemCount: chips.length,
              itemBuilder: (BuildContext context, int index) =>
                  _chip(chips[index]),
            ),
          ),
        ),
      );
    } else {
      return SliverToBoxAdapter(
        child: SizedBox(
          height: 0.0,
        ),
      );
    }
  }

  _chip(int servicio) {
    return Padding(
      padding: const EdgeInsets.symmetric(
        horizontal: 5.0,
      ),
      child: Chip(
        labelStyle: TextStyle(fontSize: sizeLite, color: Colors.black54),
        labelPadding: EdgeInsets.only(left: 5.0, right: 2.5),
        // padding: EdgeInsets.zero,
        avatar: CircleAvatar(
          radius: 12.5,
          backgroundColor: colorMain, //colorBlue, //Colors.grey.shade800,
          child: Icon(iconNum[servicio], size: sizeSmall, color: Colors.white),
        ),
        label: Text(textMap[servicio],
            style:
                TextStyle(color: Theme.of(context).textTheme.subtitle2.color)),
      ),
    );
  }
}

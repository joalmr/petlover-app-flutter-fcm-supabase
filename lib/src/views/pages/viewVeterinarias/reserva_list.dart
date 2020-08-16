import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_maps_webservice/places.dart';
import 'package:proypet/config/global_variables.dart';
import 'package:proypet/src/models/establecimiento/establecimiento_model.dart';
import 'package:proypet/src/models/maps/address.dart';
import 'package:proypet/src2/app/views/components/filtro_veterinarias.dart';
import 'package:proypet/src2/app/views/components/form_control/button_primary.dart';
import 'package:proypet/src2/app/views/components/appbar_menu.dart';
import 'package:proypet/src2/app/views/components/transition/fadeViewSafeArea.dart';
import 'package:proypet/src2/data/services/establecimiento_service.dart';
import 'package:proypet/src2/utils/error_internet.dart';
import 'package:proypet/src2/utils/preferencias_usuario/preferencias_usuario.dart';

import 'package:simple_autocomplete_formfield/simple_autocomplete_formfield.dart';
import 'package:http/http.dart' as http;

import 'components/buildVet.dart';
import 'components/listarChip.dart';
import 'mapaView/vet_mapa_page.dart';

class ReservaList extends StatefulWidget {
  @override
  _ReservaListState createState() => _ReservaListState();
}

class _ReservaListState extends State<ReservaList> {
  final GlobalKey<ScaffoldState> _key = GlobalKey<ScaffoldState>();
  final refreshKey = GlobalKey<RefreshIndicatorState>();
  final _prefs = new PreferenciasUsuario();
  EstablecimientoService vetProvider = EstablecimientoService();
  List<int> listaFiltros = [];
  String searchAddr = "";
  var stream;
  bool filtro = false;

  Future<dynamic> newFuture() => vetProvider.getVets(listaFiltros); //, _prefs.position

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

// //obtiene posicion cuando salgo de la pagina
//   @override
//   void dispose() {
//     fnGetPosition();
//     super.dispose();
//   }

  @override
  Widget build(BuildContext context) {
    final dynamic filtrosData = ModalRoute.of(context).settings.arguments;

    if (filtrosData != null) {
      listaFiltros = filtrosData["filtros"];
    }

    return Scaffold(
      key: _key,
      appBar: appbar(leadingH, 'Buscar veterinarias', <Widget>[
        IconButton(
          icon: Icon(Icons.filter_list),
          onPressed: () => Get.to(FiltraVets(filtros: listaFiltros)),
        ),
      ]),
      body: FutureBuilder(
        future: stream,
        builder: (BuildContext context, AsyncSnapshot<dynamic> snapshot) {
          if (snapshot.connectionState != ConnectionState.done)
            return LinearProgressIndicator();
          else {
            if (snapshot.hasError) {
              return errorInternet();
            } else {
              Map resp = snapshot.data;
              if (resp['code'] == 200)
                return FadeViewSafeArea(child: _onTab(resp['establecimientos']));
              else
                return FadeViewSafeArea(
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Text(
                          'No pudimos detectar tu ubicación',
                          style: Theme.of(context).textTheme.subtitle1,
                        ),
                        SizedBox(height: 10),
                        _autocompleteAddress(),
                        SizedBox(height: 10),
                        buttonPri('Buscar', _onRefresh)
                      ],
                    ),
                  ),
                );
            }
            // else
            // return FadeView(child: _onTab(snapshot.data));
          }
        },
      ),
    );
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
                  ? listarChip(listaFiltros)
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
            onPressed: (vetLocales.length == 0) ? null : () => Get.to(VetMapaPage(establecimientos: vetLocales)),
            child: Icon(Icons.location_on),
          ),
        ),
      ],
    );
  }

  _autocompleteAddress() {
    return SimpleAutocompleteFormField<Prediction2>(
      decoration: InputDecoration(
        prefixIcon: Icon(Icons.location_on),
        hintText: 'Ingrese una dirección',
      ),
      maxSuggestions: 3,
      onSearch: (filter) async {
        var response = await http.get("https://maps.googleapis.com/maps/api/place/autocomplete/json?key=$keyMap&language=es&input=$filter");
        var models = addressFromJson(response.body);
        return models.predictions;
      },
      minSearchLength: 3,
      onChanged: (Prediction2 data) {
        searchAddr = data.name;
        searchandNavigate(data);
      },
      resetIcon: null,
      itemBuilder: (context, address) =>
          Padding(padding: EdgeInsets.symmetric(vertical: 12.0, horizontal: 8.0), child: Text(address.name, style: TextStyle(fontWeight: FontWeight.bold))),
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
}

import 'package:flutter/material.dart';
import 'package:google_maps_webservice/places.dart';
import 'package:proypet/global_variables.dart';
import 'package:proypet/src/models/maps/address.dart';
import 'package:proypet/src/styles/styles.dart';
import 'package:proypet/src/utils/preferencias_usuario/preferencias_usuario.dart';
import 'package:proypet/src/views/components/form_control/button_primary.dart';
import 'package:proypet/src/views/components/transicion/pagina_app.dart';
import 'package:simple_autocomplete_formfield/simple_autocomplete_formfield.dart';
import 'package:http/http.dart' as http;

String searchAddr = "";
final _prefs = new PreferenciasUsuario();

class FiltraVets extends StatefulWidget {
  // const FiltraVets({Key key}) : super(key: key);
  final List<int> filtros;
  FiltraVets({@required this.filtros});
  @override
  _FiltraVetsState createState() => _FiltraVetsState(filtros: filtros);
}

class _FiltraVetsState extends State<FiltraVets> {
  List<int> filtros = [];

  _FiltraVetsState({@required this.filtros});

  @override
  Widget build(BuildContext context) {
    final alto = MediaQuery.of(context).size.height;
    final ancho = MediaQuery.of(context).size.width;

    return Scaffold(
      appBar: AppBar(
        title: Text('Filtrar veterinarias'),
        backgroundColor: Colors.transparent,
        elevation: 0,
      ),
      //  appbar(null, 'Filtrar veterinarias', null),
      body: FadeView(
        child: Stack(
          children: <Widget>[
            Container(height: alto),
            Container(
              height: alto - 130,
              child: SingleChildScrollView(
                padding: EdgeInsets.symmetric(horizontal: 20, vertical: 0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: <Widget>[
                    SizedBox(height: 10),
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 5),
                      child: Text(
                        'Ubicación',
                        style: Theme.of(context)
                            .textTheme
                            .subtitle2
                            .apply(fontWeightDelta: 2),
                      ),
                    ),
                    _autocompleteAddress(),
                    SizedBox(
                      height: 10,
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 5),
                      child: Text(
                        'Servicios',
                        style: Theme.of(context)
                            .textTheme
                            .subtitle2
                            .apply(fontWeightDelta: 2),
                      ),
                    ),
                    Wrap(
                      children: <Widget>[
                        _servicioFlat('Baños / Grooming', 1),
                        _servicioFlat('Cirugía', 3),
                        _servicioFlat('Consulta', 2),
                        _servicioFlat('Desparasitación', 11),
                        _servicioFlat('Ecografía', 12),
                        _servicioFlat('Electrocardiograma', 6),
                        _servicioFlat('Emergencia 24 horas', 8),
                        _servicioFlat('Farmacia', 15),
                        _servicioFlat('Hospedaje', 9),
                        _servicioFlat('Hospitalización', 16),
                        _servicioFlat('Laboratorio', 7),
                        _servicioFlat('Movilidad', 5),
                        _servicioFlat('Petshop', 10),
                        _servicioFlat('Rayos x', 13),
                        _servicioFlat('Resonancia', 14),
                        _servicioFlat('Vacuna', 4),
                      ],
                    ),

                    // _servicioFlat('Baños / Grooming', 1),
                    // SwitchListTile(
                    //   value:
                    //       (filtros.contains(1)) ? true : false, //petReq.genre,
                    //   title: Text('Baños / Grooming'),
                    //   activeColor: colorMain,
                    //   onChanged: (value) => setState(() {
                    //     if (!value)
                    //       filtros.remove(1);
                    //     else
                    //       filtros.add(1);
                    //   }),
                    // ),
                    // SwitchListTile(
                    //   value:
                    //       (filtros.contains(3)) ? true : false, //petReq.genre,
                    //   title: Text('Cirugía'),
                    //   activeColor: colorMain,
                    //   onChanged: (value) => setState(() {
                    //     if (!value)
                    //       filtros.remove(3);
                    //     else
                    //       filtros.add(3);
                    //   }),
                    // ),
                    // SwitchListTile(
                    //   value:
                    //       (filtros.contains(2)) ? true : false, //petReq.genre,
                    //   title: Text('Consulta'),
                    //   activeColor: colorMain,
                    //   onChanged: (value) => setState(() {
                    //     if (!value)
                    //       filtros.remove(2);
                    //     else
                    //       filtros.add(2);
                    //   }),
                    // ),
                    // SwitchListTile(
                    //   value:
                    //       (filtros.contains(11)) ? true : false, //petReq.genre,
                    //   title: Text('Desparasitación'),
                    //   activeColor: colorMain,
                    //   onChanged: (value) => setState(() {
                    //     if (!value)
                    //       filtros.remove(11);
                    //     else
                    //       filtros.add(11);
                    //   }),
                    // ),
                    // SwitchListTile(
                    //   value:
                    //       (filtros.contains(12)) ? true : false, //petReq.genre,
                    //   title: Text('Ecografía'),
                    //   activeColor: colorMain,
                    //   onChanged: (value) => setState(() {
                    //     if (!value)
                    //       filtros.remove(12);
                    //     else
                    //       filtros.add(12);
                    //   }),
                    // ),
                    // SwitchListTile(
                    //   value:
                    //       (filtros.contains(6)) ? true : false, //petReq.genre,
                    //   title: Text('Electrocardiograma'),
                    //   activeColor: colorMain,
                    //   onChanged: (value) => setState(() {
                    //     if (!value)
                    //       filtros.remove(6);
                    //     else
                    //       filtros.add(6);
                    //   }),
                    // ),
                    // SwitchListTile(
                    //   value:
                    //       (filtros.contains(8)) ? true : false, //petReq.genre,
                    //   title: Text('Emergencia 24 horas'),
                    //   activeColor: colorMain,
                    //   onChanged: (value) => setState(() {
                    //     if (!value)
                    //       filtros.remove(8);
                    //     else
                    //       filtros.add(8);
                    //   }),
                    // ),
                    // SwitchListTile(
                    //   value:
                    //       (filtros.contains(15)) ? true : false, //petReq.genre,
                    //   title: Text('Farmacia'),
                    //   activeColor: colorMain,
                    //   onChanged: (value) => setState(() {
                    //     if (!value)
                    //       filtros.remove(15);
                    //     else
                    //       filtros.add(15);
                    //   }),
                    // ),
                    // SwitchListTile(
                    //   value:
                    //       (filtros.contains(9)) ? true : false, //petReq.genre,
                    //   title: Text('Hospedaje'),
                    //   activeColor: colorMain,
                    //   onChanged: (value) => setState(() {
                    //     if (!value)
                    //       filtros.remove(9);
                    //     else
                    //       filtros.add(9);
                    //   }),
                    // ),
                    // SwitchListTile(
                    //   value:
                    //       (filtros.contains(16)) ? true : false, //petReq.genre,
                    //   title: Text('Hospitalización'),
                    //   activeColor: colorMain,
                    //   onChanged: (value) => setState(() {
                    //     if (!value)
                    //       filtros.remove(16);
                    //     else
                    //       filtros.add(16);
                    //   }),
                    // ),
                    // SwitchListTile(
                    //   value:
                    //       (filtros.contains(7)) ? true : false, //petReq.genre,
                    //   title: Text('Laboratorio'),
                    //   activeColor: colorMain,
                    //   onChanged: (value) => setState(() {
                    //     if (!value)
                    //       filtros.remove(7);
                    //     else
                    //       filtros.add(7);
                    //   }),
                    // ),
                    // SwitchListTile(
                    //   value:
                    //       (filtros.contains(5)) ? true : false, //petReq.genre,
                    //   title: Text('Movilidad'),
                    //   activeColor: colorMain,
                    //   onChanged: (value) => setState(() {
                    //     if (!value)
                    //       filtros.remove(5);
                    //     else
                    //       filtros.add(5);
                    //   }),
                    // ),
                    // SwitchListTile(
                    //   value:
                    //       (filtros.contains(10)) ? true : false, //petReq.genre,
                    //   title: Text('Petshop'),
                    //   activeColor: colorMain,
                    //   onChanged: (value) => setState(() {
                    //     if (!value)
                    //       filtros.remove(10);
                    //     else
                    //       filtros.add(10);
                    //   }),
                    // ),
                    // SwitchListTile(
                    //   value:
                    //       (filtros.contains(13)) ? true : false, //petReq.genre,
                    //   title: Text('Rayos x'),
                    //   activeColor: colorMain,
                    //   onChanged: (value) => setState(() {
                    //     if (!value)
                    //       filtros.remove(13);
                    //     else
                    //       filtros.add(13);
                    //   }),
                    // ),
                    // SwitchListTile(
                    //   value:
                    //       (filtros.contains(14)) ? true : false, //petReq.genre,
                    //   title: Text('Resonancia'),
                    //   activeColor: colorMain,
                    //   onChanged: (value) => setState(() {
                    //     if (!value)
                    //       filtros.remove(14);
                    //     else
                    //       filtros.add(14);
                    //   }),
                    // ),
                    // SwitchListTile(
                    //   value:
                    //       (filtros.contains(4)) ? true : false, //petReq.genre,
                    //   title: Text('Vacuna'),
                    //   activeColor: colorMain,
                    //   onChanged: (value) => setState(() {
                    //     if (!value)
                    //       filtros.remove(4);
                    //     else
                    //       filtros.add(4);
                    //   }),
                    // ),
                  ],
                ),
              ),
            ),
            Positioned(
              bottom: 0,
              child: Container(
                  width: ancho,
                  color: Theme.of(context).dialogBackgroundColor,
                  padding: EdgeInsets.symmetric(horizontal: 20, vertical: 5),
                  child: buttonOutLine("Filtrar", filtrar, colorMain)),
            )
          ],
        ),
      ),
    );
  }

  filtrar() {
    Navigator.pushNamedAndRemoveUntil(
        context, 'navLista', ModalRoute.withName("navInicio"),
        arguments: {"filtros": filtros});
  }

  _servicioFlat(String texto, int numero) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 4, vertical: 2),
      child: FlatButton(
        child: Text(texto),
        onPressed: () {
          setState(() {
            (filtros.contains(numero))
                ? filtros.remove(numero)
                : filtros.add(numero);
          });
        },
        color: (filtros.contains(numero)) ? colorMain : Colors.transparent,
        shape: RoundedRectangleBorder(
          borderRadius: new BorderRadius.circular(20.0),
          side: BorderSide(color: colorMain),
        ),
      ),
    );
  }

  _autocompleteAddress() {
    return SimpleAutocompleteFormField<Prediction2>(
      decoration: InputDecoration(
        prefixIcon: Icon(Icons.location_on),
      ),
      // autofocus: true,
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
}

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_maps_webservice/places.dart';
import 'package:proypet/config/global_variables.dart';
import 'package:proypet/src/models/maps/address.dart';
import 'package:proypet/src2/app/views/components/form_control/button_primary.dart';
import 'package:proypet/src2/utils/preferencias_usuario/preferencias_usuario.dart';
import 'package:proypet/src2/app/styles/styles.dart';
import 'package:http/http.dart' as http;
import 'package:simple_autocomplete_formfield/simple_autocomplete_formfield.dart';

TextEditingController destinationController = TextEditingController();

class FiltrosMapa extends StatefulWidget {
  final List<int> filtros;
  FiltrosMapa({@required this.filtros});
  @override
  _FiltrosMapaState createState() => _FiltrosMapaState(filtros: filtros);
}

class _FiltrosMapaState extends State<FiltrosMapa> {
  List<int> filtros;
  _FiltrosMapaState({@required this.filtros});
  final Color active = Colors.grey.shade800;
  final Color divider = Colors.grey.shade600;
  final formKey = GlobalKey<FormState>();
  String searchAddr = "";
  var latlng;
  final _prefs = new PreferenciasUsuario();

  @override
  Widget build(BuildContext context) {
    return ClipPath(
      child: Drawer(
        child: Container(
          padding: const EdgeInsets.only(left: 16.0, right: 16.0),
          decoration: BoxDecoration(color: Theme.of(context).scaffoldBackgroundColor, boxShadow: [BoxShadow(color: Colors.black45)]),
          width: 300,
          child: SafeArea(
            child: SingleChildScrollView(
              child: Form(
                key: formKey,
                child: Column(
                  children: <Widget>[
                    SizedBox(
                      height: 40.0,
                    ),
                    buttonOutLine("Filtrar", filtrar, colorMain),
                    SizedBox(
                      height: 10,
                    ),
                    _autocompleteAddress(),
                    SizedBox(
                      height: 10,
                    ),
                    SwitchListTile(
                      value: (filtros.contains(1)) ? true : false, //petReq.genre,
                      title: Text('Baños / Grooming'),
                      activeColor: colorMain,
                      onChanged: (value) => setState(() {
                        if (!value)
                          filtros.remove(1);
                        else
                          filtros.add(1);
                      }),
                    ),
                    SwitchListTile(
                      value: (filtros.contains(3)) ? true : false, //petReq.genre,
                      title: Text('Cirugía'),
                      activeColor: colorMain,
                      onChanged: (value) => setState(() {
                        if (!value)
                          filtros.remove(3);
                        else
                          filtros.add(3);
                      }),
                    ),
                    SwitchListTile(
                      value: (filtros.contains(2)) ? true : false, //petReq.genre,
                      title: Text('Consulta'),
                      activeColor: colorMain,
                      onChanged: (value) => setState(() {
                        if (!value)
                          filtros.remove(2);
                        else
                          filtros.add(2);
                      }),
                    ),
                    SwitchListTile(
                      value: (filtros.contains(11)) ? true : false, //petReq.genre,
                      title: Text('Desparasitación'),
                      activeColor: colorMain,
                      onChanged: (value) => setState(() {
                        if (!value)
                          filtros.remove(11);
                        else
                          filtros.add(11);
                      }),
                    ),
                    SwitchListTile(
                      value: (filtros.contains(12)) ? true : false, //petReq.genre,
                      title: Text('Ecografía'),
                      activeColor: colorMain,
                      onChanged: (value) => setState(() {
                        if (!value)
                          filtros.remove(12);
                        else
                          filtros.add(12);
                      }),
                    ),
                    SwitchListTile(
                      value: (filtros.contains(6)) ? true : false, //petReq.genre,
                      title: Text('Electrocardiograma'),
                      activeColor: colorMain,
                      onChanged: (value) => setState(() {
                        if (!value)
                          filtros.remove(6);
                        else
                          filtros.add(6);
                      }),
                    ),
                    SwitchListTile(
                      value: (filtros.contains(8)) ? true : false, //petReq.genre,
                      title: Text('Emergencia 24 horas'),
                      activeColor: colorMain,
                      onChanged: (value) => setState(() {
                        if (!value)
                          filtros.remove(8);
                        else
                          filtros.add(8);
                      }),
                    ),
                    SwitchListTile(
                      value: (filtros.contains(15)) ? true : false, //petReq.genre,
                      title: Text('Farmacia'),
                      activeColor: colorMain,
                      onChanged: (value) => setState(() {
                        if (!value)
                          filtros.remove(15);
                        else
                          filtros.add(15);
                      }),
                    ),
                    SwitchListTile(
                      value: (filtros.contains(9)) ? true : false, //petReq.genre,
                      title: Text('Hospedaje'),
                      activeColor: colorMain,
                      onChanged: (value) => setState(() {
                        if (!value)
                          filtros.remove(9);
                        else
                          filtros.add(9);
                      }),
                    ),
                    SwitchListTile(
                      value: (filtros.contains(16)) ? true : false, //petReq.genre,
                      title: Text('Hospitalización'),
                      activeColor: colorMain,
                      onChanged: (value) => setState(() {
                        if (!value)
                          filtros.remove(16);
                        else
                          filtros.add(16);
                      }),
                    ),
                    SwitchListTile(
                      value: (filtros.contains(7)) ? true : false, //petReq.genre,
                      title: Text('Laboratorio'),
                      activeColor: colorMain,
                      onChanged: (value) => setState(() {
                        if (!value)
                          filtros.remove(7);
                        else
                          filtros.add(7);
                      }),
                    ),
                    SwitchListTile(
                      value: (filtros.contains(5)) ? true : false, //petReq.genre,
                      title: Text('Movilidad'),
                      activeColor: colorMain,
                      onChanged: (value) => setState(() {
                        if (!value)
                          filtros.remove(5);
                        else
                          filtros.add(5);
                      }),
                    ),
                    SwitchListTile(
                      value: (filtros.contains(10)) ? true : false, //petReq.genre,
                      title: Text('Petshop'),
                      activeColor: colorMain,
                      onChanged: (value) => setState(() {
                        if (!value)
                          filtros.remove(10);
                        else
                          filtros.add(10);
                      }),
                    ),
                    SwitchListTile(
                      value: (filtros.contains(13)) ? true : false, //petReq.genre,
                      title: Text('Rayos x'),
                      activeColor: colorMain,
                      onChanged: (value) => setState(() {
                        if (!value)
                          filtros.remove(13);
                        else
                          filtros.add(13);
                      }),
                    ),
                    SwitchListTile(
                      value: (filtros.contains(14)) ? true : false, //petReq.genre,
                      title: Text('Resonancia'),
                      activeColor: colorMain,
                      onChanged: (value) => setState(() {
                        if (!value)
                          filtros.remove(14);
                        else
                          filtros.add(14);
                      }),
                    ),
                    SwitchListTile(
                      value: (filtros.contains(4)) ? true : false, //petReq.genre,
                      title: Text('Vacuna'),
                      activeColor: colorMain,
                      onChanged: (value) => setState(() {
                        if (!value)
                          filtros.remove(4);
                        else
                          filtros.add(4);
                      }),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }

  _autocompleteAddress() {
    return SimpleAutocompleteFormField<Prediction2>(
      decoration: InputDecoration(
        prefixIcon: Icon(Icons.location_on, color: colorMain),
        hintText: 'Ingrese una dirección',
      ),
      // suggestionsHeight: 100.0,
      maxSuggestions: 5,
      onSearch: (filter) async {
        var response = await http.get("https://maps.googleapis.com/maps/api/place/autocomplete/json?key=$keyMap&language=es&input=$filter");
        var models = addressFromJson(response.body);
        return models.predictions;
      },
      onChanged: (Prediction2 data) {
        searchAddr = data.name;
        searchandNavigate(data);
      },
      resetIcon: null,
      itemBuilder: (context, address) =>
          Padding(padding: EdgeInsets.symmetric(vertical: 12.0, horizontal: 8.0), child: Text(address.name, style: TextStyle(fontWeight: FontWeight.bold))),
    );
  }

  filtrar() {
    Get.offNamed('navLista', arguments: {"filtros": filtros});
    // Navigator.pushNamedAndRemoveUntil(
    //     context, 'navLista', ModalRoute.withName("navLista"),
    //     arguments: {"filtros": filtros});
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

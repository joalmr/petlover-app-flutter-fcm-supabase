// import 'package:dropdown_search/dropdown_search.dart';
// import 'package:flutter/material.dart';
// import 'package:proypet/global_variables.dart';
// import 'package:proypet/src/models/maps/address.dart';
// import 'package:proypet/src/styles/styles.dart';
// import 'package:http/http.dart' as http;

// autocompleteAddress(String searchAddr){
//   return Material(
//     elevation: 0.0,
//     borderRadius: borderRadius,
//     color: colorGray1,
//     child: DropdownSearch<Prediction>(
//       hint: 'Ingrese dirección',
//       isFilteredOnline: true,
//       autoFocusSearchBox: true,
//       showSearchBox: true,
//       autoValidate: true,
//       mode: Mode.BOTTOM_SHEET,
//       emptyBuilder: (context) => Center(
//         child: Text('Dirección no encontrada'),
//       ),
//       searchBoxDecoration: InputDecoration(
//         contentPadding: EdgeInsets.symmetric(horizontal: 12.0, vertical: 12.0),
//         hintStyle: TextStyle(fontSize: 14.0),
//         prefixIcon: Icon(Icons.location_on),
//         border: InputBorder.none,
//         filled: true,
//         fillColor: colorGray1,
//       ),
//       dropDownSearchDecoration: InputDecoration(
//         contentPadding: EdgeInsets.symmetric(horizontal: 12.0, vertical: 0.0),
//         hintStyle: TextStyle(fontSize: 14.0),
//         prefixIcon: Icon(Icons.location_on,color: colorMain),
//         border: InputBorder.none,
//       ),
//       onFind: (String filter) async {
//         var response = await http.get("https://maps.googleapis.com/maps/api/place/autocomplete/json?key=$keyMap&language=es&input=$filter");
//         var models = addressFromJson(response.body);
//         return models.predictions;
//       },
//       // onChanged: (Prediction data) {
//       //   searchAddr=data.name;
//       // },
//       onSaved: (value)=>searchAddr,
//     ),
//   );
// }

// import 'package:flutter/material.dart';
// import 'package:get/get.dart';
// import 'package:proypet/icons/icon_proypet_icons.dart';
// import 'package:proypet/src2/app/styles/styles.dart';

// class ViewPrecio extends StatefulWidget {
//   final dynamic localVet;
//   ViewPrecio({@required this.localVet});

//   @override
//   _ViewPrecioState createState() => _ViewPrecioState(localVet: localVet);
// }

// class _ViewPrecioState extends State<ViewPrecio> {
//   dynamic localVet;
//   _ViewPrecioState({@required this.localVet});

//   @override
//   Widget build(BuildContext context) {
//     return viewPrecio(localVet);
//   }

//   viewPrecio(localVet) {
//     return SingleChildScrollView(
//       child: Column(
//         children: <Widget>[
//           SizedBox(height: 10.0),
//           Container(
//               padding: const EdgeInsets.symmetric(horizontal: 20.0),
//               width: double.infinity,
//               child: Column(
//                 crossAxisAlignment: CrossAxisAlignment.start,
//                 children: <Widget>[
//                   Text("Precio referencial", style: Get.textTheme.subtitle2.apply(fontWeightDelta: 2)),
//                   Text("*Sujeto a revisión física de mascota", style: TextStyle(fontSize: sizeSmallx2)),
//                   if (localVet.prices.length > 0) _listaPrecio(localVet.prices) else Text("No tiene precios registrados")
//                 ],
//               )),
//         ],
//       ),
//     );
//   }

//   Widget _listaPrecio(precios) {
//     return Column(
//       children: <Widget>[
//         SizedBox(height: 10.0),
//         Row(
//           mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//           children: <Widget>[
//             _precio(
//               "Consulta",
//               precios["consultation"]["from"] == null ? "" : precios["consultation"]["from"],
//               precios["consultation"]["to"] == null ? "" : precios["consultation"]["to"],
//             ),
//             _precio(
//               "Vacunas",
//               precios["vaccination"]["from"] == null ? "" : precios["vaccination"]["from"],
//               precios["vaccination"]["to"] == null ? "" : precios["vaccination"]["to"],
//             ),
//           ],
//         ),
//         Row(
//           mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//           children: <Widget>[
//             _precio(
//               "Baños",
//               precios["grooming"]["from"] == null ? "" : precios["grooming"]["from"],
//               precios["grooming"]["to"] == null ? "" : precios["grooming"]["to"],
//             ),
//             _precio(
//               "Desparasitación",
//               precios["deworming"]["from"] == null ? "" : precios["deworming"]["from"],
//               precios["deworming"]["to"] == null ? "" : precios["deworming"]["to"],
//             ),
//           ],
//         ),
//       ],
//     );
//   }

//   Widget _precio(tipo, desde, hasta) {
//     if (desde == "" && hasta == "") {
//       return SizedBox(
//         width: 0,
//         height: 0,
//       );
//     } else {
//       return Padding(
//           padding: const EdgeInsets.all(8.0),
//           child: Card(
//             elevation: 2.0,
//             child: Container(
//               width: 130,
//               padding: EdgeInsets.symmetric(vertical: 10.0, horizontal: 10.0),
//               child: Column(
//                 mainAxisAlignment: MainAxisAlignment.start,
//                 crossAxisAlignment: CrossAxisAlignment.start,
//                 children: <Widget>[
//                   Text(
//                     tipo,
//                     style: TextStyle(color: Get.textTheme.subtitle2.color),
//                   ),
//                   SizedBox(height: 5),
//                   Text(
//                     "desde",
//                     style: TextStyle(color: Get.textTheme.subtitle2.color),
//                   ),
//                   Row(
//                     mainAxisAlignment: MainAxisAlignment.start,
//                     crossAxisAlignment: CrossAxisAlignment.center,
//                     children: <Widget>[
//                       Icon(
//                         IconProypet.sol_moneda,
//                         color: Get.textTheme.subtitle2.color,
//                         size: 14.0,
//                       ),
//                       (desde != "")
//                           ? Text(
//                               ' $desde ',
//                               style: TextStyle(color: Get.textTheme.subtitle2.color),
//                             )
//                           : SizedBox(width: 0),
//                       (desde != "" && hasta != "")
//                           ? Text(
//                               "-",
//                               style: TextStyle(color: Get.textTheme.subtitle2.color),
//                             )
//                           : SizedBox(width: 0),
//                       (desde == "" && hasta != "")
//                           ? Text(
//                               "0 -",
//                               style: TextStyle(color: Get.textTheme.subtitle2.color),
//                             )
//                           : SizedBox(width: 0),
//                       (hasta != "")
//                           ? Text(
//                               ' $hasta ',
//                               style: TextStyle(color: Get.textTheme.subtitle2.color),
//                             )
//                           : SizedBox(width: 0),
//                     ],
//                   ),
//                 ],
//               ),
//             ),
//           ));
//     }
//   }
// }

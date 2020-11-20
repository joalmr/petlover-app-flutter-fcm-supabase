// import 'package:animate_do/animate_do.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_rating_bar/flutter_rating_bar.dart';
// import 'package:get/get.dart';
// import 'package:proypet/src/app/styles/styles.dart';
// import 'package:proypet/src/app/views/components/form_control/text_field.dart';
// import 'package:proypet/src/controllers/atencion_controller/atencion_controller.dart';
// import 'package:proypet/src/data/models/model/antecion/atencion_model.dart';

// calificar(AtencionModel atencion) {
//   final _ = Get.find<AtencionController>();

//   Get.dialog(FadeIn(
//     child: SimpleDialog(
//       title: Text('Calificar atención'),
//       contentPadding: EdgeInsets.symmetric(horizontal: 20.0, vertical: 10.0),
//       titlePadding: EdgeInsets.symmetric(vertical: 10.0, horizontal: 10.0),
//       children: <Widget>[
//         Text(atencion.establishmentName),
//         SizedBox(height: 10.0),
//         RatingBar(
//           initialRating: _.myrating,
//           minRating: 0,
//           direction: Axis.horizontal,
//           allowHalfRating: false,
//           itemCount: 5,
//           itemPadding: EdgeInsets.symmetric(horizontal: 2.0),
//           glow: false,
//           itemBuilder: (context, _) => Icon(
//             Icons.star,
//             color: colorMain,
//           ),
//           onRatingUpdate: (rating) => _.myrating = rating,
//         ),
//         SizedBox(height: 10.0),
//         textfieldArea(_.inputComentController, "Ingrese comentario de la atención recibida", 250, 3),
//         Row(
//           crossAxisAlignment: CrossAxisAlignment.end,
//           mainAxisAlignment: MainAxisAlignment.end,
//           children: <Widget>[
//             FlatButton(onPressed: () => Get.back(), child: Text('Cancelar', style: Get.textTheme.subtitle2.apply(fontWeightDelta: 2))),
//             FlatButton(
//                 onPressed: () => _.onRate(atencion),
//                 child: Text('Calificar',
//                     style: Get.textTheme.subtitle2.apply(
//                       fontWeightDelta: 2,
//                       color: colorMain,
//                     ))),
//           ],
//         ),
//       ],
//     ),
//   ));
// }

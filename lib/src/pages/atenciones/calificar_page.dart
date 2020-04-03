// import 'package:flutter/material.dart';
// import 'package:proypet/src/pages/shared/appbar_menu.dart';
// import 'package:proypet/src/pages/shared/form_control/button_primary.dart';
// import 'package:proypet/src/pages/shared/form_control/text_field.dart';
// import 'package:proypet/src/pages/shared/styles/styles.dart';
// import 'package:smooth_star_rating/smooth_star_rating.dart';

// class CalificarPage extends StatefulWidget {
//   // const CalificarPage({Key key}) : super(key: key);
//   @override
//   _CalificarPageState createState() => _CalificarPageState();
// }

// class _CalificarPageState extends State<CalificarPage> {
//   TextEditingController _inputComentController=new TextEditingController();

//   double rating= 0.0;

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: appbar(leadingH,'Nombre vet',null),
//       body: Padding(
//         padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 30.0),
//         child: Column(
//           crossAxisAlignment: CrossAxisAlignment.start,
//           mainAxisAlignment: MainAxisAlignment.start,
//           children: <Widget>[
//             Text('Califique veterinaria'),
//             SizedBox(height: 10.0,),
//             SmoothStarRating(
//               rating: rating,
//               size: 40,
//               filledIconData: Icons.star,
//               halfFilledIconData: Icons.star_half,
//               defaultIconData: Icons.star_border,
//               starCount: 5,
//               allowHalfRating: false,
//               spacing: 0.0,
//               color: colorMain,
//               onRatingChanged: (value) {
//                 setState(() {
//                   rating = value;
//                 });
//               },
//             ),
//             SizedBox(height: 30.0,),
//             textfieldArea(_inputComentController,"Ingrese comentario de la atención recibida",250,3),
//             SizedBox(height: 30.0,),
//             Center(child: buttonPri('Calificar',(){}))
//           ],
//         ),
//       ),
//     );
//   }
// }
// import 'package:cached_network_image/cached_network_image.dart';
// import 'package:flutter/material.dart';
// import 'package:proypet/src/models/establecimiento/comentarios_model.dart';
// import 'package:proypet/src2/app/styles/styles.dart';
// import 'package:proypet/src2/data/services/establecimiento_service.dart';
// // import 'package:proypet/src/utils/error_internet.dart';

// class ViewComentario extends StatefulWidget {
//   final String idVet;
//   ViewComentario({@required this.idVet});

//   @override
//   _ViewComentarioState createState() => _ViewComentarioState(idVet: idVet);
// }

// class _ViewComentarioState extends State<ViewComentario> {
//   String idVet;
//   _ViewComentarioState({@required this.idVet});

//   EstablecimientoService establecimiento = EstablecimientoService();
//   var stream;

//   Future<List<Comentarios>> newFuture() => establecimiento.getComents(idVet);

//   @override
//   void initState() {
//     setState(() {
//       stream = newFuture();
//     });
//     super.initState();
//   }

//   @override
//   Widget build(BuildContext context) {
//     return viewComentario();
//   }

//   viewComentario() {
//     return FutureBuilder(
//       future: stream,
//       builder: (BuildContext context, AsyncSnapshot<List<Comentarios>> snapshot) {
//         final comentarios = snapshot.data;
//         if (snapshot.connectionState != ConnectionState.done) {
//           return Container();
//         } else {
//           if (snapshot.hasError) {
//             return Center(child: Text('Oops..'));
//           }
//         }
//         return ListView.builder(
//           itemCount: comentarios.length,
//           itemBuilder: (BuildContext context, int index) {
//             return ListTile(
//               // contentPadding: EdgeInsets.all(0),
//               leading: CircleAvatar(
//                 backgroundColor: colorMain,
//                 backgroundImage: CachedNetworkImageProvider(comentarios[index].petPicture),
//                 radius: 20.0,
//               ),
//               title: Container(
//                 padding: EdgeInsets.all(0),
//                 alignment: Alignment.topLeft,
//                 child: Text(
//                   comentarios[index].comment,
//                   style: TextStyle(fontSize: 14),
//                 ),
//               ),
//               trailing: Wrap(children: <Widget>[
//                 Text(
//                   comentarios[index].stars.toString(),
//                   style: TextStyle(fontSize: 14),
//                 ),
//                 Icon(
//                   Icons.star,
//                   color: colorYellow,
//                   size: 17,
//                 )
//               ]),
//             );
//           },
//         );
//       },
//     );
//   }
// }

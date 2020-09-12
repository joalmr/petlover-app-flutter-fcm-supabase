// import 'package:flutter/material.dart';
// import 'package:get/get.dart';

// class MenuDrawer extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return Drawer(
//       child: Container(
//         padding: const EdgeInsets.only(left: 16.0, right: 16.0),
//         decoration: BoxDecoration(color: Theme.of(context).scaffoldBackgroundColor, boxShadow: [BoxShadow(color: Colors.black45)]),
//         width: 300,
//         child: SafeArea(
//           child: SingleChildScrollView(
//             physics: BouncingScrollPhysics(),
//             child: Column(
//               children: <Widget>[
//                 SizedBox(height: 40.0),
//                 ListTile(
//                   leading: Icon(Icons.pets),
//                   title: Text('Inicio'),
//                   onTap: () => Get.toNamed('navInicio'),
//                 ),
//                 ListTile(
//                   leading: Icon(Icons.notifications_active),
//                   title: Text('Notificaciones'),
//                   onTap: () => Get.toNamed('navNotifica'),
//                 ),
//                 ListTile(
//                   leading: Icon(Icons.search),
//                   title: Text('Veterinarias'),
//                   onTap: () => Get.toNamed('navLista'),
//                 ),
//                 ListTile(
//                   leading: Icon(Icons.monetization_on),
//                   title: Text('Puntos'),
//                   onTap: () => Get.toNamed('navRecompensa'),
//                 ),
//               ],
//             ),
//           ),
//         ),
//       ),
//     );
//   }
// }

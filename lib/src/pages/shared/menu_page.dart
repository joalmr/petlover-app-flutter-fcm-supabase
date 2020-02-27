// import 'package:flutter/material.dart';
// import 'package:proypet/src/pages/shared/styles/styles.dart';



// class MenuPage extends StatelessWidget {
//   final Color primary = Colors.white;
//   final Color active = Colors.grey.shade800;
//   final Color divider = Colors.grey.shade600;

//   @override
//   Widget build(BuildContext context) {
//     return ClipPath(
//       //clipper: OvalRightBorderClipper(),
//       child: Drawer(
//         child: Container(
//           padding: const EdgeInsets.only(left: 16.0, right: 32.0),
//           decoration: BoxDecoration(
//               color: primary, boxShadow: [BoxShadow(color: Colors.black45)]),
//           width: 300,
//           child: SafeArea(
//             child: SingleChildScrollView(
//               child: Column(
//                 children: <Widget>[
//                   SizedBox(height: 20.0,),
//                   Container(
//                     height: 90,
//                     alignment: Alignment.center,
//                     decoration: BoxDecoration(
//                         shape: BoxShape.circle,
//                         color: colorMain
//                     ),
//                     child: CircleAvatar(
//                       radius: 40,
//                       backgroundImage: NetworkImage('https://scontent.flim16-1.fna.fbcdn.net/v/t1.0-9/44519265_1247825338693500_3115897111372103680_n.jpg?_nc_cat=110&_nc_ohc=Zm1cV4ZjJQIAX9Ja2wH&_nc_ht=scontent.flim16-1.fna&oh=2bb11e57bd9cce79ad7dfd9f5c421ca4&oe=5EAC036D'),
//                     ),
//                   ),
//                   SizedBox(height: 5.0),
//                   Text(
//                     "Alonso Massa",
//                     style: TextStyle(
//                         color: Colors.black,
//                         fontSize: 18.0,
//                         fontWeight: FontWeight.w600),
//                   ),
//                   SizedBox(height: 30.0),
//                   _buildRow(Icons.home, "Greco"),//1
//                   _buildDivider(),
//                   _buildRow(Icons.add, "Reservar"),//+
//                   _buildDivider(),
//                   _buildRow(Icons.assignment_late, "Atenciones"),//2
//                   _buildDivider(),
//                   _buildRow(Icons.pets, "Mis mascotas"),//3
//                   _buildDivider(),
//                   _buildRow(Icons.person_pin, "Mi perfil"),
//                   _buildDivider(),
//                   _buildRow(Icons.notifications, "Notificaciones", showBadge: true, cantidad: '8'),
//                   _buildDivider(),
//                   _buildRow(Icons.email, "Compartir mascota"),
//                   _buildDivider(),
//                   _buildRow(Icons.person_pin, "Cerrar sesión"),
//                 ],
//               ),
//             ),
//           ),
//         ),
//       ),
//     );
//   }


//   Divider _buildDivider() {
//     return Divider(
//       color: divider,
//     );
//   }

//   Widget _buildRow(IconData icon, String title, {bool showBadge = false , String cantidad = ''}) {
//     final TextStyle tStyle = TextStyle(color: active, fontSize: 16.0);
//     return Container(
//       padding: const EdgeInsets.symmetric(vertical: 5.0),
//       child: Row(children: [
//         Icon(
//           icon,
//           color: active,
//         ),
//         SizedBox(width: 10.0),
//         Text(
//           title,
//           style: tStyle,
//         ),
//         Spacer(),
//         if (showBadge)
//           Material(
//             color: colorMain,
//             borderRadius: BorderRadius.circular(5.0),
//             child: Container(
//               width: 25,
//               height: 25,
//               alignment: Alignment.center,
//               decoration: BoxDecoration(
//                 borderRadius: BorderRadius.circular(5.0),
//               ),
//               child: Text(
//                 cantidad,
//                 style: TextStyle(
//                     color: Colors.white,
//                     fontSize: 12.0,
//                     fontWeight: FontWeight.bold),
//               ),
//             ),
//           )
//       ]),
//     );
//   }

// }

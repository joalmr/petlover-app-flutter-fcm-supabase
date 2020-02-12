// import 'package:flutter/material.dart';
// import 'package:proypet/main.dart';

// final _shapeB = RoundedRectangleBorder(borderRadius: BorderRadius.circular(10.0));
// final _shape = BorderRadius.circular(10.0);

// class FormControl {
  
//   Widget textfield(_hinttext, _icon, _obscuretext){
//     return Padding(
//       padding: const EdgeInsets.symmetric(horizontal: 32),
//       child: Material(
//         elevation: 0.0,
//         borderRadius: _shape,
//         color: Colors.grey[200],
//         child: TextField(
//           obscureText: _obscuretext,
//           onChanged: (String value){},
//           cursorColor: colorMain,
//           decoration: InputDecoration(
//             hintText: _hinttext,
//             hintStyle: TextStyle(fontSize: 14.0),
//             prefixIcon: Material(
//               //elevation: 0.0,
//               borderRadius: _shape,
//               color: Colors.grey[200],
//               child: Icon(
//                 _icon,
//                 color: colorMain,
//               ),
//             ),
//             border: InputBorder.none,
//             contentPadding: EdgeInsets.symmetric(horizontal: 12.0, vertical: 12.0)
//           ),
//         ),
//       ),
//     );
//   }

//   Widget textfieldBtn(_hinttext, _icon, _funtion){
//     return Container(
//       margin: EdgeInsets.symmetric(horizontal: 22.0,vertical: 8.0),
//       padding: EdgeInsets.fromLTRB(15.0, 0, 0, 0),
//       decoration: BoxDecoration(
//         color: Colors.grey[200],
//         borderRadius: BorderRadius.circular(10.0),
//       ),
//       child: TextField(
//         cursorColor: colorMain,
//         decoration: InputDecoration(
//           hintText: _hinttext,
//           border: InputBorder.none,
//           suffixIcon: Container(
//             // decoration: BoxDecoration(
//             //   color: colorMain,
//             //   borderRadius: BorderRadius.only(topLeft: Radius.circular(10), bottomLeft: Radius.circular(30),topRight: Radius.circular(10),bottomRight: Radius.circular(10)),
//             // ),
//             child: IconButton(onPressed: _funtion, icon: _icon,color: colorMain,tooltip: 'Buscar'))
//         ),
//       ),
//     );
//   }

//   Widget buttonPri(_text,_funtion){
//     return Padding(
//       padding: const EdgeInsets.symmetric(horizontal: 32),
//       child: RaisedButton(
//           shape: _shapeB,
//           color: colorMain,
//           elevation: 2.0,
//           textColor: Colors.white,
//           child: Text(_text, 
//             style: TextStyle(
//               fontSize: 14.0,
//               fontWeight: FontWeight.w700
//             ),
//           ),
//           padding: EdgeInsets.symmetric(vertical: 16.0,horizontal: 12.0),
//           onPressed: _funtion,
//         ),
//     );
//   }

//   Widget buttonSec(_text,_funtion){
//     return Padding(
//       padding: const EdgeInsets.symmetric(horizontal: 0.0),
//       child: RaisedButton(
//           shape: _shapeB,
//           color: colorMain,//colorSec,
//           elevation: 2.0,
//           textColor: Colors.white,
//           child: Text(_text, 
//             style: TextStyle(
//               fontSize: 14.0,
//               fontWeight: FontWeight.normal
//             ),
//           ),
//           padding: EdgeInsets.symmetric(vertical: 14.0,horizontal: 32.0),
//           onPressed: _funtion,
//         ),
//     );
//   }
// //
//   Widget buttonTer(_text,_funtion){
//     return Padding(
//       padding: const EdgeInsets.symmetric(horizontal: 0.0),
//       child: RaisedButton(
//           shape: _shapeB,
//           color: Colors.grey[300],
//           elevation: 2.0,
//           textColor: Colors.white,
//           child: Text(_text, 
//             style: TextStyle(
//               fontSize: 14.0,
//               fontWeight: FontWeight.normal
//             ),
//           ),
//           padding: EdgeInsets.symmetric(vertical: 14.0,horizontal: 32.0),
//           onPressed: _funtion,
//         ),
//     );
//   }

// }

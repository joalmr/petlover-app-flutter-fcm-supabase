import 'package:flutter/material.dart';
import 'package:proypet/src/utils/styles/styles.dart';
final _shape = BorderRadius.circular(10.0);

Widget textfieldArea(_inputController, String _hinttext, _maxLength, _maxLines){
  //String _hinttext, _icon,bool _obscuretext, _onsaved,TextCapitalization _textCap,String _valorInicial
  return Material(
    elevation: 0.0,
    borderRadius: _shape,
    color: Colors.grey[200],
    child: TextField(
      enableInteractiveSelection: false,
      controller: _inputController,
      textCapitalization: TextCapitalization.sentences,
      maxLength: _maxLength,
      maxLines: _maxLines,
      keyboardType: TextInputType.multiline,
      cursorColor: colorMain,
      decoration: InputDecoration(
        hintText: _hinttext,
        hintStyle: TextStyle(fontSize: 14.0),
        border: InputBorder.none,
        contentPadding: EdgeInsets.symmetric(horizontal: 12.0, vertical: 12.0)
      ),
    ),
  );
}
  

// Widget textfield(_hinttext, _icon, _obscuretext){
//   return Padding(
//     padding: const EdgeInsets.symmetric(horizontal: 32),
//     child: Material(
//       elevation: 0.0,
//       borderRadius: _shape,
//       color: Colors.grey[200],
//       child: TextField(
//         obscureText: _obscuretext,
//         onChanged: (String value){},
//         cursorColor: colorMain,
//         decoration: InputDecoration(
//           hintText: _hinttext,
//           hintStyle: TextStyle(fontSize: 14.0),
//           prefixIcon: Material(
//             //elevation: 0.0,
//             borderRadius: _shape,
//             color: Colors.grey[200],
//             child: Icon(
//               _icon,
//               color: colorMain,
//             ),
//           ),
//           border: InputBorder.none,
//           contentPadding: EdgeInsets.symmetric(horizontal: 12.0, vertical: 12.0)
//         ),
//       ),
//     ),
//   );
// }


import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:proypet/design/styles/styles.dart';

Widget btnSecondary({
  @required String text,
  @required Function onPressed,
  Color color = colorMain,
}) {
  return TextButton(
    child: Text(text),
    onPressed: onPressed,
    style: TextButton.styleFrom(
      padding: EdgeInsets.symmetric(vertical: 15.0, horizontal: 15.0),
      alignment: Alignment.center,
      primary: color,
      // textStyle: TextStyle(fontWeight: FontWeight.bold),
      side: BorderSide(color: color),
    ),
  );
}

// Widget buttonOutLine(String _text, _funtion, Color _color) {
//   return OutlineButton(
//     onPressed: _funtion,
//     child: Text(
//       _text,
//       style: _textstyle,
//     ),
//     padding: EdgeInsets.symmetric(vertical: 12.0, horizontal: 20.0),
//     color: Colors.black.withOpacity(0.15),
//     shape: shape10,
//     borderSide: new BorderSide(color: _color),
//     highlightedBorderColor: _color,
//     textColor: _color,
//   );
// }
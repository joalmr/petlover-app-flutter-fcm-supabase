import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

Widget btnAltern({
  @required String text,
  @required Function onPressed,
  Color color = Colors.black54,
  bool bold = false,
}) {
  return TextButton(
    child: Text(text),
    onPressed: onPressed,
    style: TextButton.styleFrom(
      padding: EdgeInsets.symmetric(vertical: 10.0, horizontal: 15.0),
      textStyle: TextStyle(
        fontWeight: bold ? FontWeight.bold : FontWeight.normal,
      ),
      primary: color,
    ),
  );
}


// Widget buttonFlat(String _text, _funtion, Color _color) {
//   return FlatButton(
//     onPressed: _funtion,
//     child: new Text(_text, style: _textstyle.copyWith(color: _color)),
//     padding: EdgeInsets.symmetric(vertical: 12.0, horizontal: 20.0),
//     shape: shape10,
//   );
// }

// Widget buttonModal(String _text, _funtion, Color _color) {
//   return FlatButton(
//     onPressed: _funtion,
//     child: new Text(_text, style: _textstyle.copyWith(color: _color)),
//     shape: shape10,
//   );
// }
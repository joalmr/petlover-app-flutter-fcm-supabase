import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:proypet/design/styles/styles.dart';

Widget btnPrimary({
  @required String text,
  @required Function onPressed,
  bool cargando = false,
}) {
  return SizedBox(
    width: double.maxFinite,
    child: TextButton(
      child: cargando
          ? Row(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                CupertinoActivityIndicator(),
                SizedBox(width: 5),
                Text(text),
              ],
            )
          : Text(text),
      //Text(text),
      onPressed: onPressed,
      style: TextButton.styleFrom(
        padding: EdgeInsets.symmetric(vertical: 15.0, horizontal: 15.0),
        textStyle: TextStyle(fontWeight: FontWeight.bold),
        backgroundColor: colorMain,
        primary: Colors.white,
      ),
    ),
  );
}

// Widget buttonPri(_text, _funtion, {bool cargando = false}) {
//   return SizedBox(
//     width: double.maxFinite,
//     child: RaisedButton(
//       shape: shape10,
//       color: colorMain,
//       elevation: 2.0,
//       textColor: Colors.white,
//       child: cargando
//           ? Row(
//               mainAxisAlignment: MainAxisAlignment.center,
//               crossAxisAlignment: CrossAxisAlignment.center,
//               children: [
//                 CupertinoActivityIndicator(),
//                 SizedBox(width: 5),
//                 Text(_text, style: _textstyle),
//               ],
//             )
//           : Text(_text, style: _textstyle),
//       padding: EdgeInsets.symmetric(vertical: 12.0, horizontal: 20.0),
//       onPressed: !cargando ? _funtion : null,
//     ),
//   );
// }

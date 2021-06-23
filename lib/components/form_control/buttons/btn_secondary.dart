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
      padding: EdgeInsets.symmetric(horizontal: 15.0), //vertical: 15.0,
      alignment: Alignment.center,
      primary: color,
      side: BorderSide(color: color),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(16.0),
      ),
    ),
  );
}

// return ElevatedButton(
//   child: Text(text),
//   onPressed: onPressed,
//   style: ElevatedButton.styleFrom(
//     elevation: 0,
//     onPrimary: color,
//     side: BorderSide(color: color),
//     shape: RoundedRectangleBorder(
//       borderRadius: BorderRadius.circular(16.0),
//     ),
//   ),
// );
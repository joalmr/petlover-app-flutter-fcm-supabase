import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:proypet/design/styles/styles.dart';

Widget btnPrimary({
  @required String text,
  @required Function onPressed,
  bool cargando = false,
}) {
  return GestureDetector(
    onTap: cargando ? null : onPressed,
    child: Container(
      height: 48,
      decoration: BoxDecoration(
        color: cargando ? Colors.grey[350] : colorMain,
        borderRadius: BorderRadius.all(
          Radius.circular(16.0),
        ),
        boxShadow: <BoxShadow>[
          BoxShadow(
            color: colorMain.withOpacity(0.5),
            offset: const Offset(1.1, 1.1),
            blurRadius: 10.0,
          ),
        ],
      ),
      child: Center(
        child: Text(
          text,
          textAlign: TextAlign.left,
          style: TextStyle(
            fontWeight: FontWeight.w600,
            fontSize: 16.5,
            letterSpacing: 0.0,
            color: Colors.white,
          ),
        ),
      ),
    ),
  );
}

// return SizedBox(
//   width: double.maxFinite,
//   child: TextButton(
//     child: cargando
//         ? Row(
//             mainAxisAlignment: MainAxisAlignment.center,
//             crossAxisAlignment: CrossAxisAlignment.center,
//             children: [
//               CupertinoActivityIndicator(),
//               SizedBox(width: 5),
//               Text(text),
//             ],
//           )
//         : Text(text),
//     //Text(text),
//     onPressed: onPressed,
//     style: TextButton.styleFrom(
//       padding: EdgeInsets.symmetric(vertical: 15.0, horizontal: 15.0),
//       textStyle: TextStyle(fontWeight: FontWeight.bold),
//       backgroundColor: colorMain,
//       primary: Colors.white,
//     ),
//   ),
// );
import 'package:flutter/material.dart';
import 'package:proypet/src/app/styles/styles.dart';

Widget cardSt({@required Widget content, @required text}) {
  return Card(
    margin: EdgeInsets.symmetric(horizontal: 5, vertical: 5),
    child: Container(
      height: 52,
      padding: EdgeInsets.symmetric(horizontal: 10, vertical: 5),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          content,
          Text(
            text,
            style: TextStyle(
              fontSize: 10,
            ),
          ),
        ],
      ),
    ),
  );
}

Widget cardFn({@required image, @required text, @required fn}) {
  return Card(
    margin: EdgeInsets.symmetric(horizontal: 5, vertical: 5),
    child: InkWell(
      borderRadius: borderRadius,
      onTap: fn,
      child: Container(
        height: 52,
        padding: EdgeInsets.symmetric(horizontal: 10, vertical: 5),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image(
              width: 28,
              height: 28,
              image: image,
            ),
            Text(
              text,
              style: TextStyle(fontSize: 10),
            ),
          ],
        ),
      ),
    ),
  );
}

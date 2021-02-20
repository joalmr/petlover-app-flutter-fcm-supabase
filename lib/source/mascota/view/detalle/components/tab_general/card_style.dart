import 'package:flutter/material.dart';
import 'package:proypet/design/styles/styles.dart';

Widget cardSt(
    {@required Widget content, @required text, height = 52.0, width}) {
  return Card(
      margin: EdgeInsets.symmetric(horizontal: 5, vertical: 5),
      child: width == null
          ? Container(
              height: height,
              padding: EdgeInsets.symmetric(horizontal: 10, vertical: 5),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Expanded(child: content),
                  Text(
                    text,
                    style: TextStyle(
                      fontSize: 10,
                    ),
                  ),
                ],
              ),
            )
          : Container(
              height: height,
              width: width,
              padding: EdgeInsets.symmetric(horizontal: 10, vertical: 5),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Expanded(child: content),
                  Text(
                    text,
                    style: TextStyle(
                      fontSize: 10,
                    ),
                  ),
                ],
              ),
            ));
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

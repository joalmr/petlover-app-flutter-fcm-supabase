import 'package:flutter/material.dart';
import 'package:proypet/design/styles/styles.dart';

Widget cardShop({@required image, @required text, @required fn}) {
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
            // Image(
            //   width: 28,
            //   height: 28,
            //   image: image,
            // ),
            image,
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

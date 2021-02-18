import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:proypet/src/app/styles/styles.dart';

Widget listAcc(String page, String texto, IconData icono) {
  return InkWell(
    onTap: () => Get.toNamed(page),
    child: Card(
      child: Container(
        height: 65,
        padding: EdgeInsets.all(8),
        child: Row(
          children: [
            Container(
              height: 45,
              width: 45,
              decoration: BoxDecoration(
                color: colorMain,
                borderRadius: borderRadius,
              ),
              child: Icon(
                icono,
                color: Colors.white,
                size: 20,
              ),
            ),
            SizedBox(width: 10),
            Expanded(
              child: Text(
                texto,
                style: Get.textTheme.subtitle1.apply(fontWeightDelta: 2),
              ),
            ),
          ],
        ),
      ),
    ),
  );
}

Widget listAccFn(String texto, IconData icono, Function onTap) {
  return InkWell(
    onTap: onTap,
    child: Card(
      child: Container(
        height: 65,
        padding: EdgeInsets.all(8),
        child: Row(
          children: [
            Container(
              height: 45,
              width: 45,
              decoration: BoxDecoration(
                color: colorMain,
                borderRadius: borderRadius,
              ),
              child: Icon(
                icono,
                color: Colors.white,
                size: 20,
              ),
            ),
            SizedBox(width: 10),
            Expanded(
              child: Text(
                texto,
                style: Get.textTheme.subtitle1.apply(fontWeightDelta: 2),
              ),
            ),
          ],
        ),
      ),
    ),
  );
}

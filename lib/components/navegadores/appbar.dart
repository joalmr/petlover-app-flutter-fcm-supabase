import 'package:flutter/material.dart';
import 'package:get/get.dart';

Widget appBar(
    {@required String texto, @required List<Widget> acc}) {
  if (Get.width < 600) {
    return AppBar(
      leading: null,
      centerTitle: false,
      title: Text(texto),
      actions: acc,
    );
  } else {
    //pantallas grandes
    return AppBar(
      leading: null,
      centerTitle: false,
      backgroundColor: Colors.transparent,
      automaticallyImplyLeading: false,
      textTheme: TextTheme(
        headline6: TextStyle(
          fontSize: 18.0,
          fontWeight: FontWeight.w500,
          color: Get.textTheme.subtitle2.color,
        ),
      ),
      actionsIconTheme: IconThemeData(color: Get.textTheme.subtitle2.color),
      iconTheme: IconThemeData(color: Get.textTheme.subtitle2.color),
      title: Text(texto),
      actions: acc,
    );
  }
}

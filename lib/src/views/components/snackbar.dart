import 'package:flutter/material.dart';
import 'package:get/get.dart';

void mostrarSnackbar(String mensaje, Color color) {
  Get.snackbar(
    null,
    mensaje,
    backgroundColor: color,
    borderRadius: 5,
    snackPosition: SnackPosition.BOTTOM,
    duration: Duration(milliseconds: 2500),
  );
  // final snackbar = SnackBar(
  //   content: Text(mensaje),
  //   duration: Duration(milliseconds: 2500),
  //   backgroundColor: color,
  // );
  // scaffoldKey.currentState.showSnackBar(snackbar);
}

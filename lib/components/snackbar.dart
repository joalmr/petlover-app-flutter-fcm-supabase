import 'package:flutter/material.dart';
import 'package:get/get.dart';

void mostrarSnackbar(String mensaje, Color color) {
  ScaffoldMessenger.of(Get.context).showSnackBar(SnackBar(
    content: Text(mensaje),
    duration: Duration(seconds: 3),
    backgroundColor: color,
  ));
  // );
}

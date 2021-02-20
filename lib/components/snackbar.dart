import 'package:flutter/material.dart';
import 'package:get/get.dart';

void mostrarSnackbar(String mensaje, Color color) {
  Get.snackbar(
    null,
    mensaje,
    colorText: Colors.white70,
    backgroundColor: color,
    borderRadius: 5,
    snackPosition: SnackPosition.BOTTOM,
    duration: Duration(milliseconds: 3000),
  );
}

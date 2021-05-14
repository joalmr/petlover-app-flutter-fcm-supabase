import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:proypet/design/styles/styles.dart';

//tablets..
Widget navbar() {
  return PreferredSize(
    preferredSize: Size(Get.width, 1000),
    child: Container(
      color: colorMain,
      child: Padding(
        padding: EdgeInsets.only(top: 25, bottom: 10, left: 20, right: 20),
        child: Row(
          children: [
            ClipRRect(
                child: Image(
                    height: 42,
                    image: AssetImage('images/icon/logo-proypet.png'))),
            Expanded(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  InkWell(
                    child: Text('Inicio', style: TextStyle(color: colorBrown1)),
                    onTap: () => Get.toNamed('nav/inicio'),
                  ),
                  SizedBox(width: 20),
                  InkWell(
                    child: Text('Notificaciones',
                        style: TextStyle(color: colorBrown1)),
                    onTap: () => Get.toNamed('nav/notifica'),
                  ),
                  SizedBox(width: 20),
                  InkWell(
                    child: Text('Veterinarias',
                        style: TextStyle(color: colorBrown1)),
                    onTap: () => Get.toNamed('nav/lista'),
                  ),
                  SizedBox(width: 20),
                  InkWell(
                    child: Text('Puntos', style: TextStyle(color: colorBrown1)),
                    onTap: () => Get.toNamed('nav/recompensa'),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    ),
  );
}

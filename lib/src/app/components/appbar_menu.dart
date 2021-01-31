import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:proypet/config/global_variables.dart';
import 'package:proypet/src/app/styles/styles.dart';

Widget appbar(logo, String texto, List<Widget> acc) {
  return AppBar(
    leading: null,
    centerTitle: false,
    title: Row(children: [
      logo != null
          ? Padding(
              padding:
                  const EdgeInsets.only(top: 5, bottom: 5, right: 5, left: 2),
              child: Center(
                  child: ClipRRect(
                      child: Image(
                          height: 32,
                          image: AssetImage('images/proypet.png')))))
          : SizedBox(width: 0),
      Text(texto)
    ]),
    actions: acc,
  );
}

Widget navbar() {
  return PreferredSize(
    preferredSize: Size(mediaAncho, 1000),
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
                    onTap: () => Get.toNamed('navInicio'),
                  ),
                  SizedBox(width: 20),
                  InkWell(
                    child: Text('Notificaciones',
                        style: TextStyle(color: colorBrown1)),
                    onTap: () => Get.toNamed('navNotifica'),
                  ),
                  SizedBox(width: 20),
                  InkWell(
                    child: Text('Veterinarias',
                        style: TextStyle(color: colorBrown1)),
                    onTap: () => Get.toNamed('navLista'),
                  ),
                  SizedBox(width: 20),
                  InkWell(
                    child: Text('Puntos', style: TextStyle(color: colorBrown1)),
                    onTap: () => Get.toNamed('navRecompensa'),
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

final leadingH = SizedBox(width: 0);

final titleH = "Proypet";

final actionsH = <Widget>[
  IconButton(
    icon: Icon(Icons.widgets),
    onPressed: () {},
  )
];

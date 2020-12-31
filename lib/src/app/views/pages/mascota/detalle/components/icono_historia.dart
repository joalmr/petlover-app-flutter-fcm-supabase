import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:proypet/src/utils/icons_map.dart';

iconosHistoria(json) {
  List<String> listaIcon = [];
  if (json.toString().contains("grooming")) listaIcon.add("grooming");
  if (json.toString().contains("surgery")) listaIcon.add("surgery");
  if (json.toString().contains("deworming")) listaIcon.add("deworming");
  if (json.toString().contains("vaccination")) listaIcon.add("vaccination");
  if (json.toString().contains("consultation")) listaIcon.add("consultation");

  return Row(
    children: <Widget>[
      (json.toString().contains("grooming"))
          ? Padding(
              padding:
                  const EdgeInsets.symmetric(horizontal: 2.0, vertical: 2.0),
              child: Icon(
                iconMap["grooming"],
                size: 14.0,
                color: Get.textTheme.subtitle2.color,
              ),
            )
          : SizedBox(),
      (json.toString().contains("surgery"))
          ? Padding(
              padding:
                  const EdgeInsets.symmetric(horizontal: 2.0, vertical: 2.0),
              child: Icon(
                iconMap["surgery"],
                size: 14.0,
                color: Get.textTheme.subtitle2.color,
              ),
            )
          : SizedBox(),
      (json.toString().contains("deworming"))
          ? Padding(
              padding:
                  const EdgeInsets.symmetric(horizontal: 2.0, vertical: 2.0),
              child: Icon(
                iconMap["deworming"],
                size: 14.0,
                color: Get.textTheme.subtitle2.color,
              ),
            )
          : SizedBox(),
      (json.toString().contains("vaccination"))
          ? Padding(
              padding:
                  const EdgeInsets.symmetric(horizontal: 2.0, vertical: 2.0),
              child: Icon(
                iconMap["vaccination"],
                size: 14.0,
                color: Get.textTheme.subtitle2.color,
              ),
            )
          : SizedBox(),
      (json.toString().contains("consultation"))
          ? Padding(
              padding:
                  const EdgeInsets.symmetric(horizontal: 2.0, vertical: 2.0),
              child: Icon(
                iconMap["consultation"],
                size: 14.0,
                color: Get.textTheme.subtitle2.color,
              ),
            )
          : SizedBox(),
    ],
  );
}

import 'package:flutter/material.dart';
import 'package:get/get.dart';

Widget horarioW(dia, inicio, fin) {
  return Padding(
    padding: const EdgeInsets.symmetric(horizontal: 0.0),
    child: Column(
      children: <Widget>[
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 5.0, horizontal: 5),
          child: Row(
            children: <Widget>[
              Expanded(flex: 1, child: Text(dia)),
              Expanded(
                  child: Row(
                children: <Widget>[
                  Icon(Icons.schedule, color: Get.textTheme.subtitle2.color, size: 20.0),
                  SizedBox(width: 5),
                  Text(inicio == null ? "-" : inicio),
                  SizedBox(width: 5),
                  Text("-"),
                  SizedBox(width: 5),
                  Text(fin == null ? "-" : fin),
                ],
              ))
            ],
          ),
        ),
        Divider()
      ],
    ),
  );
}

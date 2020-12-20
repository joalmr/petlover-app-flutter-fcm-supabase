import 'package:flutter/material.dart';
import 'package:proypet/src/app/views/components/timeline_life.dart';

Widget generalTab() {
  DateTime fecha = DateTime.now().add(Duration(days: -900));

  return Container(
    height: double.maxFinite,
    child: timelineLife(dateBorn: fecha),
  );
}

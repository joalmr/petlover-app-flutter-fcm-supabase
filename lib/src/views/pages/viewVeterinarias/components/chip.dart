import 'package:flutter/material.dart';
import 'package:proypet/src/styles/styles.dart';
import 'package:proypet/src/utils/icons_map.dart';

chip(int servicio, context) {
  return Padding(
    padding: const EdgeInsets.symmetric(
      horizontal: 5.0,
    ),
    child: Chip(
      labelStyle: TextStyle(fontSize: sizeSmallx2, color: Colors.black54),
      labelPadding: EdgeInsets.only(left: 5.0, right: 2.5),
      // padding: EdgeInsets.zero,
      avatar: CircleAvatar(
        radius: 12.5,
        backgroundColor: colorMain, //colorBlue, //Colors.grey.shade800,
        child: Icon(iconNum[servicio], size: sizeSmallx1, color: Colors.white),
      ),
      label: Text(textMap[servicio],
          style: TextStyle(color: Theme.of(context).textTheme.subtitle2.color)),
    ),
  );
}

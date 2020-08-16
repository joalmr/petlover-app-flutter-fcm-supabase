import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:proypet/src2/utils/icons_map.dart';
import 'package:proypet/src2/app/styles/styles.dart';

chip(context, int servicio) {
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
      label: Text(textMap[servicio], style: TextStyle(color: Get.textTheme.subtitle2.color)),
    ),
  );
}

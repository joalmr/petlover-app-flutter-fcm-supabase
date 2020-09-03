import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:proypet/icons/icon_proypet_icons.dart';
import 'package:proypet/src/app/styles/styles.dart';

consulta(data) {
  return Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    mainAxisAlignment: MainAxisAlignment.start,
    children: <Widget>[
      Row(
        children: <Widget>[
          Icon(IconProypet.consulta, size: 16.0, color: Get.textTheme.subtitle2.color),
          SizedBox(
            width: 10.0,
          ),
          Text(
            'Consulta',
            style: Get.textTheme.subtitle1.apply(fontWeightDelta: 2),
          ),
        ],
      ),
      SizedBox(
        height: 10,
      ),
      Text(
        "Recomendación",
        style: TextStyle(fontWeight: FontWeight.bold, fontSize: sizeSmallx2),
      ),
      Text((data["recommendations"] != null) ? data["recommendations"] : "-"),
      // Text(
      //   "Atendido por",
      //   style: TextStyle(fontWeight: FontWeight.bold, fontSize: sizeSmallx2),
      // ),
      // Text((data["employee"] != null) ? data["employee"] : "-"),
      Divider(),
      Container(width: double.infinity, padding: EdgeInsets.symmetric(horizontal: 20.0), child: Text(data["amount"].toString(), textAlign: TextAlign.right))
    ],
  );
}

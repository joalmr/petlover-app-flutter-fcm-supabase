import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:proypet/design/styles/styles.dart';
import 'package:proypet/icons/icon_proypet_icons.dart';

cirugia(data) {
  return Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    mainAxisAlignment: MainAxisAlignment.start,
    children: <Widget>[
      Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children: <Widget>[
              Icon(
                IconProypet.cirugia,
                size: 12.0,
                color: Get.textTheme.subtitle2.color,
              ),
              SizedBox(width: 10.0),
              Text(
                'Cirugía',
                style: Get.textTheme.subtitle2
                    .apply(fontWeightDelta: 2)
                    .copyWith(fontSize: 12),
              ),
            ],
          ),
          Text(
            data["amount"] ?? '-',
            textAlign: TextAlign.right,
            style: TextStyle(fontSize: 12),
          ),
        ],
      ),
      SizedBox(height: 10),
      Text(
        "Recomendación",
        style: TextStyle(
          fontWeight: FontWeight.bold,
          fontSize: sizeSmallx2,
        ),
      ),
      Text(
        data["recommendations"] ?? '-',
        style: TextStyle(fontSize: 12),
      ),
      SizedBox(height: 10),
    ],
  );
}

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:proypet/icons/icon_proypet_icons.dart';

Widget precio(tipo, desde, hasta) {
  if (desde == "" && hasta == "") {
    return SizedBox(
      width: 0,
      height: 0,
    );
  } else {
    return Padding(
        padding: const EdgeInsets.all(8.0),
        child: Card(
          // elevation: .0,
          child: Container(
            width: 145,
            padding: EdgeInsets.symmetric(vertical: 10.0, horizontal: 10.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Text(
                  tipo,
                  style: TextStyle(color: Get.textTheme.subtitle2.color),
                ),
                SizedBox(height: 5),
                Text(
                  "desde",
                  style: TextStyle(color: Get.textTheme.subtitle2.color),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[
                    Icon(
                      IconProypet.sol_moneda,
                      color: Get.textTheme.subtitle2.color,
                      size: 14.0,
                    ),
                    (desde != "")
                        ? Text(
                            ' $desde ',
                            style:
                                TextStyle(color: Get.textTheme.subtitle2.color),
                          )
                        : SizedBox(width: 0),
                    (desde != "" && hasta != "")
                        ? Text(
                            "-",
                            style:
                                TextStyle(color: Get.textTheme.subtitle2.color),
                          )
                        : SizedBox(width: 0),
                    (desde == "" && hasta != "")
                        ? Text(
                            "0 -",
                            style:
                                TextStyle(color: Get.textTheme.subtitle2.color),
                          )
                        : SizedBox(width: 0),
                    (hasta != "")
                        ? Text(
                            ' $hasta ',
                            style:
                                TextStyle(color: Get.textTheme.subtitle2.color),
                          )
                        : SizedBox(width: 0),
                  ],
                ),
              ],
            ),
          ),
        ));
  }
}

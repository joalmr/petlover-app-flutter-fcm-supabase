import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:proypet/config/global_variables.dart';
import 'package:proypet/src/app/styles/styles.dart';
import 'package:proypet/src/app/views/pages/mascota/historia/components/cirugia.dart';
import 'package:proypet/src/app/views/pages/mascota/historia/components/consulta.dart';
import 'package:proypet/src/app/views/pages/mascota/historia/components/desparasitacion.dart';
import 'package:proypet/src/app/views/pages/mascota/historia/components/grooming.dart';
import 'package:proypet/src/app/views/pages/mascota/historia/components/vacuna.dart';

Widget timeline({
  @required Widget circleData,
  @required int dayData,
  String detailData,
  @required int indexData,
  @required int listLength,
  @required int monthData,
  String priceData,
  Widget subtitleIndex,
  timeData,
  @required String titleIndex,
  @required int yearPreviou,
  @required int yearValue,
}) {
  String dia;
  String mes;
  dayData < 10 ? dia = '0$dayData' : dia = '$dayData';
  monthData < 10 ? mes = '0$monthData' : mes = '$monthData';

  Map<String, dynamic> jsonData;
  try {
    jsonData = jsonDecode(detailData);
  } catch (e) {
    jsonData = null;
  }

  return Container(
    child: Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        indexData == 0 ? _years(DateTime.now().year) : SizedBox(height: 0),
        yearPreviou != 0 && (yearPreviou != yearValue)
            ? _years(yearValue)
            : SizedBox(height: 0),
        Row(
          children: [
            Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  '$dia-$mes',
                  style: TextStyle(
                    fontSize: 10,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                timeData != null
                    ? Text(
                        '$timeData',
                        style: TextStyle(
                          fontSize: 10,
                        ),
                        textAlign: TextAlign.center,
                      )
                    : SizedBox(height: 0),
              ],
            ),
            Column(
              children: [
                Container(
                  width: 1,
                  height: 30,
                  color: Get.theme.iconTheme.color,
                ),
                Padding(
                  padding: const EdgeInsets.all(2),
                  child: Container(
                    margin: EdgeInsets.only(left: 5, right: 5),
                    padding: EdgeInsets.all(1),
                    decoration: BoxDecoration(
                      color: indexData == 0
                          ? colorMain
                          : Get.theme.iconTheme.color,
                      borderRadius: BorderRadius.circular(50),
                    ),
                    child: circleData,
                  ),
                ),
                Container(
                  width: 1,
                  height: 30,
                  color: indexData == listLength - 1
                      ? Colors.transparent
                      : Get.theme.iconTheme.color,
                )
              ],
            ),
            Expanded(
              child: Container(
                child: Card(
                  child: ExpansionTile(
                    backgroundColor: Colors.transparent,
                    title: Text(
                      titleIndex,
                      style: Get.textTheme.subtitle2
                          .apply(fontWeightDelta: 2)
                          .copyWith(fontSize: 12),
                      maxLines: 2,
                    ),
                    subtitle: subtitleIndex,
                    childrenPadding: EdgeInsets.all(8),
                    children: [
                      jsonData == null
                          ? SizedBox(
                              height: 20,
                              width: double.maxFinite,
                              child: Container(
                                color: colorRed,
                                child: Center(
                                  child: Text(
                                    'Error',
                                    style: TextStyle(color: Colors.white),
                                  ),
                                ),
                              ),
                            )
                          : _service(jsonData),
                      Container(
                        width: double.infinity,
                        padding: EdgeInsets.only(right: 20.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: <Widget>[
                            Text(
                              "Precio",
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                color: Get.textTheme.subtitle2.color,
                              ),
                            ),
                            Text(
                              priceData,
                              textAlign: TextAlign.right,
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                color: Get.textTheme.subtitle2.color,
                              ),
                            ),
                          ],
                        ),
                      ),
                      Container(
                        width: double.infinity,
                        padding: EdgeInsets.only(right: 20.0, top: 2),
                        child: Row(
                          children: <Widget>[
                            Icon(FontAwesomeIcons.coins,
                                size: 12, color: colorMain),
                            SizedBox(width: 2.5),
                            Text(
                              "Ganaste ${double.parse(priceData).floor()} ${double.parse(priceData).floor() != 1 ? 'puntos' : 'puntos'}",
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                color: Get.textTheme.subtitle2.color,
                              ),
                            ),
                          ],
                        ),
                      ),
                      appPruebas
                          ? Align(
                              widthFactor: double.maxFinite,
                              alignment: Alignment.centerRight,
                              child: IconButton(
                                iconSize: 22,
                                icon: Icon(Icons.help_outline),
                                onPressed: () {},
                                tooltip: 'Ayuda',
                              ),
                            )
                          : SizedBox(height: 0)
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ],
    ),
  );
}

Widget _service(jsonData) {
  return Column(
    children: [
      jsonData.containsKey('grooming')
          ? banio(jsonData['grooming'])
          : SizedBox(height: 0),
      jsonData.containsKey('deworming')
          ? desparasita(jsonData["deworming"])
          : SizedBox(height: 0),
      jsonData.containsKey('vaccination')
          ? vacuna(jsonData["vaccination"])
          : SizedBox(height: 0),
      jsonData.containsKey('consultation')
          ? consulta(jsonData["consultation"])
          : SizedBox(height: 0),
      jsonData.containsKey('surgery')
          ? cirugia(jsonData["surgery"])
          : SizedBox(height: 0)
    ],
  );
}

Widget _years(dataYear) {
  return Row(
    mainAxisAlignment: MainAxisAlignment.start,
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          SizedBox(height: 10),
          Padding(
            padding: EdgeInsets.only(left: 30),
            child: Text(
              '$dataYear',
              style: TextStyle(
                fontSize: 14,
                fontWeight: FontWeight.bold,
                letterSpacing: 2.2,
                color: colorMain,
              ),
            ),
          ),
        ],
      ),
      Expanded(
        child: SizedBox(height: 25),
      ),
    ],
  );
}

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:proypet/src/app/styles/styles.dart';

Widget timelineVacuna({
  @required Widget circleData,
  @required int dayData,
  @required Function functionData,
  @required int indexData,
  @required int listLength,
  @required int monthData,
  timeData,
  @required List<dynamic> titleIndex,
  @required int yearPreviou,
  @required int yearValue,
}) {
  String dia;
  String mes;
  dayData < 10 ? dia = '0$dayData' : dia = '$dayData';
  monthData < 10 ? mes = '0$monthData' : mes = '$monthData';

  titleIndex.map((item) => Text(item)).toList().cast<Widget>();

  return Container(
    child: Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        indexData == 0 ? _years(DateTime.now().year) : SizedBox(height: 0),
        yearPreviou != yearValue ? _years(yearValue) : SizedBox(height: 0),
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
                  child: ListTile(
                    onTap: functionData,
                    title: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: titleIndex
                          .map((item) => Text(
                                '· $item',
                                style: TextStyle(fontSize: 10),
                              ))
                          .toList()
                          .cast<Widget>(),
                    ),
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

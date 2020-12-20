import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:proypet/src/app/styles/styles.dart';

Widget timelineLife({
  @required DateTime dateBorn,
  bool petStatus,
}) {
  print(dateBorn);

  int firstYear = dateBorn.year;
  int firstMonth = dateBorn.month;
  int lastYear = dateBorn.year + 20;

  DateTime today = DateTime.now();
  int todayYear = today.year;
  int todayMonth = today.month;

  List<Widget> timeline = List<Widget>();

  for (var i = firstYear; i < lastYear; i++) {
    if (i > firstYear) firstMonth = 1;
    for (var j = firstMonth; j <= 12; j++) {
      Widget item = Container(
        // color: colorYellow,
        child: Row(
          children: [
            Container(
              width: 30,
              height: 1,
              color: Get.theme.iconTheme.color,
            ),
            (todayYear == i && todayMonth == j)
                ? Padding(
                    padding: const EdgeInsets.all(2),
                    child: Container(
                      margin: EdgeInsets.only(left: 5, right: 5),
                      padding: EdgeInsets.all(1),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(50),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.all(2.0),
                        child: Image(
                          height: 55,
                          image: AssetImage('images/gif/perro-kb.gif'),
                        ),
                      ),
                    ),
                  )
                : Padding(
                    padding: const EdgeInsets.all(2),
                    child: Container(
                      margin: EdgeInsets.only(left: 5, right: 5),
                      padding: EdgeInsets.all(1),
                      decoration: BoxDecoration(
                        color: colorGreen2,
                        borderRadius: BorderRadius.circular(50),
                      ),
                      child: Text('$j'),
                    ),
                  ),
            Container(
              width: 30,
              height: 1,
              color: Get.theme.iconTheme.color,
            ),
          ],
        ),
      );

      timeline.add(item);
    }
  }

  // ScrollController _scroll = ;
  return ListView(
    scrollDirection: Axis.horizontal,
    // controller: ,
    children: timeline,
  );
}

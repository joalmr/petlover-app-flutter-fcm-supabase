import 'package:dotted_line/dotted_line.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:proypet/config/path_variables.dart';
import 'package:proypet/src/app/styles/styles.dart';
import 'package:proypet/src/controllers/mascota_controller/detalle_mascota_controller.dart';
import 'package:scrollable_positioned_list/scrollable_positioned_list.dart';

import '../data/months.dart';

class FnTimeLine extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GetBuilder<MascotaDetalleController>(
      builder: (_) {
        DateTime dateBornConverted =
            DateFormat('yyyy-MM-dd').parse(_.pet.birthdate);

        int firstYear = dateBornConverted.year;
        int firstMonth = dateBornConverted.month;

        int lastYear = dateBornConverted.year +
            ((DateTime.now().year - dateBornConverted.year) + 1);

        int todayYear = _.today.year;
        int todayMonth = _.today.month;

        List<Widget> timeline = List<Widget>();

        int scrollCount = 0;

        for (var i = firstYear; i <= lastYear; i++) {
          if (i > firstYear) firstMonth = 1;
          for (var j = firstMonth; j <= 12; j++) {
            Widget item = Container(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  SizedBox(height: 5),
                  Container(
                    height: 30,
                    child: Text(
                      (j == 1 || (i == firstYear && j == firstMonth))
                          ? '$i'
                          : '',
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                  ),
                  Row(
                    children: [
                      Container(
                        width: 30,
                        child: DottedLine(
                          direction: Axis.horizontal,
                          lineLength: double.infinity,
                          lineThickness: 1.0,
                          dashLength: 1.0,
                          dashColor: Get.theme.iconTheme.color,
                          dashRadius: 0.0,
                          dashGapLength: 4.0,
                          dashGapColor: Colors.transparent,
                          dashGapRadius: 0.0,
                        ),
                      ),
                      InkWell(
                        onTap: () {
                          // print('$i $j');
                          _.tempYear.value = i.toString();
                          _.tempMonth.value = mes[j];
                          _.historyDate(i.toString(), j.toString());
                        },
                        child: (todayYear == i && todayMonth == j)
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
                                      height: 50,
                                      image: AssetImage(
                                        _.pet.specieId == 1
                                            ? _.pet.status == 0
                                                ? 'images/cat_dog/cat-death.png'
                                                : pathGif('gato-kb')
                                            : _.pet.status == 0
                                                ? 'images/cat_dog/dog-death.png'
                                                : pathGif('perro-kb'),
                                      ),
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
                                    color: colorGray2,
                                    borderRadius: BorderRadius.circular(50),
                                  ),
                                  child: Padding(
                                    padding: const EdgeInsets.all(2.0),
                                    child: CircleAvatar(
                                      radius: 25,
                                      backgroundColor: colorGray2,
                                      child: Text('${mes[j]}'),
                                    ),
                                  ),
                                ),
                              ),
                      ),
                      Container(
                        width: 30,
                        child: DottedLine(
                          direction: Axis.horizontal,
                          lineLength: double.infinity,
                          lineThickness: 1.0,
                          dashLength: 1.0,
                          dashColor: Get.theme.iconTheme.color,
                          dashRadius: 0.0,
                          dashGapLength: 4.0,
                          dashGapColor: Colors.transparent,
                          dashGapRadius: 0.0,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            );

            if (todayYear == i && todayMonth == j)
              _.scrollInit = scrollCount;
            else
              scrollCount++;
            timeline.add(item);
          }
        }

        return Container(
          height: 100.0,
          child: ScrollablePositionedList.builder(
            scrollDirection: Axis.horizontal,
            itemCount: timeline.length,
            itemBuilder: (context, index) => timeline[index],
            initialScrollIndex: _.scrollInit,
            itemScrollController: _.itemScrollController,
            itemPositionsListener: _.itemPositionsListener,
          ),
        );
      },
    );
  }
}

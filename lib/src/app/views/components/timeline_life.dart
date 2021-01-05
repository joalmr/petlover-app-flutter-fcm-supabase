import 'package:dotted_line/dotted_line.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:proypet/src/app/styles/styles.dart';
import 'package:proypet/src/controllers/mascota_controller/detalle_mascota_controller.dart';
import 'package:scrollable_positioned_list/scrollable_positioned_list.dart';

Widget timelineLife({
  @required DateTime dateBorn,
  int petStatus,
}) {
  int firstYear = dateBorn.year;
  int firstMonth = dateBorn.month;

  int lastYear = dateBorn.year + ((DateTime.now().year - dateBorn.year) + 2);

  DateTime today = DateTime.now();
  int todayYear = today.year;
  int todayMonth = today.month;

  List<Widget> timeline = List<Widget>();
  List<Widget> contentLife = List<Widget>();

  contentLife = [
    Card(
      child: ExpansionTile(
        title: Text(
          'Data..',
          style: Get.textTheme.subtitle2.apply(fontWeightDelta: 2),
          maxLines: 2,
        ),
        subtitle: Text('data..'),
        expandedCrossAxisAlignment: CrossAxisAlignment.start,
        childrenPadding: EdgeInsets.only(left: 10, right: 10.0, top: 2),
        children: [
          Text('data'),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text('Precio'),
              Text('data'),
            ],
          ),
          Container(
            width: double.infinity,
            padding: EdgeInsets.only(top: 2, bottom: 10),
            child: Row(
              children: <Widget>[
                Icon(FontAwesomeIcons.coins, size: 12, color: colorMain),
                SizedBox(width: 2.5),
                Text(
                  "Ganaste ... puntos",
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    color: Get.textTheme.subtitle2.color,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    ),
    Card(
      child: ExpansionTile(
        title: Text(
          'Data..',
          style: Get.textTheme.subtitle2.apply(fontWeightDelta: 2),
          maxLines: 2,
        ),
        subtitle: Text('data..'),
        children: [
          Text('data'),
          Text('data'),
        ],
      ),
    ),
    Card(
      child: ExpansionTile(
        title: Text(
          'Data..',
          style: Get.textTheme.subtitle2.apply(fontWeightDelta: 2),
          maxLines: 2,
        ),
        subtitle: Text('data..'),
        children: [
          Text('data'),
          Text('data'),
        ],
      ),
    ),
    Card(
      child: ExpansionTile(
        title: Text(
          'Data..',
          style: Get.textTheme.subtitle2.apply(fontWeightDelta: 2),
          maxLines: 2,
        ),
        subtitle: Text('data..'),
        children: [
          Text('data'),
          Text('data'),
        ],
      ),
    ),
    Card(
      child: ExpansionTile(
        title: Text(
          'Data..',
          style: Get.textTheme.subtitle2.apply(fontWeightDelta: 2),
          maxLines: 2,
        ),
        subtitle: Text('data..'),
        children: [
          Text('data'),
          Text('data'),
        ],
      ),
    ),
    Card(
      child: ExpansionTile(
        title: Text(
          'Data..',
          style: Get.textTheme.subtitle2.apply(fontWeightDelta: 2),
          maxLines: 2,
        ),
        subtitle: Text('data..'),
        children: [
          Text('data'),
          Text('data'),
        ],
      ),
    ),
  ];

  var mes = [
    null,
    'Ene',
    'Feb',
    'Mar',
    'Abr',
    'May',
    'Jun',
    'Jul',
    'Ago',
    'Sep',
    'Oct',
    'Nov',
    'Dic'
  ];
  int scrollInit = 0;
  int scrollCount = 0;

  RxString tempYear = todayYear.toString().obs;
  RxString tempMonth = mes[todayMonth].obs;

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
                (j == 1 || (i == firstYear && j == firstMonth)) ? '$i' : '',
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
                  // height: 1,
                  // color: Get.theme.iconTheme.color,
                ),
                InkWell(
                  onTap: () {
                    print('$i $j');
                    tempYear.value = i.toString();
                    tempMonth.value = mes[j];
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
                                image: AssetImage(petStatus == 1
                                    ? 'images/gif/gato-kb.gif'
                                    : 'images/gif/perro-kb.gif'),
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
                  // height: 1,
                  // color: Get.theme.iconTheme.color,
                ),
              ],
            ),
          ],
        ),
      );

      if (todayYear == i && todayMonth == j)
        scrollInit = scrollCount;
      else
        scrollCount++;
      timeline.add(item);
    }
  }

  return GetX<MascotaDetalleController>(
    builder: (_) {
      return CustomScrollView(
        slivers: [
          SliverToBoxAdapter(
            child: Container(
              height: 100.0,
              child: ScrollablePositionedList.builder(
                scrollDirection: Axis.horizontal,
                itemCount: timeline.length,
                itemBuilder: (context, index) => timeline[index],
                initialScrollIndex: scrollInit,
              ),
            ),
          ),
          SliverToBoxAdapter(
            child: Container(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Padding(
                    padding: EdgeInsets.only(top: 10, left: 10),
                    child: Text(
                      '${tempMonth.value}. ${tempYear.value}',
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                  ),
                  ListView.builder(
                    padding: EdgeInsets.zero,
                    physics: NeverScrollableScrollPhysics(),
                    shrinkWrap: true,
                    itemCount: contentLife.length,
                    itemBuilder: (BuildContext context, int index) {
                      return contentLife[index];
                    },
                  ),
                ],
              ),
            ),
          ),
          SliverToBoxAdapter(
            child: Center(
              child: InkWell(
                onTap: _.goToHistory,
                child: Padding(
                  padding: EdgeInsets.only(top: 20, bottom: 40),
                  child: Text(
                    'Ver todas las atenciones',
                    style: TextStyle(color: colorMain),
                  ),
                ),
              ),
            ),
          ),
        ],
      );
    },
  );
}

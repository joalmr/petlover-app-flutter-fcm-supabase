import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:proypet/icons/icon_proypet_icons.dart';
import 'package:proypet/src/app/styles/styles.dart';

import 'data/data-cartilla.dart';

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
              dataYear,
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

Widget cartillaDigital() {
  return Column(
    children: [
      Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 2),
        child: Card(
          elevation: 2,
          color: colorMain,
          child: ListTile(
            contentPadding:
                const EdgeInsets.symmetric(horizontal: 10, vertical: 0),
            leading: CircleAvatar(
              radius: 20,
              backgroundColor: colorGreen3,
              child: Icon(
                IconProypet.vacuna,
                color: Colors.white,
                size: 20,
              ),
            ),
            title: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Text(
                  'Próxima vacuna',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 10,
                  ),
                ),
                Text(
                  '30-11-2020',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 14,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
            subtitle: Text(
              'Vacuna lestospira',
              style: TextStyle(
                color: Colors.white,
                fontSize: 12,
              ),
              maxLines: 2,
            ),
          ),
        ),
      ),
      Expanded(
        child: ListView.builder(
          itemCount: vacunaLista.length,
          padding: EdgeInsets.only(top: 0),
          itemBuilder: (BuildContext context, int index) {
            final fecha = vacunaLista[index].dateIn;
            final firstYear = vacunaLista[0].dateIn.split('-')[2];
            final dataYear = fecha.split('-')[2];
            return Container(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  index == 0 ? _years(dataYear) : SizedBox(height: 0),
                  firstYear != dataYear
                      ? _years(dataYear)
                      : SizedBox(height: 0),
                  Row(
                    children: [
                      Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            '${fecha.split('-')[0]}-${fecha.split('-')[1]}',
                            style: TextStyle(
                              fontSize: 10,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
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
                                color: index == 0
                                    ? colorMain
                                    : Get.theme.iconTheme.color,
                                borderRadius: BorderRadius.circular(50),
                              ),
                              child: CircleAvatar(
                                backgroundColor: colorMain,
                                child: Icon(
                                  IconProypet.vacuna,
                                  size: 18,
                                  color: colorGray1,
                                ),
                                radius: 20.0,
                              ),
                            ),
                          ),
                          Container(
                            width: 1,
                            height: 30,
                            color: index == vacunaLista.length - 1
                                ? Colors.transparent
                                : Get.theme.iconTheme.color,
                          )
                        ],
                      ),
                      Expanded(
                        child: Container(
                          child: Card(
                            child: Container(
                              height: 50,
                              padding: EdgeInsets.symmetric(
                                  horizontal: 10, vertical: 5),
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    vacunaLista[index].name,
                                    style: Get.textTheme.subtitle2
                                        .apply(fontWeightDelta: 2),
                                    maxLines: 2,
                                  ),
                                ],
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
          },
        ),
      ),
    ],
  );
}

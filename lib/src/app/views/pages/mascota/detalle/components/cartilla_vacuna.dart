import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:proypet/icons/icon_proypet_icons.dart';
import 'package:proypet/src/app/styles/styles.dart';

Widget cartillaDigital() {
  return SingleChildScrollView(
    child: Column(
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
          child: Card(
            elevation: 2,
            color: colorMain,
            child: ListTile(
              leading: CircleAvatar(
                radius: 30,
                backgroundColor: colorGreen3,
                child: Icon(
                  IconProypet.vacuna,
                  color: Colors.white,
                  size: 28,
                ),
              ),
              title: Text(
                '30-11-2020',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
              subtitle: Text(
                'Vacuna lestospira',
                style: TextStyle(
                  color: Colors.white,
                ),
                maxLines: 2,
              ),
            ),
          ),
        ),
        ListView.builder(
          itemCount: 50,
          physics: NeverScrollableScrollPhysics(),
          padding: EdgeInsets.only(top: 0),
          shrinkWrap: true,
          itemBuilder: (BuildContext context, int index) {
            return Card(
              child: ListTile(
                // leading: CircleAvatar(
                //   backgroundColor: colorMain,
                //   child: Icon(IconProypet.vacuna, color: colorGray1),
                // ),
                title: Text(
                  'Vacuna $index Vacuna $index Vacuna $index Vacuna $index Vacuna $index',
                  maxLines: 2,
                  style: Get.textTheme.subtitle2.apply(fontWeightDelta: 2),
                ),
                subtitle: Text(
                  '12-12-2020',
                  style: TextStyle(fontSize: 12),
                ),
                trailing: Column(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      'Refuerzo',
                      style: TextStyle(
                        color: colorRed,
                        fontSize: 10,
                      ),
                    ),
                    Text(
                      '12-12-2021',
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                  ],
                ),
              ),
            );
          },
        ),
      ],
    ),
  );
}

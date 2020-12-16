import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:proypet/icons/icon_proypet_icons.dart';
import 'package:proypet/src/app/styles/styles.dart';

import 'data/data-cartilla.dart';

Widget cartillaDigital() {
  return Column(
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
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
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
      Expanded(
        child: ListView.builder(
          itemCount: vacunaLista.length,
          padding: EdgeInsets.only(top: 0),
          itemBuilder: (BuildContext context, int index) {
            return Card(
              child: ListTile(
                title: Text(
                  vacunaLista[index].name,
                  maxLines: 2,
                  style: Get.textTheme.subtitle2.apply(fontWeightDelta: 2),
                ),
                subtitle: Row(
                  children: [
                    Icon(
                      IconProypet.vacuna,
                      size: 12,
                    ),
                    Text(
                      vacunaLista[index].dateIn,
                      style: TextStyle(fontSize: 12),
                    ),
                  ],
                ),
                // trailing: Column(
                //   crossAxisAlignment: CrossAxisAlignment.end,
                //   mainAxisAlignment: MainAxisAlignment.center,
                //   children: [
                //     Text(
                //       'Refuerzo',
                //       style: TextStyle(
                //         color: colorRed,
                //         fontSize: 10,
                //       ),
                //     ),
                //     Text(
                //       vacunaLista[index].dateReturn,
                //       style: TextStyle(fontWeight: FontWeight.bold),
                //     ),
                //   ],
                // ),
              ),
            );
          },
        ),
      ),
    ],
  );
}

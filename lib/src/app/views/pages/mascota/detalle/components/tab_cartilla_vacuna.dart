import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:proypet/icons/icon_proypet_icons.dart';
import 'package:proypet/src/app/styles/styles.dart';
import 'package:proypet/src/app/views/components/timeline.dart';
import 'data/data-cartilla.dart';

Widget cartillaDigitalTab() {
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
            String dmyString = vacunaLista[index].dateIn;
            DateTime dateTime = DateFormat('dd-MM-yyyy').parse(dmyString);

            return timeline(
              circleData: CircleAvatar(
                backgroundColor: colorMain,
                child: Icon(
                  IconProypet.vacuna,
                  size: 18,
                  color: colorGray1,
                ),
                radius: 20.0,
              ),
              dayData: dateTime.day,
              monthData: dateTime.month,
              functionData: () {},
              indexData: index,
              listLength: vacunaLista.length,
              titleIndex: vacunaLista[index].name,
              yearValue: dateTime.year,
            );
          },
        ),
      ),
    ],
  );
}

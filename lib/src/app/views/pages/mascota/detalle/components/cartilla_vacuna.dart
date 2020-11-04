import 'package:flutter/material.dart';
import 'package:proypet/icons/icon_proypet_icons.dart';
import 'package:proypet/src/app/styles/styles.dart';

Widget cartillaDigital() {
  return SingleChildScrollView(
    child: Column(
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 7.5),
          child: Card(
            elevation: 2,
            color: colorMain,
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: CircleAvatar(
                    radius: 30,
                    backgroundColor: colorGreen3,
                    child: Icon(
                      IconProypet.vacuna,
                      color: Colors.white,
                      size: 28,
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Text(
                        '30-11-2020',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Text(
                        'Vacuna lestospira',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 12,
                        ),
                      ),
                    ],
                  ),
                )
              ],
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10),
          child: ListView.separated(
            itemCount: 50,
            physics: NeverScrollableScrollPhysics(),
            padding: EdgeInsets.only(top: 0),
            shrinkWrap: true,
            separatorBuilder: (BuildContext context, int index) {
              return Divider();
            },
            itemBuilder: (BuildContext context, int index) {
              return Text('datos $index');
            },
          ),
        ),
        // ListView.builder(
        //   itemCount: 50,
        //   physics: NeverScrollableScrollPhysics(),
        //   padding: EdgeInsets.only(top: 0),
        //   shrinkWrap: true,
        //   itemBuilder: (BuildContext context, int index) {
        //     return Text('datos $index');
        //   },
        // ),
      ],
    ),
  );
}

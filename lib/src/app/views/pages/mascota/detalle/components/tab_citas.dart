import 'package:flutter/material.dart';
import 'package:proypet/icons/icon_proypet_icons.dart';
import 'package:proypet/src/app/styles/styles.dart';

Widget citasTab() {
  return ListView.builder(
    padding: EdgeInsets.zero,
    itemCount: 4,
    itemBuilder: (BuildContext context, int index) {
      return Card(
        elevation: 2,
        child: ListTile(
          contentPadding:
              const EdgeInsets.symmetric(horizontal: 10, vertical: 0),
          leading: CircleAvatar(
            radius: 20,
            backgroundColor: colorGreen2,
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
                  fontSize: 10,
                ),
              ),
              Text(
                '30-11-2020',
                style: TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),
          subtitle: Text(
            'Vacuna lestospira',
            style: TextStyle(
              fontSize: 12,
            ),
            maxLines: 2,
          ),
        ),
      );
    },
  );
}

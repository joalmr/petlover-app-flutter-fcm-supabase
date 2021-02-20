import 'package:flutter/material.dart';

cardFaq({@required String title, @required String description}) {
  return Card(
    margin: EdgeInsets.symmetric(horizontal: 10, vertical: 5),
    child: ExpansionTile(
      leading: Icon(Icons.help_outline_rounded),
      title: Text(title),
      expandedCrossAxisAlignment: CrossAxisAlignment.start,
      childrenPadding:
          EdgeInsets.only(left: 10, right: 10.0, top: 2, bottom: 10),
      children: [
        Text(description),
      ],
    ),
  );
}

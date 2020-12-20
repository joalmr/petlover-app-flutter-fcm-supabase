import 'package:flutter/material.dart';
import 'package:proypet/src/app/styles/styles.dart';

Widget generalTab() {
  return Container(
    color: colorBlue,
    height: double.maxFinite,
    child: ListView.builder(
      scrollDirection: Axis.horizontal,
      itemCount: 20,
      itemBuilder: (BuildContext context, int index) {
        return Center(
          child: Text('data $index'),
        );
      },
    ),
  );
}

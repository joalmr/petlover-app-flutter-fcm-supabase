import 'package:flutter/material.dart';

Widget appbar(logo, String texto, List<Widget> acc) {
  return AppBar(
    leading: logo,
    title: Text(texto),
    actions: acc,
  );
}

final leadingH = Container(
    margin: EdgeInsets.all(.5),
    child: ClipRRect(
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 5.0),
        child: Center(child: Image(image: AssetImage('images/proypet.png'))),
      ),
    ));

final titleH = "Proypet";

final actionsH = <Widget>[
  IconButton(
    icon: Icon(Icons.widgets),
    onPressed: () {},
  )
];

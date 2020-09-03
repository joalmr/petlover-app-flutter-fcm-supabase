import 'package:flutter/material.dart';

Widget appbar(logo, String texto, List<Widget> acc) {
  return AppBar(
    leading: null,
    title: Row(
      children: [
        logo != null
            ? Padding(
                padding: const EdgeInsets.only(top: 5, bottom: 5, right: 5, left: 2),
                child: Center(
                  child: ClipRRect(
                    child: Image(
                      height: 32,
                      image: AssetImage('images/proypet.png'),
                    ),
                  ),
                ),
              )
            : SizedBox(width: 0),
        Text(texto),
      ],
    ),
    actions: acc,
  );
}

final leadingH = SizedBox(width: 0);
// Container(
// margin: EdgeInsets.all(.5),
// child: ClipRRect(
// child: Padding(
// padding: const EdgeInsets.symmetric(vertical: 5.0),
// child: Center(
// child: Image(
// height: 30,
// image: AssetImage('images/proypet.png'),
// ),
// ),
// ),
// ));

final titleH = "Proypet";

final actionsH = <Widget>[
  IconButton(
    icon: Icon(Icons.widgets),
    onPressed: () {},
  )
];

import 'package:flutter/material.dart';
import 'package:proypet/src/models/home_model.dart';

Widget usuario(UserHome usuario, context) {
  return Row(
    mainAxisAlignment: MainAxisAlignment.spaceBetween,
    children: <Widget>[
      Text(usuario.name,
          style:
              Theme.of(context).textTheme.headline4.apply(fontWeightDelta: 2)),
    ],
  );
}

import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:proypet/src/data/models/notification/notificacion_model.dart';
import 'package:proypet/src/data/services/establishment/establishment_service.dart';
import 'package:proypet/src/utils/add_msg.dart';

import '../build_noti.dart';
import 'dart:math' as Math;

Widget proximaCita(Notificacion notification) {
  notification.message =
      '${notification.message} ${thxNoti[Math.Random().nextInt(thxNoti.length)]}';
  return buildNoti(notification,
      () => _fnEstablecimiento(notification.options["establishment_id"]));
}

_fnEstablecimiento(id) async {
  final establecimientoProvider = EstablishmentService();
  Map veterinaria = await establecimientoProvider.getVet(id);
  if (veterinaria['status'] == 200) {
    await Get.toNamed('vetdetalle', arguments: veterinaria['establishment'].id);
  } else {
    Get.dialog(FadeIn(
      child: SimpleDialog(
        contentPadding: EdgeInsets.all(20.0),
        children: <Widget>[
          SizedBox(height: 10.0),
          Text('Lo sentimos, esta veterinaria ya no forma parte de proypet'),
          Center(
              child: Image(
                  height: 200,
                  width: 200,
                  image: AssetImage("images/gato-error.png"))),
        ],
      ),
    ));
  }
}

import 'package:flutter/material.dart';
import 'package:proypet/src/data/models/model/notificacion/notificacion_model.dart';
import 'package:proypet/src/utils/add_msg.dart';

import '../build_noti.dart';
import 'dart:math' as Math;

Widget reservaCercana(Notificacion notification) {
  notification.message = '${notification.message} ${thxNoti[Math.Random().nextInt(thxNoti.length)]}';
  return buildNoti(notification, () {});
}

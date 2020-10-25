import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:proypet/src/data/models/model/notificacion/notificacion_model.dart';
import 'package:proypet/src/utils/icons_map.dart';

import '../build_noti.dart';

Widget recordatorio(Notificacion notification) {
  return buildNoti(notification, () => _fnRecordatorio(notification.options["slug"]));
}

_fnRecordatorio(String slug) {
  Get.toNamed('navLista', arguments: {
    "filtros": [slugNum[slug]]
  });
}

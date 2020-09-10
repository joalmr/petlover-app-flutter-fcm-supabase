import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:proypet/src/data/models/model/notificacion/notificacion_model.dart';
import 'package:proypet/src/data/services/establecimiento_service.dart';
import 'package:proypet/src/utils/icons_map.dart';

import 'build_noti.dart';

notificacionCase(Notificacion notificacion) {
  switch (notificacion.type) {
    case "ComingBooking":
      return _comingBooking(notificacion);
      break;
    case "NextDate":
      return _nextDate(notificacion);
      break;
    case "Recordatory":
      return _recordatory(notificacion);
      break;
    default:
      return SizedBox(height: 0.0);
      break;
  }
}

//reserva cercana
_comingBooking(Notificacion notification) {
  return buildNoti(notification, () {});
}

//proxima cita
_nextDate(Notificacion notification) {
  return buildNoti(notification, () => _fnEstablecimiento(notification.options["establishment_id"]));
}

//vacuna, desparasitacion
_recordatory(Notificacion notification) {
  return buildNoti(notification, () => _fnRecordatorio(notification.options["slug"]));
}

_fnEstablecimiento(id) async {
  final establecimientoProvider = EstablecimientoService();
  Map veterinaria = await establecimientoProvider.getVet(id);
  if (veterinaria['status'] == 200) {
    await Get.toNamed('vetdetalle', arguments: veterinaria['establishment']);
  } else {
    Get.dialog(FadeIn(
      child: SimpleDialog(
        contentPadding: EdgeInsets.all(20.0),
        children: <Widget>[
          SizedBox(height: 10.0),
          Text('Lo sentimos, esta veterinaria ya no forma parte de proypet'),
          Center(child: Image(height: 200, width: 200, image: AssetImage("images/gato-error.png"))),
        ],
      ),
    ));
  }
}

_fnRecordatorio(String slug) {
  Get.toNamed('navLista', arguments: {
    "filtros": [slugNum[slug]]
  });
}

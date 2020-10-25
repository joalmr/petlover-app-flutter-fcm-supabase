import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:proypet/src/controllers/home_controller/home_controller.dart';
import 'package:proypet/src/controllers/notificacion_controller/notificacion_controller.dart';
import 'chequeo_preventivo/chequeo_preventivo.dart';
import 'cumpleanos/cumpleanos.dart';
import 'marketing/marketing.dart';
import 'proxima_cita/proxima_cita.dart';
import 'recordatorio/recordatorio.dart';
import 'reserva_cercana/reserva_cercana.dart';
import 'reserva_confirmada/reserva_confirmada.dart';
import 'reserva_reprogramada/reserva_reprogramada.dart';
import 'vacuna_refuerzo/vacuna_refuerzo.dart';

class BuildPushNoti extends StatelessWidget {
  final dynamic noti;
  final String mensaje;
  BuildPushNoti({@required this.noti, @required this.mensaje});

  final homeC = Get.find<HomeController>();
  final notificacionC = Get.find<NotificacionController>();

  @override
  Widget build(BuildContext context) {
    return _fnNoti(noti, context);
  }

  _fnNoti(noti, context) {
    switch (noti['type']) {
      case "Marketing":
        {
          notificacionC.getNotificacion();
          return marketing(noti);
        }
        break;
      case "ComingBooking":
        return reservaCercana(noti);
        break;
      case "NextDate":
        return proximaCita(noti);
        break;
      case "Recordatory":
        return recordatorio(noti);
        break;
      case "BookingConfirmed":
        {
          homeC.getSummary();
          return reservaConfirmada(noti);
        }
        break;
      case "BookingRescheduled":
        {
          homeC.getSummary();
          return reservaReprogramada(noti);
        }
        break;
      case "Birthday":
        return cumpleanos(noti);
        break;
      case "PreventiveCheck":
        return chequeoPreventivo(noti);
        break;
      case "VaccineReinforcement":
        return fuerzoVacuna(noti);
        break;
      default:
        return SizedBox(height: 0.0);
        break;
    }
  }
}

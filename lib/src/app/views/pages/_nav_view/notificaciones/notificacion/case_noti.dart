import 'package:flutter/material.dart';
import 'package:proypet/src/data/providers/notification/model/notificacion_model.dart';

import 'marketing/marketing.dart';
import 'proxima_cita/proxima_cita.dart';
import 'recordatorio/recordatorio.dart';
import 'reserva_cercana/reserva_cercana.dart';

notificacionCase(Notificacion notificacion) {
  switch (notificacion.type) {
    case "Marketing":
      return marketing(notificacion);
      break;
    case "ComingBooking":
      return reservaCercana(notificacion);
      break;
    case "NextDate":
      return proximaCita(notificacion);
      break;
    case "Recordatory":
      return recordatorio(notificacion);
      break;
    default:
      return SizedBox(height: 0.0);
      break;
  }
}

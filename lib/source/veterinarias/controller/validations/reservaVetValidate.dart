import 'package:intl/intl.dart';
import 'package:proypet/source/veterinarias/controller/data/horario.dart';
import 'package:time_parser/time_parser.dart';

//hasFechaHora
bool valFechaHora(fecha, hora) => fecha.trim().isEmpty || hora.trim().isEmpty;

//fechaTime
DateTime valFechaTime(fecha, hora) => DateTime.parse(fecha + " " + hora);

//fechaTimeAt
String valFechaTimeAt(fechaTime) =>
    DateFormat('yyyy-MM-dd HH:mm:ss').format(fechaTime);

//isDateOk
bool valIsDateOk(fechaTimeAt, fechaTime) {
  bool respuesta = true;
  DateTime now = DateTime.now();
  String formattedDate = DateFormat('yyyy-MM-dd').format(now);
  if (formattedDate == fechaTimeAt.split(' ')[0] &&
      fechaTime.hour < (now.hour - 1)) {
    respuesta = false;
  }
  return respuesta;
}

//isDayOk
bool valIsDayOk(fechaTime, vet) {
  int day = fechaTime.weekday;
  var horario = vet.schedule;
  var takeHora = horario[textHorario[day]];

  if (takeHora['attention'] == 'on')
    return true;
  else
    return false;
}

//isHourOk
bool valIsHourOk(fechaTime, vet, hora) {
  int day = fechaTime.weekday;
  var horario = vet.schedule;
  var takeHora = horario[textHorario[day]];

  var time0 = TimeParser.parse(hora);
  var time1 = TimeParser.parse(takeHora['time_start']);
  var time2 = TimeParser.parse(takeHora['time_end']);

  var hora0 = time0.hours * 60 + time0.minutes;
  var horaInicio = time1.hours * 60 + time1.minutes;
  var horaFin = time2.hours * 60 + time2.minutes;

  if (takeHora['attention'] == 'on') {
    if (horaInicio <= hora0 && hora0 < horaFin)
      return true;
    else
      return false;
  } else
    return false;
}

String valReservarBooking(
  hasFechaHora, //fecha, hora
  isDateOk, //fechaTimeAt, fechaTime
  conDelivery,
  isDeliveryOk,
  isDayOk, //fechaTime, vet
  isHourOk, //fechaTime, vet, hora
) {
  if (hasFechaHora) return "error1";
  if (!isDateOk) return "error2";
  if (conDelivery) {
    if (!isDeliveryOk) return "error3";
    if (!isDayOk) return "error4";
    if (!isHourOk) return "error5";
    // ejecutaReserva();
    return "ok";
  } else {
    // if (!isDeliveryOk) return "error3";
    if (!isDayOk) return "error4";
    if (!isHourOk) return "error5";
    // ejecutaReserva();
    return "ok";
  }
}

//Debe ingresar fecha y hora de la reserva
//La hora debe ser mayor
//Debe ingresar la dirección para el servicio de movilidad
//La veterinaria no atiende en este horario, seleccione entre este rango de horas $takeHora
//La veterinaria no atiende el día seleccionado

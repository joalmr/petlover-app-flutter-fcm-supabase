import 'package:flutter/foundation.dart';
import 'package:intl/intl.dart';

String formatDateTime(DateTime dateTime) {
  String formattedDate = DateFormat('dd-MM-yyyy HH:mm').format(dateTime);
  return formattedDate;
}

String formatDate(DateTime dateTime) {
  String formattedDate = DateFormat('dd-MM-yyyy').format(dateTime);
  return formattedDate;
}

String formatDateBasic(DateTime dateTime) {
  String formattedDate = DateFormat('yyyy-MM-dd').format(dateTime);
  return formattedDate;
}

String formatTime(DateTime dateTime) {
  String formattedDate = DateFormat('HH:mm').format(dateTime);
  return formattedDate;
}

DateTime toDate(String valor) {
  DateTime tempDate = new DateFormat("dd-MM-yyyy").parse(valor);
  return tempDate;
}
DateTime toDateBasic(String valor) {
  DateTime tempDate = new DateFormat("yyyy-MM-dd").parse(valor);
  return tempDate;
}

String formatDateOut({
  @required String valor,
  @required String formatIn,
  @required String formatOut,
}) {
  DateTime tempDate = DateFormat(formatIn).parse(valor);
  String tempDateString = DateFormat(formatOut).format(tempDate);

  return tempDateString;
}
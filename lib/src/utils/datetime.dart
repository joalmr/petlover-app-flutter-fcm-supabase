import 'package:intl/intl.dart';

formatDateTime(DateTime dateTime) {
  String formattedDate = DateFormat('dd-MM-yyyy HH:mm').format(dateTime);
  return formattedDate;
}

formatDate(DateTime dateTime) {
  String formattedDate = DateFormat('dd-MM-yyyy').format(dateTime);
  return formattedDate;
}

formatTime(DateTime dateTime) {
  String formattedDate = DateFormat('HH:mm').format(dateTime);
  return formattedDate;
}

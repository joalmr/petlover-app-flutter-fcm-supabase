calculateAge(DateTime birthDate) {
  if (birthDate == null) return "No definido";
  String resp;
  int edad, mes, dia, diferencia;
  DateTime currentDate = DateTime.now();
  Duration difference = currentDate.difference(birthDate);
  diferencia = difference.inDays;
  edad = diferencia ~/ 365;
  mes = (diferencia ~/ 30) % 12;
  dia = ((diferencia % 365) % 30);

  String rAnio = ' años';
  String rMes = ' meses';
  String rDia = ' días';

  if (edad == 1) rAnio = ' año';
  if (mes == 1) rMes = ' mes';
  if (dia == 1) rDia = ' día';

  if (edad == 0 && mes > 0) {
    resp = mes.toString() + rMes;
  }
  if (edad == 0 && mes == 0) {
    resp = dia.toString() + rDia;
  }
  if (edad > 0 && mes == 0) {
    resp = edad.toString() + rAnio;
  }
  if (edad > 0 && mes > 0) {
    resp = edad.toString() + rAnio + ' ' + mes.toString() + rMes;
  }

  return resp;
}

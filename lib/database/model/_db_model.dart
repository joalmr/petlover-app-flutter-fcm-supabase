class LocalNotification {
  final int id;
  final String type; //descripcion
  final DateTime dateTime; //dia de registro
  final int frecuency; //frecuencia de aviso

  LocalNotification({
    this.id,
    this.type,
    this.dateTime,
    this.frecuency,
  });

  factory LocalNotification.fromJson(Map<String, dynamic> json) =>
      LocalNotification(
        id: json["id"],
        type: json["type"],
        dateTime: json["dateTime"],
        frecuency: json["frecuency"],
      );

  Map<String, dynamic> toJson() => {
        'id': id,
        'type': type,
        'dateTime': dateTime.toString(),
        'frecuency': frecuency,
      };
}

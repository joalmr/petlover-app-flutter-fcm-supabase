// To parse this JSON data, do
//
//     final notificacionModel = notificacionModelFromJson(jsonString);

import 'dart:convert';

NotificacionModel notificacionModelFromJson(String str) =>
    NotificacionModel.fromJson(json.decode(str));

String notificacionModelToJson(NotificacionModel data) =>
    json.encode(data.toJson());

class NotificacionModel {
  List<Notificacion> notifications;

  NotificacionModel({
    this.notifications,
  });

  factory NotificacionModel.fromJson(Map<String, dynamic> json) =>
      NotificacionModel(
        notifications: List<Notificacion>.from(
            json["notifications"].map((x) => Notificacion.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "notifications":
            List<dynamic>.from(notifications.map((x) => x.toJson())),
      };
}

class Notificacion {
  String id;
  String type;
  String notificationImg;
  String petPicture;
  String message;
  dynamic options;

  Notificacion({
    this.id,
    this.type,
    this.notificationImg,
    this.petPicture,
    this.message,
    this.options,
  });

  factory Notificacion.fromJson(Map<String, dynamic> json) => Notificacion(
        id: json["id"],
        type: json["type"],
        notificationImg: json["notification_image"],
        petPicture: json["pet_picture"],
        message: json["message"],
        options: json["options"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "type": type,
        "pet_picture": petPicture,
        "message": message,
        // "options": List<dynamic>.from(options.map((x) => x)),
      };
}

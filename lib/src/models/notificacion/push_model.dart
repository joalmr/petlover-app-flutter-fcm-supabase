import 'dart:convert';

NotificacionPush notificacionPushFromJson(String str) => NotificacionPush.fromJson(json.decode(str));

String notificacionPushToJson(NotificacionPush data) => json.encode(data.toJson());

class NotificacionPush {
  NotificacionPush({
    this.to,
    this.notification,
    this.data,
  });

  String to;
  Notification notification;
  Data data;

  factory NotificacionPush.fromJson(Map<String, dynamic> json) => NotificacionPush(
        to: json["to"],
        notification: Notification.fromJson(json["notification"]),
        data: Data.fromJson(json["data"]),
      );

  Map<String, dynamic> toJson() => {
        "to": to,
        "notification": notification.toJson(),
        "data": data.toJson(),
      };
}

class Data {
  Data({
    this.clickAction,
    this.id,
    this.notificationType,
    this.notificationImage,
    this.type,
    this.petPicture,
    this.message,
    this.options,
  });

  String clickAction;
  String id;
  String notificationType;
  String notificationImage;
  String type;
  String petPicture;
  String message;
  Options options;

  factory Data.fromJson(Map<String, dynamic> json) => Data(
        clickAction: json["click_action"],
        id: json["id"],
        notificationType: json["notification_type"],
        notificationImage: json["notification_image"],
        type: json["type"],
        petPicture: json["pet_picture"],
        message: json["message"],
        options: Options.fromJson(json["options"]),
      );

  Map<String, dynamic> toJson() => {
        "click_action": clickAction,
        "id": id,
        "notification_type": notificationType,
        "notification_image": notificationImage,
        "type": type,
        "pet_picture": petPicture,
        "message": message,
        "options": options.toJson(),
      };
}

class Options {
  Options({
    this.establishmentId,
    this.nextdate,
    this.reason,
    this.slug,
  });

  String establishmentId;
  DateTime nextdate;
  String reason;
  String slug;

  factory Options.fromJson(Map<String, dynamic> json) => Options(
        establishmentId: json["establishment_id"],
        nextdate: DateTime.parse(json["nextdate"]),
        reason: json["reason"],
        slug: json["slug"],
      );

  Map<String, dynamic> toJson() => {
        "establishment_id": establishmentId,
        "nextdate": "${nextdate.year.toString().padLeft(4, '0')}-${nextdate.month.toString().padLeft(2, '0')}-${nextdate.day.toString().padLeft(2, '0')}",
        "reason": reason,
        "slug": slug,
      };
}

class Notification {
  Notification({
    this.title,
    this.body,
  });

  String title;
  String body;

  factory Notification.fromJson(Map<String, dynamic> json) => Notification(
        title: json["title"],
        body: json["body"],
      );

  Map<String, dynamic> toJson() => {
        "title": title,
        "body": body,
      };
}

import 'dart:convert';

BonificacionModel bonificacionModelFromJson(String str) => BonificacionModel.fromJson(json.decode(str));

String bonificacionModelToJson(BonificacionModel data) => json.encode(data.toJson());

class BonificacionModel {
  List<Bonification> bonifications;
  int points;

  BonificacionModel({
    this.bonifications,
    this.points,
  });

  factory BonificacionModel.fromJson(Map<String, dynamic> json) => BonificacionModel(
        bonifications: List<Bonification>.from(json["bonifications"].map((x) => Bonification.fromJson(x))),
        points: json["points"],
      );

  Map<String, dynamic> toJson() => {
        "bonifications": List<dynamic>.from(bonifications.map((x) => x.toJson())),
        "points": points,
      };
}

class Bonification {
  String establishmentName;
  int points;

  Bonification({
    this.establishmentName,
    this.points,
  });

  factory Bonification.fromJson(Map<String, dynamic> json) => Bonification(
        establishmentName: json["establishment_name"],
        points: json["points"],
      );

  Map<String, dynamic> toJson() => {
        "establishment_name": establishmentName,
        "points": points,
      };
}

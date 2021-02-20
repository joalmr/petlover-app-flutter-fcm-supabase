import 'dart:convert';

List<BonificacionTop> bonificacionTopFromJson(String str) => List<BonificacionTop>.from(json.decode(str).map((x) => BonificacionTop.fromJson(x)));

String bonificacionTopToJson(List<BonificacionTop> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class BonificacionTop {
  BonificacionTop({
    this.user,
    this.pets,
    this.points,
    this.cup,
  });

  String user;
  List<String> pets;
  int points;
  bool cup;

  factory BonificacionTop.fromJson(Map<String, dynamic> json) => BonificacionTop(
        user: json["user"],
        pets: List<String>.from(json["pets"].map((x) => x)),
        points: json["points"],
        cup: json["cup"],
      );

  Map<String, dynamic> toJson() => {
        "user": user,
        "pets": List<dynamic>.from(pets.map((x) => x)),
        "points": points,
        "cup": cup,
      };
}

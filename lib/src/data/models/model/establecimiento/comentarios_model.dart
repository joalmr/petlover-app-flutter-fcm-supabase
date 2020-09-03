import 'dart:convert';

List<Comentarios> comentariosFromJson(String str) => List<Comentarios>.from(
    json.decode(str).map((x) => Comentarios.fromJson(x)));

String comentariosToJson(List<Comentarios> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class Comentarios {
  Comentarios({
    this.stars,
    this.comment,
    this.date,
    this.user,
    this.pet,
    this.petPicture,
  });

  int stars;
  String comment;
  DateTime date;
  String user;
  String pet;
  String petPicture;

  factory Comentarios.fromJson(Map<String, dynamic> json) => Comentarios(
        stars: json["stars"],
        comment: json["comment"],
        date: DateTime.parse(json["date"]),
        user: json["user"],
        pet: json["pet"],
        petPicture: json["pet_picture"],
      );

  Map<String, dynamic> toJson() => {
        "stars": stars,
        "comment": comment,
        "date": date.toIso8601String(),
        "user": user,
        "pet": pet,
        "pet_picture": petPicture,
      };
}

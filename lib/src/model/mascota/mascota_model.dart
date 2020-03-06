// To parse this JSON data, do
//
//     final mascotaModel = mascotaModelFromJson(jsonString);

import 'dart:convert';

MascotaModel mascotaModelFromJson(String str) => MascotaModel.fromJson(json.decode(str));

String mascotaModelToJson(MascotaModel data) => json.encode(data.toJson());

class MascotaModel {
    String id;
    String name;
    String breed;
    String specie;
    int weight;
    DateTime birthdate;
    String picture;
    String condition;
    int status;

    MascotaModel({
        this.id,
        this.name,
        this.breed,
        this.specie,
        this.weight,
        this.birthdate,
        this.picture,
        this.condition,
        this.status,
    });

    factory MascotaModel.fromJson(Map<String, dynamic> json) => MascotaModel(
        id: json["id"],
        name: json["name"],
        breed: json["breed"],
        specie: json["specie"],
        weight: json["weight"],
        birthdate: json["birthdate"] == null ? null : DateTime.parse(json["birthdate"]),
        picture: json["picture"],
        condition: json["condition"],
        status: json["status"],
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "breed": breed,
        "specie": specie,
        "weight": weight,
        "birthdate": birthdate.toIso8601String(),
        "picture": picture,
        "condition": condition,
        "status": status,
    };
}

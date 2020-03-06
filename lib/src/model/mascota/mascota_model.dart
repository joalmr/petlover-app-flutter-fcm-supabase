// To parse this JSON data, do
//
//     final mascotaModel = mascotaModelFromJson(jsonString);

import 'dart:convert';

MascotaModel mascotaModelFromJson(String str) => MascotaModel.fromJson(json.decode(str));

String mascotaModelToJson(MascotaModel data) => json.encode(data.toJson());

class MascotaModel {
    String id;
    String name;
    int specieId;
    String specieName;
    int breedId;
    String breedName;
    int weight;
    DateTime birthdate;
    String picture;
    String condition;
    int status;

    MascotaModel({
        this.id,
        this.name,
        this.specieId,
        this.specieName,
        this.breedId,
        this.breedName,
        this.weight,
        this.birthdate,
        this.picture,
        this.condition,
        this.status,
    });

    factory MascotaModel.fromJson(Map<String, dynamic> json) => MascotaModel(
        id: json["id"],
        name: json["name"],
        specieId: json["specie_id"],
        specieName: json["specie_name"],
        breedId: json["breed_id"],
        breedName: json["breed_name"],
        weight: json["weight"],
        birthdate: json["birthdate"] == null ? null : DateTime.parse(json["birthdate"]),
        picture: json["picture"],
        condition: json["condition"],
        status: json["status"],
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "specie_id": specieId,
        "specie_name": specieName,
        "breed_id": breedId,
        "breed_name": breedName,
        "weight": weight,
        "birthdate": birthdate.toIso8601String(),
        "picture": picture,
        "condition": condition,
        "status": status,
    };
}

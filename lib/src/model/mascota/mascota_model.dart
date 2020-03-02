// To parse this JSON data, do
//
//     final mascotaModel = mascotaModelFromJson(jsonString);

import 'dart:convert';

MascotaModel mascotaModelFromJson(String str) => MascotaModel.fromJson(json.decode(str));

String mascotaModelToJson(MascotaModel data) => json.encode(data.toJson());

class MascotaModel {
    List<Pet> pets;

    MascotaModel({
        this.pets,
    });

    factory MascotaModel.fromJson(Map<String, dynamic> json) => MascotaModel(
        pets: List<Pet>.from(json["pets"].map((x) => Pet.fromJson(x))),
    );

    Map<String, dynamic> toJson() => {
        "pets": List<dynamic>.from(pets.map((x) => x.toJson())),
    };
}

class Pet {
    int id;
    String name;
    String breed;
    String specie;
    int weight;
    DateTime birthdate;
    String picture;
    String status;

    Pet({
        this.id,
        this.name,
        this.breed,
        this.specie,
        this.weight,
        this.birthdate,
        this.picture,
        this.status,
    });

    factory Pet.fromJson(Map<String, dynamic> json) => Pet(
        id: json["id"],
        name: json["name"],
        breed: json["breed"],
        specie: json["specie"],
        weight: json["weight"],
        birthdate: DateTime.parse(json["birthdate"]),
        picture: json["picture"],
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
        "status": status,
    };
}

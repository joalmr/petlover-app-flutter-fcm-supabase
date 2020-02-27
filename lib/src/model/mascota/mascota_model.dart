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
    int typeId;
    int breedId;
    String name;
    int genre;
    DateTime birthdate;
    String picture;
    int status;
    DateTime createdAt;
    DateTime updatedAt;
    dynamic deletedAt;
    Pivot pivot;

    Pet({
        this.id,
        this.typeId,
        this.breedId,
        this.name,
        this.genre,
        this.birthdate,
        this.picture,
        this.status,
        this.createdAt,
        this.updatedAt,
        this.deletedAt,
        this.pivot,
    });

    factory Pet.fromJson(Map<String, dynamic> json) => Pet(
        id: json["id"],
        typeId: json["type_id"],
        breedId: json["breed_id"],
        name: json["name"],
        genre: json["genre"],
        birthdate: DateTime.parse(json["birthdate"]),
        picture: json["picture"],
        status: json["status"],
        createdAt: DateTime.parse(json["created_at"]),
        updatedAt: DateTime.parse(json["updated_at"]),
        deletedAt: json["deleted_at"],
        pivot: Pivot.fromJson(json["pivot"]),
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "type_id": typeId,
        "breed_id": breedId,
        "name": name,
        "genre": genre,
        "birthdate": birthdate.toIso8601String(),
        "picture": picture,
        "status": status,
        "created_at": createdAt.toIso8601String(),
        "updated_at": updatedAt.toIso8601String(),
        "deleted_at": deletedAt,
        "pivot": pivot.toJson(),
    };
}

class Pivot {
    int userId;
    int petId;
    DateTime createdAt;
    DateTime updatedAt;

    Pivot({
        this.userId,
        this.petId,
        this.createdAt,
        this.updatedAt,
    });

    factory Pivot.fromJson(Map<String, dynamic> json) => Pivot(
        userId: json["user_id"],
        petId: json["pet_id"],
        createdAt: DateTime.parse(json["created_at"]),
        updatedAt: DateTime.parse(json["updated_at"]),
    );

    Map<String, dynamic> toJson() => {
        "user_id": userId,
        "pet_id": petId,
        "created_at": createdAt.toIso8601String(),
        "updated_at": updatedAt.toIso8601String(),
    };
}

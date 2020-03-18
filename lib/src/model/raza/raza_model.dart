// To parse this JSON data, do
//
//     final razaModel = razaModelFromJson(jsonString);

import 'dart:convert';

RazaModel razaModelFromJson(String str) => RazaModel.fromJson(json.decode(str));

String razaModelToJson(RazaModel data) => json.encode(data.toJson());

class RazaModel {
    List<Breed> breeds;

    RazaModel({
        this.breeds,
    });

    factory RazaModel.fromJson(Map<String, dynamic> json) => RazaModel(
        breeds: List<Breed>.from(json["breeds"].map((x) => Breed.fromJson(x))),
    );

    Map<String, dynamic> toJson() => {
        "breeds": List<dynamic>.from(breeds.map((x) => x.toJson())),
    };
}

class Breed {
    int id;
    String name;

    Breed({
        this.id,
        this.name,
    });

    factory Breed.fromJson(Map<String, dynamic> json) => Breed(
        id: json["id"],
        name: json["name"],
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
    };
}

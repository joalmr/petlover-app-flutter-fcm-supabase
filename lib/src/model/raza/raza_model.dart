// To parse this JSON data, do
//
//     final razaModel = razaModelFromJson(jsonString);

import 'dart:convert';

RazaModel razaModelFromJson(String str) => RazaModel.fromJson(json.decode(str));

String razaModelToJson(RazaModel data) => json.encode(data.toJson());

class RazaModel {
    String id;
    String name;

    RazaModel({
        this.id,
        this.name,
    });

    factory RazaModel.fromJson(Map<String, dynamic> json) => RazaModel(
        id: json["id"].toString(),
        name: json["name"],
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
    };
}

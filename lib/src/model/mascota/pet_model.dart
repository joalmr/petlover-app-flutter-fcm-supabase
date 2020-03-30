// To parse this JSON data, do
//
//     final petModel = petModelFromJson(jsonString);

import 'dart:convert';

import 'package:proypet/src/model/mascota/historia_model.dart';
import 'package:proypet/src/model/mascota/mascota_model.dart';

PetModel petModelFromJson(String str) => PetModel.fromJson(json.decode(str));

String petModelToJson(PetModel data) => json.encode(data.toJson());

class PetModel {
    MascotaModel pet;
    List<HistoriaModel> history;

    PetModel({
        this.pet,
        this.history,
    });

    factory PetModel.fromJson(Map<String, dynamic> json) => PetModel(
        pet: MascotaModel.fromJson(json["pet"]),
        history: List<HistoriaModel>.from(json["history"].map((x) => HistoriaModel.fromJson(x))),
    );

    Map<String, dynamic> toJson() => {
        "pet": pet.toJson(),
        "history": List<dynamic>.from(history.map((x) => x)),
    };
}

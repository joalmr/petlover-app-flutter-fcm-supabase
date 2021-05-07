// To parse this JSON data, do
//
//     final preferenciasModel = preferenciasModelFromJson(jsonString);

import 'dart:convert';

PreferenciasModel preferenciasModelFromJson(String str) => PreferenciasModel.fromJson(json.decode(str));
String preferenciasModelToJson(PreferenciasModel data) => json.encode(data.toJson());

class PreferenciasModel {
    List<String> favoritesVets;

    PreferenciasModel({
        this.favoritesVets,
    });

    factory PreferenciasModel.fromJson(Map<String, dynamic> json) => PreferenciasModel(
        favoritesVets: List<String>.from(json["favorites_vets"].map((x) => x)),
    );

    Map<String, dynamic> toJson() => {
        "favorites_vets": List<dynamic>.from(favoritesVets.map((x) => x)),
    };
}

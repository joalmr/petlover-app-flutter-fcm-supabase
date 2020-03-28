// To parse this JSON data, do
//
//     final establecimientoModel = establecimientoModelFromJson(jsonString);

import 'dart:convert';

import 'package:proypet/src/utils/utils.dart';

EstablecimientoModel establecimientoModelFromJson(String str) => EstablecimientoModel.fromJson(json.decode(str));

String establecimientoModelToJson(EstablecimientoModel data) => json.encode(data.toJson());

//
class EstablecimientoList {
  final List<EstablecimientoModel> establecimientos;

  EstablecimientoList({
    this.establecimientos,
  });

  factory EstablecimientoList.fromJson(List<dynamic> parsedJson) {

    List<EstablecimientoModel> establecimientos = new List<EstablecimientoModel>();
    establecimientos = parsedJson.map((i)=>EstablecimientoModel.fromJson(i)).toList();

    return new EstablecimientoList(
       establecimientos: establecimientos,
    );
  }
}

class EstablecimientoModel {
    String id;
    String name;
    dynamic description;
    int stars;
    int votes;
    String address;
    double latitude;
    double longitude;
    List<String> slides;
    String logo;
    List<Service> services;
    String distancia;

    EstablecimientoModel({
        this.id,
        this.name,
        this.description,
        this.stars,
        this.votes,
        this.address,
        this.latitude,
        this.longitude,
        this.slides,
        this.logo,
        this.services,
        this.distancia,
    });

    factory EstablecimientoModel.fromJson(Map<String, dynamic> json) => EstablecimientoModel(
        id: json["id"],
        name: json["name"],
        description: json["description"]  == null ? "Descripción no detallada" : json["description"],
        stars: json["stars"],
        votes: json["votes"],
        address: json["address"],
        latitude: json["latitude"] == null ? 0.0 : json["latitude"].toDouble(),
        longitude: json["longitude"] == null ? 0.0 : json["longitude"].toDouble(),
        slides: List<String>.from(json["slides"].map((x) => x)),
        logo: json["logo"],
        services: List<Service>.from(json["services"].map((x) => Service.fromJson(x))),
        distancia: "",
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "description": description,
        "stars": stars,
        "votes": votes,
        "address": address,
        "latitude": latitude,
        "longitude": longitude,
        "slides": List<dynamic>.from(slides.map((x) => x)),
        "logo": logo,
        "services": List<dynamic>.from(services.map((x) => x.toJson())),
    };
}

class Service {
    int id;
    String name;
    String slug;
    String description;

    Service({
        this.id,
        this.name,
        this.slug,
        this.description,
    });

    factory Service.fromJson(Map<String, dynamic> json) => Service(
        id: json["id"],
        name: json["name"],
        slug: json["slug"],
        description: json["description"],
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "slug": slug,
        "description": description,
    };
}

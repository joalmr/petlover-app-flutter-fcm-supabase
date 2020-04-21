// To parse this JSON data, do
//
//     final establecimientoModel = establecimientoModelFromJson(jsonString);

import 'dart:convert';

// import 'package:proypet/src/preferencias_usuario/preferencias_usuario.dart';
// import 'package:proypet/src/utils/utils.dart';

EstablecimientoModel establecimientoModelFromJson(String str) => EstablecimientoModel.fromJson(json.decode(str));

String establecimientoModelToJson(EstablecimientoModel data) => json.encode(data.toJson());

// final _prefs = new PreferenciasUsuario();
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
    String phone;
    String description;
    String stars;
    int votes;
    String address;
    double latitude;
    double longitude;
    List<String> slides;
    String logo;
    dynamic prices;
    List<Service> services;
    String distance;
    dynamic schedule;

    EstablecimientoModel({
        this.id,
        this.name,
        this.phone,
        this.description,
        this.stars,
        this.votes,
        this.address,
        this.latitude,
        this.longitude,
        this.slides,
        this.logo,
        this.prices,
        this.services,
        this.distance,
        this.schedule,
    });

    factory EstablecimientoModel.fromJson(Map<String, dynamic> json) => EstablecimientoModel(
        id: json["id"],
        name: json["name"],
        phone: json["phone"] == null ? "" : json["phone"],
        description: json["description"]  == null ? "Descripción no detallada" : json["description"],
        stars: json["stars"] == null ? "" : json["stars"],
        votes: json["votes"] == null ? "" : json["votes"],
        address: json["address"] == null ? "" : json["address"],
        latitude: json["latitude"] == null ? 0.0 : json["latitude"].toDouble(),
        longitude: json["longitude"] == null ? 0.0 : json["longitude"].toDouble(),
        slides: List<String>.from(json["slides"].map((x) => x)),
        logo: json["logo"],
        prices: json["prices"],
        services: List<Service>.from(json["services"].map((x) => Service.fromJson(x))),
        distance: json["distance"] == null ? "" : json["distance"].toDouble().toStringAsFixed(2),
        schedule: json["schedule"],
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "phone": phone,
        "description": description,
        "stars": stars,
        "votes": votes,
        "address": address,
        "latitude": latitude,
        "longitude": longitude,
        "slides": List<dynamic>.from(slides.map((x) => x)),
        "logo": logo,
        "prices": prices,
        "services": List<dynamic>.from(services.map((x) => x.toJson())),
        "distance": distance,
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

// class PricesClass {
//     Prices consultation;
//     Prices deworming;
//     Prices vaccination;
//     Prices surgery;
//     Prices grooming;
//     Prices supplementation;

//     PricesClass({
//         this.consultation,
//         this.deworming,
//         this.vaccination,
//         this.surgery,
//         this.grooming,
//         this.supplementation,
//     });

//     factory PricesClass.fromJson(Map<String, dynamic> json) => PricesClass(
//         consultation: Prices.fromJson(json["consultation"]),
//         deworming: Prices.fromJson(json["deworming"]),
//         vaccination: Prices.fromJson(json["vaccination"]),
//         surgery: Prices.fromJson(json["surgery"]),
//         grooming: Prices.fromJson(json["grooming"]),
//         supplementation: Prices.fromJson(json["supplementation"]),
//     );

//     Map<String, dynamic> toJson() => {
//         "consultation": consultation.toJson(),
//         "deworming": deworming.toJson(),
//         "vaccination": vaccination.toJson(),
//         "surgery": surgery.toJson(),
//         "grooming": grooming.toJson(),
//         "supplementation": supplementation.toJson(),
//     };
// }

// class Prices {
//     String from;
//     String to;

//     Prices({
//         this.from,
//         this.to,
//     });

//     factory Prices.fromJson(Map<String, dynamic> json) => Prices(
//         from: json["from"] == null ? null : json["from"],
//         to: json["to"] == null ? null : json["to"],
//     );

//     Map<String, dynamic> toJson() => {
//         "from": from == null ? null : from,
//         "to": to == null ? null : to,
//     };
// }
import 'dart:convert';

import 'establecimiento_model.dart';

EstablecimientoModel establecimientoModelFromJson(String str) => EstablecimientoModel.fromJson(json.decode(str));

String establecimientoModelToJson(EstablecimientoModel data) => json.encode(data.toJson());

//menos datos
EstablecimientoLess establecimientoLessFromJson(String str) => EstablecimientoLess.fromJson(json.decode(str));

class EstablecimientoList {
  final List<EstablecimientoModel> establecimientos;

  EstablecimientoList({
    this.establecimientos,
  });

  factory EstablecimientoList.fromJson(List<dynamic> parsedJson) {
    List<EstablecimientoModel> establecimientos = new List<EstablecimientoModel>();
    establecimientos = parsedJson.map((i) => EstablecimientoModel.fromJson(i)).toList();

    return new EstablecimientoList(
      establecimientos: establecimientos,
    );
  }
}

class EstablecimientoLess {
  String id;
  String name;
  String phone;
  String description;
  String stars;
  int votes;
  int attentions;
  String address;
  double latitude;
  double longitude;
  List<String> slides;
  String logo;
  String distance;

  EstablecimientoLess({
    this.id,
    this.name,
    this.phone,
    this.description,
    this.stars,
    this.votes,
    this.attentions,
    this.address,
    this.latitude,
    this.longitude,
    this.slides,
    this.logo,
    this.distance,
  });

  factory EstablecimientoLess.fromJson(Map<String, dynamic> json) => EstablecimientoLess(
        id: json["id"],
        name: json["name"],
        phone: json["phone"] == null ? "" : json["phone"],
        description: json["description"] == null ? "Descripción no detallada" : json["description"],
        stars: json["stars"] == null ? "" : json["stars"],
        votes: json["votes"] == null ? "" : json["votes"],
        attentions: json["attentions"] == null ? 0 : json["attentions"],
        address: json["address"] == null ? "" : json["address"],
        latitude: json["latitude"] == null ? 0.0 : json["latitude"].toDouble(),
        longitude: json["longitude"] == null ? 0.0 : json["longitude"].toDouble(),
        slides: List<String>.from(json["slides"].map((x) => x)),
        logo: json["logo"],
        distance: json["distance"] == null ? "" : json["distance"].toDouble().toStringAsFixed(2),
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
        "distance": distance,
      };
}

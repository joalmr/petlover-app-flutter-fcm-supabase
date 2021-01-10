class EstablecimientoModel implements Comparable<EstablecimientoModel> {
  String id;
  bool premium;
  bool available;
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
  dynamic prices;
  List<Service> services;
  String distance;
  dynamic schedule;

  EstablecimientoModel({
    this.id,
    this.premium,
    this.available,
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
    this.prices,
    this.services,
    this.distance,
    this.schedule,
  });

  factory EstablecimientoModel.fromJson(Map<String, dynamic> json) =>
      EstablecimientoModel(
        id: json["id"],
        premium: json["premium"],
        available: json["available"],
        name: json["name"],
        phone: json["phone"] == null ? "" : json["phone"],
        description: json["description"] == null
            ? "Descripción no detallada"
            : json["description"],
        stars: json["stars"] == null ? "" : json["stars"],
        votes: json["votes"] == null ? "" : json["votes"],
        attentions: json["attentions"] == null ? 0 : json["attentions"],
        address: json["address"] == null ? "" : json["address"],
        latitude: json["latitude"] == null ? 0.0 : json["latitude"].toDouble(),
        longitude:
            json["longitude"] == null ? 0.0 : json["longitude"].toDouble(),
        slides: List<String>.from(json["slides"].map((x) => x)),
        logo: json["logo"],
        prices: json["prices"],
        services: List<Service>.from(
            json["services"].map((x) => Service.fromJson(x))),
        distance: json["distance"] == null
            ? ""
            : json["distance"].toDouble().toStringAsFixed(2),
        schedule: json["schedule"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "premium": premium,
        "available": available,
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

  @override
  int compareTo(EstablecimientoModel other) {
    double first = double.parse(stars);
    double second = double.parse(other.stars);
    if (second > first) {
      return second.round();
    } else {
      double resp = second - first;
      int dato = resp.round();
      return dato;
    }
  }
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

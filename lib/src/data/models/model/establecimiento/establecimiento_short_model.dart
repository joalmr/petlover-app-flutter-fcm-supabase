class EstablecimientoShortModel
    implements Comparable<EstablecimientoShortModel> {
  String id;
  bool premium;
  bool available;
  String name;
  String stars;
  int attentions;
  String address;
  double latitude;
  double longitude;
  List<String> slides;
  String logo;
  String distance;
  // String phone;
  // String description;
  // int votes;
  // dynamic prices;
  // List<Service> services;
  // dynamic schedule;

  EstablecimientoShortModel({
    this.id,
    this.premium,
    this.available,
    this.name,
    this.stars,
    this.attentions,
    this.address,
    this.latitude,
    this.longitude,
    this.slides,
    this.logo,
    this.distance,
    // this.phone,
    // this.description,
    // this.votes,
    // this.prices,
    // this.services,
    // this.schedule,
  });

  factory EstablecimientoShortModel.fromJson(Map<String, dynamic> json) =>
      EstablecimientoShortModel(
        id: json["id"],
        premium: json["premium"],
        available: json["available"],
        name: json["name"],
        stars: json["stars"] == null ? "" : json["stars"],
        attentions: json["attentions"] == null ? 0 : json["attentions"],
        address: json["address"] == null ? "" : json["address"],
        latitude: json["latitude"] == null ? 0.0 : json["latitude"].toDouble(),
        longitude:
            json["longitude"] == null ? 0.0 : json["longitude"].toDouble(),
        slides: List<String>.from(json["slides"].map((x) => x)),
        logo: json["logo"],
        distance: json["distance"] == null
            ? ""
            : json["distance"].toDouble().toStringAsFixed(2),
        // phone: json["phone"] == null ? "" : json["phone"],
        // description: json["description"] == null
        //     ? "Descripción no detallada"
        //     : json["description"],
        // votes: json["votes"] == null ? "" : json["votes"],
        // prices: json["prices"],
        // services: List<Service>.from(
        //     json["services"].map((x) => Service.fromJson(x))),
        // schedule: json["schedule"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "premium": premium,
        "available": available,
        "name": name,
        "stars": stars,
        "address": address,
        "latitude": latitude,
        "longitude": longitude,
        "slides": List<dynamic>.from(slides.map((x) => x)),
        "logo": logo,
        "distance": distance,
        // "prices": prices,
        // "services": List<dynamic>.from(services.map((x) => x.toJson())),
        // "votes": votes,
        // "phone": phone,
        // "description": description,
      };

  @override
  int compareTo(EstablecimientoShortModel other) {
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

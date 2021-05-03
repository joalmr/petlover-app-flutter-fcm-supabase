class EstablishmentModelList implements Comparable<EstablishmentModelList> {
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
  int typeId;
  String type;

  EstablishmentModelList({
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
    this.typeId,
    this.type,
  });

  factory EstablishmentModelList.fromJson(Map<String, dynamic> json) =>
      EstablishmentModelList(
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
        typeId: json["type_id"],
        type: json["type"],
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
        "type_id": typeId,
        "type": type,
      };

  @override
  int compareTo(EstablishmentModelList other) {
    double first = double.parse(stars) * attentions * 10;
    double second = double.parse(other.stars) * other.attentions * 10;

    double resp = second - first;

    int dato = resp.round();
    return dato;
  }
}

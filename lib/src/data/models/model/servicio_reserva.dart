import 'dart:convert';

List<ServicioReserva> servicioReservaFromJson(String str) =>
    List<ServicioReserva>.from(
        json.decode(str).map((x) => ServicioReserva.fromJson(x)));

String servicioReservaToJson(List<ServicioReserva> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class ServicioReserva {
  ServicioReserva({
    this.id,
    this.name,
    this.category,
  });

  int id;
  String name;
  String category;

  factory ServicioReserva.fromJson(Map<String, dynamic> json) =>
      ServicioReserva(
        id: json["id"],
        name: json["name"],
        category: json["category"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "category": category,
      };
}

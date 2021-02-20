// To parse this JSON data, do
//
//     final promocionModel = promocionModelFromJson(jsonString);

import 'dart:convert';

List<PromocionModel> promocionModelFromJson(String str) => List<PromocionModel>.from(json.decode(str).map((x) => PromocionModel.fromJson(x)));

String promocionModelToJson(List<PromocionModel> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class PromocionModel {
  PromocionModel({
    this.serviceId,
    this.description,
    this.type,
    this.discount,
    this.serviceName,
  });

  String serviceId;
  String description;
  String type;
  String discount;
  String serviceName;

  factory PromocionModel.fromJson(Map<String, dynamic> json) => PromocionModel(
        serviceId: json["service_id"],
        description: json["description"],
        type: json["type"],
        discount: json["discount"],
        serviceName: json["service_name"],
      );

  Map<String, dynamic> toJson() => {
        "service_id": serviceId,
        "description": description,
        "type": type,
        "discount": discount,
        "service_name": serviceName,
      };
}

import 'dart:convert';

HistoriaModel historiaModelFromJson(String str) => HistoriaModel.fromJson(json.decode(str));

String historiaModelToJson(HistoriaModel data) => json.encode(data.toJson());

class HistoriaModel {
    String attentionId;
    String establishmentId;
    String establishment;
    String establishmentLogo;
    String weight;
    String heartRhythm;
    String temperature;
    String bodyCondition;
    String createdAt;
    // List<dynamic> details;

    HistoriaModel({
        this.attentionId,
        this.establishmentId,
        this.establishment,
        this.establishmentLogo,
        this.weight,
        this.heartRhythm,
        this.temperature,
        this.bodyCondition,
        this.createdAt,
        // this.details,
    });

    factory HistoriaModel.fromJson(Map<String, dynamic> json) => HistoriaModel(
        attentionId: json["attention_id"],
        establishmentId: json["establishment_id"],
        establishment: json["establishment"],
        establishmentLogo: json["establishment_logo"],
        weight: json["weight"].toString(), //.toDouble(),
        heartRhythm: json["heart_rhythm"].toString(), //.toDouble(),
        temperature: json["temperature"].toString(), //.toDouble(),
        bodyCondition: json["body_condition"],
        createdAt: json["created_at"],
        // details: List<dynamic>.from(json["details"].map((x) => x)),
    );

    Map<String, dynamic> toJson() => {
        "attention_id": attentionId,
        "establishment_id": establishmentId,
        "establishment": establishment,
        "establishment_logo": establishmentLogo,
        "weight": weight,
        "heart_rhythm": heartRhythm,
        "temperature": temperature,
        "body_condition": bodyCondition,
        "created_at": createdAt,
        // "details": List<dynamic>.from(details.map((x) => x)),
    };
}

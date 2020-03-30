import 'dart:convert';

HistoriaModel historiaModelFromJson(String str) => HistoriaModel.fromJson(json.decode(str));

String historiaModelToJson(HistoriaModel data) => json.encode(data.toJson());

class HistoriaModel {
    String attentionId;
    String establishmentId;
    String establishment;
    double weight;
    double heartRhythm;
    double temperature;
    String bodyCondition;
    String createdAt;
    List<dynamic> details;

    HistoriaModel({
        this.attentionId,
        this.establishmentId,
        this.establishment,
        this.weight,
        this.heartRhythm,
        this.temperature,
        this.bodyCondition,
        this.createdAt,
        this.details,
    });

    factory HistoriaModel.fromJson(Map<String, dynamic> json) => HistoriaModel(
        attentionId: json["attention_id"],
        establishmentId: json["establishment_id"],
        establishment: json["establishment"],
        weight: json["weight"].toDouble(),
        heartRhythm: json["heart_rhythm"].toDouble(),
        temperature: json["temperature"].toDouble(),
        bodyCondition: json["body_condition"],
        createdAt: json["created_at"],
        details: List<dynamic>.from(json["details"].map((x) => x)),
    );

    Map<String, dynamic> toJson() => {
        "attention_id": attentionId,
        "establishment_id": establishmentId,
        "establishment": establishment,
        "weight": weight,
        "heart_rhythm": heartRhythm,
        "temperature": temperature,
        "body_condition": bodyCondition,
        "created_at": createdAt,
        "details": List<dynamic>.from(details.map((x) => x)),
    };
}

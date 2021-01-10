class HistoriaModel2 {
  String attentionId;
  String establishmentId;
  String establishment;
  String establishmentLogo;
  String weight;
  String heartRhythm;
  String temperature;
  String bodyCondition;
  String createdAt;
  dynamic amount;
  // String nextdate;
  // String reason;
  dynamic details;

  HistoriaModel2({
    this.attentionId,
    this.establishmentId,
    this.establishment,
    this.establishmentLogo,
    this.weight,
    this.heartRhythm,
    this.temperature,
    this.bodyCondition,
    this.createdAt,
    this.amount,
    // this.nextdate,
    // this.reason,
    this.details,
  });

  factory HistoriaModel2.fromJson(Map<String, dynamic> json) => HistoriaModel2(
        attentionId: json["attention_id"],
        establishmentId: json["establishment_id"],
        establishment: json["establishment"],
        establishmentLogo: json["establishment_logo"],
        weight: json["weight"].toString(), //.toDouble(),
        heartRhythm: json["heart_rhythm"].toString(), //.toDouble(),
        temperature: json["temperature"].toString(), //.toDouble(),
        bodyCondition: json["body_condition"],
        createdAt: json["created_at"],
        amount: json["amount"] == null ? 0 : json["amount"],
        // nextdate: json["nextdate"] == null ? "" : json["nextdate"],
        // reason: json["reason"] == null ? "" : json["reason"],
        details: json[
            "details"], //List<dynamic>.from(json["details"].map((x) => x)),
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

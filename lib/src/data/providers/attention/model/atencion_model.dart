import 'dart:convert';

List<AtencionModel> atencionModelFromJson(String str) =>
    List<AtencionModel>.from(
        json.decode(str).map((x) => AtencionModel.fromJson(x)));

String atencionModelToJson(List<AtencionModel> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class AtencionModel {
  String attentionId;
  String attentionBonification; //revisar para push
  String establishmentName;
  String establishmentLogo;
  String pet;
  int stars;
  String comment;
  String createdAt;

  AtencionModel({
    this.attentionId,
    this.attentionBonification,
    this.establishmentName,
    this.establishmentLogo,
    this.pet,
    this.stars,
    this.comment,
    this.createdAt,
  });

  factory AtencionModel.fromJson(Map<String, dynamic> json) => AtencionModel(
        attentionId: json["attention_id"],
        attentionBonification: json["attention_bonification"].toString(),
        establishmentName: json["establishment_name"],
        establishmentLogo: json["establishment_logo"],
        pet: json["pet"],
        stars: json["stars"] == null ? null : json["stars"],
        comment: json["comment"] == null ? null : json["comment"],
        createdAt: json["created_at"],
      );

  Map<String, dynamic> toJson() => {
        "attention_id": attentionId,
        "attention_bonification": attentionBonification,
        "establishment_name": establishmentName,
        "establishment_logo": establishmentLogo,
        "pet": pet,
        "stars": stars == null ? null : stars,
        "comment": comment == null ? null : comment,
        "created_at": createdAt,
      };
}

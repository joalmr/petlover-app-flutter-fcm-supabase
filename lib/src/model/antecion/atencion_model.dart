// To parse this JSON data, do
//
//     final atencionModel = atencionModelFromJson(jsonString);

import 'dart:convert';

List<AtencionModel> atencionModelFromJson(String str) => List<AtencionModel>.from(json.decode(str).map((x) => AtencionModel.fromJson(x)));

String atencionModelToJson(List<AtencionModel> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class AtencionModel {
    String id;
    String establishmentName;
    String establishmentLogo;
    String pet;
    int stars;
    String comment;
    String createdAt;

    AtencionModel({
        this.id,
        this.establishmentName,
        this.establishmentLogo,
        this.pet,
        this.stars,
        this.comment,
        this.createdAt,
    });

    factory AtencionModel.fromJson(Map<String, dynamic> json) => AtencionModel(
        id: json["id"],
        establishmentName: json["establishment_name"],
        establishmentLogo: json["establishment_logo"],
        pet: json["pet"],
        stars: json["stars"] == null ? null : json["stars"],
        comment: json["comment"] == null ? null : json["comment"],
        createdAt: json["created_at"],
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "establishment_name": establishmentName,
        "establishment_logo": establishmentLogo,
        "pet": pet,
        "stars": stars == null ? null : stars,
        "comment": comment == null ? null : comment,
        "created_at": createdAt,
    };
}

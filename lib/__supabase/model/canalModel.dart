class CanalModel {
    CanalModel({
      this.id,
      this.establishmentId,
      this.petloverId,
    });

    int id;
    String establishmentId;
    String petloverId;

    factory CanalModel.fromJson(Map<String, dynamic> json) => CanalModel(
      id: json['id'],
      establishmentId: json["establishment_id"],
      petloverId: json["petlover_id"],
    );

    Map<String, dynamic> toJson() => {
      "id": id,
      "establishment_id": establishmentId,
      "petlover_id": petloverId,
    };
}

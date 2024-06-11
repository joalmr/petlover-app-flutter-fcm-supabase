class EstablishmentModel {
    EstablishmentModel({
        this.id,
        this.establishmentId,
        this.name,
    });

    int id;
    String establishmentId;
    String name;

    factory EstablishmentModel.fromJson(Map<String, dynamic> json) => EstablishmentModel(
        id: json["id"],
        establishmentId: json["establishment_id"],
        name: json["name"],
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "establishment_id": establishmentId,
        "name": name,
    };
}

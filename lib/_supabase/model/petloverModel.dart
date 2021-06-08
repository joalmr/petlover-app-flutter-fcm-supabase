class PetloverModel {
    PetloverModel({
        this.id,
        this.userId,
        this.name,
    });

    int id;
    String userId;
    String name;

    factory PetloverModel.fromJson(Map<String, dynamic> json) => PetloverModel(
        id: json["id"],
        userId: json["user_id"],
        name: json["name"],
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "user_id": userId,
        "name": name,
    };
}

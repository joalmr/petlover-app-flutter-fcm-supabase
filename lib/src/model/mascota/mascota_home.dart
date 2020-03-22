class PetHome {
    String id;
    String name;
    String breed;
    String specie;
    int weight;
    DateTime birthdate;
    String picture;
    String age;

    PetHome({
        this.id,
        this.name,
        this.breed,
        this.specie,
        this.weight,
        this.birthdate,
        this.picture,
        this.age,
    });

    factory PetHome.fromJson(Map<String, dynamic> json) => PetHome(
        id: json["id"],
        name: json["name"],
        breed: json["breed"],
        specie: json["specie"],
        weight: json["weight"],
        birthdate: DateTime.parse(json["birthdate"]),
        picture: json["picture"],
        age: json["age"],
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "breed": breed,
        "specie": specie,
        "weight": weight,
        "birthdate": birthdate.toIso8601String(),
        "picture": picture,
        "age": age,
    };
}
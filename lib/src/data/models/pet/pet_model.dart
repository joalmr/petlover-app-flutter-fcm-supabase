import 'package:get/get.dart';

class RxMascotaModel {
  final RxString id;
  final RxString name;
  final RxInt specieId;
  final RxString specieName;
  final RxInt breedId;
  final RxString breedName;
  final RxInt genre;
  final RxString weight; //int weight;
  final RxString birthdate; //DateTime birthdate;
  final RxString picture;
  final RxInt status;

  RxMascotaModel(
    this.id,
    this.name,
    this.specieId,
    this.specieName,
    this.breedId,
    this.breedName,
    this.genre,
    this.weight, //int weight,
    this.birthdate, //DateTime birthdate,
    this.picture,
    this.status,
  );
}

class MascotaModel2 {
  String id;
  String name;
  int specieId;
  String specieName;
  int breedId;
  String breedName;
  int genre;
  String weight; //int weight;
  String birthdate; //DateTime birthdate;
  String picture;
  int status;

  RxMascotaModel rx;
  MascotaModel2({
    this.id,
    this.name,
    this.specieId,
    this.specieName,
    this.breedId,
    this.breedName,
    this.genre,
    this.weight,
    this.birthdate,
    this.picture,
    this.status,
  }) {
    rx = RxMascotaModel(
      id.obs,
      name.obs,
      specieId.obs,
      specieName.obs,
      breedId.obs,
      breedName.obs,
      genre.obs,
      weight.obs,
      birthdate.obs,
      picture.obs,
      status.obs,
    );
  }

  factory MascotaModel2.fromJson(Map<String, dynamic> json) => MascotaModel2(
        id: json["id"],
        name: json["name"],
        specieId: json["specie_id"],
        specieName: json["specie_name"],
        breedId: json["breed_id"],
        breedName: json["breed_name"],
        genre: json["genre"], // == 0 ? false : true
        weight: json["weight"].toString(),
        birthdate: json["birthdate"].split(' ')[0], //DateTime.parse(json["birthdate"]),
        picture: json["picture"],
        // condition: json["condition"],
        status: json["status"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "specie_id": specieId,
        "specie_name": specieName,
        "breed_id": breedId,
        "breed_name": breedName,
        "genre": genre,
        "weight": weight,
        "birthdate": birthdate,
        "picture": picture,
        "status": status,
      };
}

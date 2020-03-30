// // To parse this JSON data, do
// //
// //     final petDetalle = petDetalleFromJson(jsonString);

// import 'dart:convert';

// PetDetalle petDetalleFromJson(String str) => PetDetalle.fromJson(json.decode(str));

// String petDetalleToJson(PetDetalle data) => json.encode(data.toJson());

// class PetDetalle {
//     Pet pet;
//     Counters counters;
//     List<History> history;

//     PetDetalle({
//         this.pet,
//         this.counters,
//         this.history,
//     });

//     factory PetDetalle.fromJson(Map<String, dynamic> json) => PetDetalle(
//         pet: Pet.fromJson(json["pet"]),
//         counters: Counters.fromJson(json["counters"]),
//         history: List<History>.from(json["history"].map((x) => History.fromJson(x))),
//     );

//     Map<String, dynamic> toJson() => {
//         "pet": pet.toJson(),
//         "counters": counters.toJson(),
//         "history": List<dynamic>.from(history.map((x) => x.toJson())),
//     };
// }

// class Counters {
//     int consultation;
//     int deworming;
//     int vaccination;
//     int surgery;
//     int grooming;
//     int supplementation;

//     Counters({
//         this.consultation,
//         this.deworming,
//         this.vaccination,
//         this.surgery,
//         this.grooming,
//         this.supplementation,
//     });

//     factory Counters.fromJson(Map<String, dynamic> json) => Counters(
//         consultation: json["consultation"],
//         deworming: json["deworming"],
//         vaccination: json["vaccination"],
//         surgery: json["surgery"],
//         grooming: json["grooming"],
//         supplementation: json["supplementation"],
//     );

//     Map<String, dynamic> toJson() => {
//         "consultation": consultation,
//         "deworming": deworming,
//         "vaccination": vaccination,
//         "surgery": surgery,
//         "grooming": grooming,
//         "supplementation": supplementation,
//     };
// }

// class History {
//     String attentionId;
//     String establishmentId;
//     String establishment;
//     double weight;
//     double heartRhythm;
//     double temperature;
//     String bodyCondition;
//     String createdAt;
//     List<dynamic> details;

//     History({
//         this.attentionId,
//         this.establishmentId,
//         this.establishment,
//         this.weight,
//         this.heartRhythm,
//         this.temperature,
//         this.bodyCondition,
//         this.createdAt,
//         this.details,
//     });

//     factory History.fromJson(Map<String, dynamic> json) => History(
//         attentionId: json["attention_id"],
//         establishmentId: json["establishment_id"],
//         establishment: json["establishment"],
//         weight: json["weight"].toDouble(),
//         heartRhythm: json["heart_rhythm"].toDouble(),
//         temperature: json["temperature"].toDouble(),
//         bodyCondition: json["body_condition"],
//         createdAt: json["created_at"],
//         details: List<dynamic>.from(json["details"].map((x) => x)),
//     );

//     Map<String, dynamic> toJson() => {
//         "attention_id": attentionId,
//         "establishment_id": establishmentId,
//         "establishment": establishment,
//         "weight": weight,
//         "heart_rhythm": heartRhythm,
//         "temperature": temperature,
//         "body_condition": bodyCondition,
//         "created_at": createdAt,
//         "details": List<dynamic>.from(details.map((x) => x)),
//     };
// }

// class Pet {
//     String id;
//     String name;
//     int specieId;
//     String specieName;
//     int breedId;
//     String breedName;
//     int genre;
//     double weight;
//     DateTime birthdate;
//     String picture;
//     String condition;
//     int status;

//     Pet({
//         this.id,
//         this.name,
//         this.specieId,
//         this.specieName,
//         this.breedId,
//         this.breedName,
//         this.genre,
//         this.weight,
//         this.birthdate,
//         this.picture,
//         this.condition,
//         this.status,
//     });

//     factory Pet.fromJson(Map<String, dynamic> json) => Pet(
//         id: json["id"],
//         name: json["name"],
//         specieId: json["specie_id"],
//         specieName: json["specie_name"],
//         breedId: json["breed_id"],
//         breedName: json["breed_name"],
//         genre: json["genre"],
//         weight: json["weight"].toDouble(),
//         birthdate: DateTime.parse(json["birthdate"]),
//         picture: json["picture"],
//         condition: json["condition"],
//         status: json["status"],
//     );

//     Map<String, dynamic> toJson() => {
//         "id": id,
//         "name": name,
//         "specie_id": specieId,
//         "specie_name": specieName,
//         "breed_id": breedId,
//         "breed_name": breedName,
//         "genre": genre,
//         "weight": weight,
//         "birthdate": birthdate.toIso8601String(),
//         "picture": picture,
//         "condition": condition,
//         "status": status,
//     };
// }

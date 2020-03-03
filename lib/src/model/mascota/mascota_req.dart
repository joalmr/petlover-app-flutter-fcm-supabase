class MascotaReq {
  String name;
  String birthdate;
  int specie;
  int breed;
  bool genre;

  MascotaReq({
      this.name,
      this.birthdate,
      this.specie,
      this.breed,
      this.genre = false,
  });
}


// // // To parse this JSON data, do
// // //
// // //     final mascotaReq = mascotaReqFromJson(jsonString);

// // import 'dart:convert';

// // MascotaReq mascotaReqFromJson(String str) => MascotaReq.fromJson(json.decode(str));

// // String mascotaReqToJson(MascotaReq data) => json.encode(data.toJson());

// // class MascotaReq {
// //     String name;
// //     DateTime birthdate;
// //     int specie;
// //     int breed;
// //     int genre;

// //     MascotaReq({
// //         this.name,
// //         this.birthdate,
// //         this.specie,
// //         this.breed,
// //         this.genre,
// //     });

// //     factory MascotaReq.fromJson(Map<String, dynamic> json) => MascotaReq(
// //         name: json["name"],
// //         birthdate: DateTime.parse(json["birthdate"]),
// //         specie: json["specie"],
// //         breed: json["breed"],
// //         genre: json["genre"],
// //     );

// //     Map<String, dynamic> toJson() => {
// //         "name": name,
// //         "birthdate": "${birthdate.year.toString().padLeft(4, '0')}-${birthdate.month.toString().padLeft(2, '0')}-${birthdate.day.toString().padLeft(2, '0')}",
// //         "specie": specie,
// //         "breed": breed,
// //         "genre": genre,
// //     };
// // }

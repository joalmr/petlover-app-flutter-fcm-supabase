// To parse this JSON data, do
//
//     final homeModel = homeModelFromJson(jsonString);

import 'dart:convert';

HomeModel homeModelFromJson(String str) => HomeModel.fromJson(json.decode(str));

String homeModelToJson(HomeModel data) => json.encode(data.toJson());

class HomeModel {
    User user;
    List<Pet> pets;
    List<Booking> bookings;

    HomeModel({
        this.user,
        this.pets,
        this.bookings,
    });

    factory HomeModel.fromJson(Map<String, dynamic> json) => HomeModel(
        user: User.fromJson(json["user"]),
        pets: List<Pet>.from(json["pets"].map((x) => Pet.fromJson(x))),
        bookings: List<Booking>.from(json["bookings"].map((x) => Booking.fromJson(x))),
    );

    Map<String, dynamic> toJson() => {
        "user": user.toJson(),
        "pets": List<dynamic>.from(pets.map((x) => x.toJson())),
        "bookings": List<dynamic>.from(bookings.map((x) => x.toJson())),
    };
}

class Booking {
    String id;
    String establishmentId;
    String establishmentName;
    String address;
    String petId;
    String petName;
    String petPicture;
    String date;
    String time;
    String status;

    Booking({
        this.id,
        this.establishmentId,
        this.establishmentName,
        this.address,
        this.petId,
        this.petName,
        this.petPicture,
        this.date,
        this.time,
        this.status,
    });

    factory Booking.fromJson(Map<String, dynamic> json) => Booking(
        id: json["id"],
        establishmentId: json["establishment_id"],
        establishmentName: json["establishment_name"],
        address: json["address"],
        petId: json["pet_id"],
        petName: json["pet_name"],
        petPicture: json["pet_picture"],
        date: json["date"],
        time: json["time"],
        status: json["status"],
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "establishment_id": establishmentId,
        "establishment_name": establishmentName,
        "address": address,
        "pet_id": petId,
        "pet_name": petName,
        "pet_picture": petPicture,
        "date": date,
        "time": time,
        "status": status,
    };
}

class Pet {
    String id;
    String name;
    String breed;
    String specie;
    int weight;
    DateTime birthdate;
    String picture;
    String age;

    Pet({
        this.id,
        this.name,
        this.breed,
        this.specie,
        this.weight,
        this.birthdate,
        this.picture,
        this.age,
    });

    factory Pet.fromJson(Map<String, dynamic> json) => Pet(
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

class User {
    String name;
    String email;

    User({
        this.name,
        this.email,
    });

    factory User.fromJson(Map<String, dynamic> json) => User(
        name: json["name"],
        email: json["email"],
    );

    Map<String, dynamic> toJson() => {
        "name": name,
        "email": email,
    };
}

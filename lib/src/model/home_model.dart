// To parse this JSON data, do
//
//     final homeModel = homeModelFromJson(jsonString);

import 'dart:convert';

import 'package:proypet/src/model/booking/booking_home.dart';
import 'package:proypet/src/model/mascota/mascota_model.dart';

HomeModel homeModelFromJson(String str) => HomeModel.fromJson(json.decode(str));

String homeModelToJson(HomeModel data) => json.encode(data.toJson());

class HomeModel {
    User user;
    List<MascotaModel> pets;
    List<BookingHome> bookings;

    HomeModel({
        this.user,
        this.pets,
        this.bookings,
    });

    factory HomeModel.fromJson(Map<String, dynamic> json) => HomeModel(
        user: User.fromJson(json["user"]),
        pets: List<MascotaModel>.from(json["pets"].map((x) => MascotaModel.fromJson(x))),
        bookings: List<BookingHome>.from(json["bookings"].map((x) => BookingHome.fromJson(x))),
    );

    Map<String, dynamic> toJson() => {
        "user": user.toJson(),
        "pets": List<dynamic>.from(pets.map((x) => x.toJson())),
        "bookings": List<dynamic>.from(bookings.map((x) => x.toJson())),
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

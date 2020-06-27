// To parse this JSON data, do
//
//     final homeModel = homeModelFromJson(jsonString);

import 'dart:convert';

import 'package:proypet/src/models/booking/booking_home.dart';
import 'package:proypet/src/models/mascota/mascota_model.dart';

HomeModel homeModelFromJson(String str) => HomeModel.fromJson(json.decode(str));

String homeModelToJson(HomeModel data) => json.encode(data.toJson());

class HomeModel {
  UserHome user;
  List<MascotaModel> pets;
  List<BookingHome> bookings;

  HomeModel({
    this.user,
    this.pets,
    this.bookings,
  });

  factory HomeModel.fromJson(Map<String, dynamic> json) => HomeModel(
        user: UserHome.fromJson(json["user"]),
        pets: List<MascotaModel>.from(
            json["pets"].map((x) => MascotaModel.fromJson(x))),
        bookings: List<BookingHome>.from(
            json["bookings"].map((x) => BookingHome.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "user": user.toJson(),
        "pets": List<dynamic>.from(pets.map((x) => x.toJson())),
        "bookings": List<dynamic>.from(bookings.map((x) => x.toJson())),
      };
}

class UserHome {
  String name;
  String email;

  UserHome({
    this.name,
    this.email,
  });

  factory UserHome.fromJson(Map<String, dynamic> json) => UserHome(
        name: json["name"],
        email: json["email"],
      );

  Map<String, dynamic> toJson() => {
        "name": name,
        "email": email,
      };
}

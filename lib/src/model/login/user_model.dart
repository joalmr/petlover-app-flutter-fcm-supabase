// To parse this JSON data, do
//
//     final userModel = userModelFromJson(jsonString);

import 'dart:convert';

UserModel userModelFromJson(String str) => UserModel.fromJson(json.decode(str));

String userModelToJson(UserModel data) => json.encode(data.toJson());

class UserModel {
    String name;
    String lastname;
    String email;
    String password;

    UserModel({
        this.name,
        this.lastname,
        this.email,
        this.password,
    });

    factory UserModel.fromJson(Map<String, dynamic> json) => UserModel(
        name: json["name"],
        lastname: json["lastname"],
        email: json["email"],
        password: json["password"],
    );

    Map<String, dynamic> toJson() => {
        "name": name,
        "lastname": lastname,
        "email": email,
        "password": password,
    };
}

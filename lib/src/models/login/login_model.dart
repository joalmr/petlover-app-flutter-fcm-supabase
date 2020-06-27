// // To parse this JSON data, do
// //
// //     final loginModel = loginModelFromJson(jsonString);

// import 'dart:convert';

// LoginModel loginModelFromJson(String str) => LoginModel.fromJson(json.decode(str));

// String loginModelToJson(LoginModel data) => json.encode(data.toJson());

class UserDato {
    String name;
    String lastname;
    String email;
    String password;
    String phone;

    UserDato({
        this.name,
        this.lastname,
        this.email,
        this.password,
        this.phone,
    });

    factory UserDato.fromJson(Map<String, dynamic> json) => UserDato(
        name: json["name"],
        lastname: json["lastname"],
        email: json["email"],
        password: json["password"],
        phone: json["phone"] == null ? "" : json["phone"],
    );

    Map<String, dynamic> toJson() => {
        "name": name,
        "lastname": lastname,
        "email": email,
        "password": password,
        "phone": phone,
    };
}


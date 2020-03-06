// // To parse this JSON data, do
// //
// //     final usuarioModel = usuarioModelFromJson(jsonString);

// import 'dart:convert';

// UsuarioModel usuarioModelFromJson(String str) => UsuarioModel.fromJson(json.decode(str));

// String usuarioModelToJson(UsuarioModel data) => json.encode(data.toJson());

// class UsuarioModel {
//     User user;

//     UsuarioModel({
//         this.user,
//     });

//     factory UsuarioModel.fromJson(Map<String, dynamic> json) => UsuarioModel(
//         user: User.fromJson(json["user"]),
//     );

//     Map<String, dynamic> toJson() => {
//         "user": user.toJson(),
//     };
// }

// class User {
//     String id; //unique key
//     String name;
//     String email;
//     DateTime emailVerifiedAt;
//     List<dynamic> settings;
//     DateTime createdAt;
//     DateTime updatedAt;
//     dynamic deletedAt;

//     User({
//         this.id,
//         this.name,
//         this.email,
//         this.emailVerifiedAt,
//         this.settings,
//         this.createdAt,
//         this.updatedAt,
//         this.deletedAt,
//     });

//     factory User.fromJson(Map<String, dynamic> json) => User(
//         id: json["id"],
//         name: json["name"],
//         email: json["email"],
//         emailVerifiedAt: DateTime.parse(json["email_verified_at"]),
//         settings: List<dynamic>.from(json["settings"].map((x) => x)),
//         createdAt: DateTime.parse(json["created_at"]),
//         updatedAt: DateTime.parse(json["updated_at"]),
//         deletedAt: json["deleted_at"],
//     );

//     Map<String, dynamic> toJson() => {
//         "id": id,
//         "name": name,
//         "email": email,
//         "email_verified_at": emailVerifiedAt.toIso8601String(),
//         "settings": List<dynamic>.from(settings.map((x) => x)),
//         "created_at": createdAt.toIso8601String(),
//         "updated_at": updatedAt.toIso8601String(),
//         "deleted_at": deletedAt,
//     };
// }

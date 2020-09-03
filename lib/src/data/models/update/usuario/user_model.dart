import 'package:get/get.dart';

class RxUserModel {
  final RxString id;
  final RxString name;
  final RxString lastname;
  final RxString phone;
  final RxString email;
  final DateTime emailVerifiedAt;
  final DateTime createdAt;
  final DateTime updatedAt;
  final dynamic deletedAt;

  RxUserModel(
    this.id,
    this.name,
    this.lastname,
    this.phone,
    this.email,
    this.emailVerifiedAt,
    this.createdAt,
    this.updatedAt,
    this.deletedAt,
  );
}

class UserModel2 {
  String id;
  String name;
  String lastname;
  String phone;
  String email;
  DateTime emailVerifiedAt;
  DateTime createdAt;
  DateTime updatedAt;
  dynamic deletedAt;

  RxUserModel rx;
  UserModel2({
    this.id,
    this.name,
    this.lastname,
    this.phone,
    this.email,
    this.emailVerifiedAt,
    this.createdAt,
    this.updatedAt,
    this.deletedAt,
  }) {
    rx = RxUserModel(
      id.obs,
      name.obs,
      lastname.obs,
      phone.obs,
      email.obs,
      emailVerifiedAt,
      createdAt,
      updatedAt,
      deletedAt,
    );
  }

  String get nombreUser => rx.name.value;
  set nombreUser(String value) => rx.name.value = value;

  String get idUser => rx.id.value;
  set idUser(String value) => rx.id.value = value;

  UserModel2.fromJson(Map<String, dynamic> json) {
    this.id = json["id"];
    this.name = json["name"];
    this.lastname = json["lastname"];
    this.phone = json["phone"];
    this.email = json["email"];
    this.emailVerifiedAt = DateTime.parse(json["email_verified_at"]);
    this.createdAt = DateTime.parse(json["created_at"]);
    this.updatedAt = DateTime.parse(json["updated_at"]);
    this.deletedAt = json["deleted_at"];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    data['lastname'] = this.lastname;
    data['phone'] = this.phone;
    data['email'] = this.email;
    data['email_verified_at'] = this.emailVerifiedAt.toIso8601String();
    data['created_at'] = this.createdAt.toIso8601String();
    data['updated_at'] = this.updatedAt.toIso8601String();
    data['deleted_at'] = this.deletedAt;
    return data;
  }
}

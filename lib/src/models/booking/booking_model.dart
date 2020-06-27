// To parse this JSON data, do
//
//     final bookingModel = bookingModelFromJson(jsonString);

import 'dart:convert';

BookingModel bookingModelFromJson(String str) => BookingModel.fromJson(json.decode(str));

String bookingModelToJson(BookingModel data) => json.encode(data.toJson());

class BookingModel {
    String establishmentId;
    String typeId;
    String userId;
    String petId;
    int statusId;
    String bookingAt;
    String id;
    DateTime updatedAt;
    DateTime createdAt;
    String observation;

    BookingModel({
        this.establishmentId,
        this.typeId,
        this.userId,
        this.petId,
        this.statusId,
        this.bookingAt,
        this.id,
        this.updatedAt,
        this.createdAt,
        this.observation,
    });

    factory BookingModel.fromJson(Map<String, dynamic> json) => BookingModel(
        establishmentId: json["establishment_id"],
        typeId: json["type_id"],
        userId: json["user_id"],
        petId: json["pet_id"],
        statusId: json["status_id"],
        bookingAt: json["booking_at"], //DateTime.parse(json["booking_at"]), //
        id: json["id"],
        updatedAt: DateTime.parse(json["updated_at"]),
        createdAt: DateTime.parse(json["created_at"]),
        observation: json["observation"] == null ? "" : json["observation"] 
    );

    Map<String, dynamic> toJson() => {
        "establishment_id": establishmentId,
        "type_id": typeId,
        "user_id": userId,
        "pet_id": petId,
        "status_id": statusId,
        "booking_at": bookingAt, //bookingAt.toIso8601String(),
        "id": id,
        "updated_at": updatedAt.toIso8601String(),
        "created_at": createdAt.toIso8601String(),
        "observation": observation
    };
}

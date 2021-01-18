// To parse this JSON data, do
//
//     final bookingModel = bookingModelFromJson(jsonString);

import 'dart:convert';

List<BookingModel> bookingModelFromJson(String str) => List<BookingModel>.from(
    json.decode(str).map((x) => BookingModel.fromJson(x)));

String bookingModelToJson(List<BookingModel> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class BookingModel {
  BookingModel({
    this.bookingId,
    this.bookingDatetime,
    this.bookingServices,
    this.bookingStatusId,
    this.bookingStatus,
    this.establishmentId,
    this.establishmentAddress,
    this.establishmentLatitude,
    this.establishmentLongitude,
    this.establishmentName,
    this.establishmentPhone,
    this.petId,
    this.petName,
    this.petPicture,
    this.pastDate,
  });

  String bookingId;
  DateTime bookingDatetime;
  List<String> bookingServices;
  int bookingStatusId;
  String bookingStatus;
  String establishmentId;
  String establishmentAddress;
  double establishmentLatitude;
  double establishmentLongitude;
  String establishmentName;
  String establishmentPhone;
  String petId;
  String petName;
  String petPicture;
  bool pastDate;

  factory BookingModel.fromJson(Map<String, dynamic> json) => BookingModel(
        bookingId: json["booking_id"],
        bookingDatetime: DateTime.parse(json["booking_datetime"]),
        bookingServices:
            List<String>.from(json["booking_services"].map((x) => x)),
        bookingStatusId: json["booking_status_id"],
        bookingStatus: json["booking_status"],
        establishmentId: json["establishment_id"],
        establishmentAddress: json["establishment_address"],
        establishmentLatitude: json["establishment_latitude"].toDouble(),
        establishmentLongitude: json["establishment_longitude"].toDouble(),
        establishmentName: json["establishment_name"],
        establishmentPhone: json["establishment_phone"],
        petId: json["pet_id"],
        petName: json["pet_name"],
        petPicture: json["pet_picture"],
        pastDate: false,
      );

  Map<String, dynamic> toJson() => {
        "booking_id": bookingId,
        "booking_datetime": bookingDatetime.toIso8601String(),
        "booking_services": List<dynamic>.from(bookingServices.map((x) => x)),
        "booking_status_id": bookingStatusId,
        "booking_status": bookingStatus,
        "establishment_id": establishmentId,
        "establishment_address": establishmentAddress,
        "establishment_latitude": establishmentLatitude,
        "establishment_longitude": establishmentLongitude,
        "establishment_name": establishmentName,
        "establishment_phone": establishmentPhone,
        "pet_id": petId,
        "pet_name": petName,
        "pet_picture": petPicture,
      };
}

import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:proypet/config/global_variables.dart';
import 'package:proypet/source/booking/model/booking_set_model.dart';
import 'package:proypet/source/booking/model/servicio_reserva.dart';
import '../model/booking_model.dart';

class BookingProvider {
  final _url = urlApi;

  Future<List<BookingModel>> getBookings() async {
    final url = '$_url/bookings';
    final response = await http.get(url, headers: headersToken());
    final jsonData = jsonDecode(response.body);
    List<BookingModel> bookings =
        List<BookingModel>.from(jsonData.map((x) => BookingModel.fromJson(x)));

    return bookings;
  }

  Future<BookingModel> getBooking(String bookingId) async {
    final url = '$_url/booking/$bookingId';
    final response = await http.get(url, headers: headersToken());
    final jsonData = jsonDecode(response.body);
    final booking = BookingModel.fromJson(jsonData);

    return booking;
  }

  Future<bool> setBooking(BookingSetModel booking, List reservaType,
      dynamic delivery, String direccion) async {
    final url = '$_url/bookings';
    var bodyData;

    print("==booking");

    if (delivery != null) {
      bodyData = {
        "booking_at": booking.bookingAt,
        "establishment_id": booking.establishmentId,
        "pet_id": booking.petId,
        "type_id": jsonEncode(reservaType), //booking.typeId,
        "observation": booking.observation,
        "delivery": delivery,
        "address": direccion,
      };
    } else {
      bodyData = {
        "booking_at": booking.bookingAt,
        "establishment_id": booking.establishmentId,
        "pet_id": booking.petId,
        "type_id": jsonEncode(reservaType),
        "observation": booking.observation,
      };
    }

    final resp = await http.post(url, headers: headersToken(), body: bodyData);

    //TODO: quitar el 201 de la respuesta de back
    if (resp.statusCode == 200 || resp.statusCode == 201) {
      return true;
    } else {
      return false;
    }
  }

  Future<bool> deleteBooking(String idBooking) async {
    final url = '$_url/bookings/$idBooking/delete';
    final resp = await http.post(url, headers: headersToken());

    if (resp.statusCode == 200)
      return true;
    else
      return false;
  }

  Future<void> tryBooking(String idEstablishment) async {
    final url = '$_url/booking/attempt';
    final _data = {"establishment_id": idEstablishment};

    await http.post(url, headers: headersToken(), body: _data);
  }

  Future<List<ServicioReserva>> typeBooking(int typeId) async {
    final url = '$_url/booking/types';
    final response = await http.get(url, headers: headersToken());
    List<ServicioReserva> dataList = <ServicioReserva>[];
    final jsonData = jsonDecode(response.body);

    if (typeId == 2) {
      var dataGrooming = List<ServicioReserva>.from(
        jsonData.map(
          (x) => ServicioReserva.fromJson(x),
        ),
      ).where((element) => element.category == 'Grooming').toList();

      var dataDeworming = List<ServicioReserva>.from(
        jsonData.map(
          (x) => ServicioReserva.fromJson(x),
        ),
      ).where((element) => element.category == 'Desparasitación').toList();

      dataList.addAll(dataGrooming);
      dataList.addAll(dataDeworming);
    } else {
      dataList = List<ServicioReserva>.from(
        jsonData.map(
          (x) => ServicioReserva.fromJson(x),
        ),
      );
    }

    return dataList;
  }
}

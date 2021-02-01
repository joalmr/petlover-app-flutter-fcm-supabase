import 'dart:convert';
import 'package:dio/dio.dart';
import 'package:http/http.dart' as http;
import 'package:proypet/config/global_variables.dart';
import 'package:proypet/src/data/models/booking/booking_set_model.dart';
import 'package:proypet/src/data/models/model/servicio_reserva.dart';

import '../../models/booking/booking_model.dart';

class BookingProvider {
  final _url = urlApi;

  Dio dio = new Dio();

  Future<List<BookingModel>> getBookings() async {
    final url = '$_url/bookings';
    Response response =
        await dio.get(url, options: Options(headers: headersToken()));

    List<BookingModel> bookings = List<BookingModel>.from(
        response.data.map((x) => BookingModel.fromJson(x)));

    return bookings;
  }

  Future<BookingModel> getBooking(String bookingId) async {
    final url = '$_url/booking/$bookingId';
    Response response =
        await dio.get(url, options: Options(headers: headersToken()));

    final booking = BookingModel.fromJson(response.data);

    return booking;
  }

  Future<bool> setBooking(BookingSetModel booking, List reservaType,
      dynamic delivery, String direccion) async {
    final url = '$_url/bookings';
    var bodyData;

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
        "type_id": jsonEncode(reservaType), //booking.typeId,
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
    await dio.post(url, data: _data, options: Options(headers: headersToken()));
  }

  Future<List<ServicioReserva>> typeBooking(int typeId) async {
    final url = '$_url/booking/types';

    var resp = await dio.get(url, options: Options(headers: headersToken()));
    List<ServicioReserva> dataList = new List<ServicioReserva>();

    if (typeId == 2) {
      var dataGrooming = List<ServicioReserva>.from(
        resp.data.map(
          (x) => ServicioReserva.fromJson(x),
        ),
      ).where((element) => element.category == 'Grooming').toList();

      var dataDeworming = List<ServicioReserva>.from(
        resp.data.map(
          (x) => ServicioReserva.fromJson(x),
        ),
      ).where((element) => element.category == 'Desparasitación').toList();

      dataList.addAll(dataGrooming);
      dataList.addAll(dataDeworming);
    } else {
      dataList = List<ServicioReserva>.from(
        resp.data.map(
          (x) => ServicioReserva.fromJson(x),
        ),
      );
    }

    return dataList;
  }
}

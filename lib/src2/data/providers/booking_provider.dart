import 'package:http/http.dart' as http;
import 'package:proypet/config/global_variables.dart';
import 'package:proypet/src/models/booking/booking_model.dart';

class BookingProvider {
  final _url = urlApi;

  Future<bool> booking(BookingModel booking, dynamic delivery, String direccion) async {
    final url = '$_url/bookings';
    var bodyData;
    if (delivery != null) {
      bodyData = {
        "booking_at": booking.bookingAt,
        "establishment_id": booking.establishmentId,
        "pet_id": booking.petId,
        "type_id": booking.typeId,
        "observation": booking.observation,
        "delivery": delivery,
        "address": direccion,
      };
    } else {
      bodyData = {
        "booking_at": booking.bookingAt,
        "establishment_id": booking.establishmentId,
        "pet_id": booking.petId,
        "type_id": booking.typeId,
        "observation": booking.observation,
      };
    }

    final resp = await http.post(url, headers: headersToken(), body: bodyData);

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
}

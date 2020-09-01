import 'package:proypet/src/data/models/model/booking/booking_model.dart';
import 'package:proypet/src/data/models/model/servicio_reserva.dart';
import 'package:proypet/src/data/providers/booking_provider.dart';

class BookingService {
  final BookingProvider bookingProvider = BookingProvider();

  booking(BookingModel booking, dynamic delivery, String direccion) {
    return bookingProvider.booking(booking, delivery, direccion);
  }

  deleteBooking(String idBooking) {
    return bookingProvider.deleteBooking(idBooking);
  }

  tryBooking(String idEstablishment) {
    return bookingProvider.tryBooking(idEstablishment);
  }

  Future<List<ServicioReserva>> typeBooking() async {
    return bookingProvider.typeBooking();
  }
}

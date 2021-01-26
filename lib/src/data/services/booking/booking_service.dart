import 'package:proypet/src/data/models/booking/booking_set_model.dart';
import 'package:proypet/src/data/models/model/servicio_reserva.dart';
import 'package:proypet/src/data/providers/booking/booking_provider.dart';

class BookingService {
  final BookingProvider bookingProvider = BookingProvider();

  getBookings() {
    return bookingProvider.getBookings();
  }

  getBooking(String bookingId) {
    return bookingProvider.getBooking(bookingId);
  }

  setBooking(BookingSetModel booking, List reservaType, dynamic delivery,
      String direccion) {
    return bookingProvider.setBooking(
      booking,
      reservaType,
      delivery,
      direccion,
    );
  }

  deleteBooking(String idBooking) {
    return bookingProvider.deleteBooking(idBooking);
  }

  tryBooking(String idEstablishment) {
    return bookingProvider.tryBooking(idEstablishment);
  }

  Future<List<ServicioReserva>> typeBooking(int typeId) async {
    return bookingProvider.typeBooking(typeId);
  }
}

import 'package:proypet/src/models/booking/booking_model.dart';
import 'package:proypet/src2/data/providers/booking_provider.dart';

class BookingService {
  final BookingProvider bookingProvider = BookingProvider();

  booking(BookingModel booking, dynamic delivery, String direccion) {
    return bookingProvider.booking(booking, delivery, direccion);
  }

  deleteBooking(String idBooking) {
    return bookingProvider.deleteBooking(idBooking);
  }
}

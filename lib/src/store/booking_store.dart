import 'package:get/get.dart';
import 'package:mobx/mobx.dart';
import 'package:proypet/src/models/booking/booking_home.dart';
import 'package:proypet/src/store/home_store.dart';
import 'package:proypet/src/services/booking_provider.dart';
part 'booking_store.g.dart';

class BookingStore = _BookingStoreBase with _$BookingStore;

abstract class _BookingStoreBase with Store {
  HomeStore homeStore = Get.put(HomeStore());

  @observable
  ObservableList<BookingHome> atenciones = ObservableList<BookingHome>();

  final bookingProvider = BookingProvider();

  @computed
  bool get sinAtenciones => atenciones.length == 0;

  @action
  void eliminaAtencion(id) {
    homeStore.loading = false;
    deleteBooking(id);
  }

  @action
  Future<void> deleteBooking(id) async {
    var resp = await bookingProvider.deleteBooking(id);
    if (resp) {
      // ignore: await_only_futures
      await homeStore.getSummary();
      homeStore.volver();
    }
  }
}

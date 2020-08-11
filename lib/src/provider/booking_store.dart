// import 'package:flutter/material.dart';
// import 'package:mobx/mobx.dart';
// import 'package:proypet/src/models/booking/booking_home.dart';
// import 'package:proypet/src/provider/home_store.dart';
// import 'package:proypet/src/services/booking_provider.dart';
// part 'booking_store.g.dart';

// class Booking = _BookingBase with _$Booking;

// abstract class _BookingBase with Store {
//   var homeStore;

//   constructor(homeStore) {
//     this.homeStore = new HomeStore();
//   }

//   @observable
//   ObservableList<BookingHome> atenciones = ObservableList<BookingHome>();

//   final bookingProvider = BookingProvider();

//   @computed
//   bool get sinAtenciones => atenciones.length == 0;

//   @action
//   void eliminaAtencion(BuildContext context, id) {
//     deleteBooking(id);
//     homeStore.setStopLoading();
//     homeStore.volver(context);
//     // volver(context);
//   }

//   @action
//   Future<void> deleteBooking(id) async {
//     var resp = await bookingProvider.deleteBooking(id);
//     if (resp) {
//       homeStore.getSummary();
//     }
//   }
// }

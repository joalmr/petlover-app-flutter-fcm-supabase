import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:proypet/src/app/styles/lottie.dart';
import 'package:proypet/src/app/styles/styles.dart';
import 'package:proypet/src/controllers/mascota_controller/citas_mascota_controller.dart';
import 'package:proypet/src/utils/icons_map.dart';

class CitasTab extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GetX<CitasController>(
        init: CitasController(),
        builder: (_) {
          return _.cargando.value
              ? Container(
                  child: Center(
                    child: lottieLoading,
                  ),
                )
              : ListView.builder(
                  padding: EdgeInsets.zero,
                  itemCount: _.listacitas.length,
                  itemBuilder: (BuildContext context, int index) {
                    var element = _.listacitas[index];
                    DateTime date =
                        DateFormat('yyyy-MM-dd').parse(element['nextDate']);
                    String formattedDate =
                        DateFormat('dd-MM-yyyy').format(date);
                    String cita = _.typeMap[element['type']];
                    return Card(
                      elevation: 2,
                      child: ListTile(
                        contentPadding: const EdgeInsets.symmetric(
                            horizontal: 10, vertical: 0),
                        leading: CircleAvatar(
                          radius: 20,
                          backgroundColor: colorMain,
                          child: Icon(
                            // IconProypet.vacuna,
                            iconMap[element['type']],
                            color: Colors.white,
                            size: 20,
                          ),
                        ),
                        title: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Text(
                              'Próxima $cita',
                              style: TextStyle(
                                fontSize: 10,
                              ),
                            ),
                            Text(
                              formattedDate,
                              style: TextStyle(
                                fontSize: 14,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ],
                        ),
                        subtitle: Text(
                          element['reason'],
                          style: TextStyle(
                            fontSize: 12,
                          ),
                          maxLines: 2,
                        ),
                      ),
                    );
                  },
                );
        });
  }
}
// Widget citasTab() {
//   return ListView.builder(
//     padding: EdgeInsets.zero,
//     itemCount: 4,
//     itemBuilder: (BuildContext context, int index) {
//       return Card(
//         elevation: 2,
//         child: ListTile(
//           contentPadding:
//               const EdgeInsets.symmetric(horizontal: 10, vertical: 0),
//           leading: CircleAvatar(
//             radius: 20,
//             backgroundColor: colorGreen2,
//             child: Icon(
//               IconProypet.vacuna,
//               color: Colors.white,
//               size: 20,
//             ),
//           ),
//           title: Column(
//             crossAxisAlignment: CrossAxisAlignment.start,
//             mainAxisAlignment: MainAxisAlignment.start,
//             children: [
//               Text(
//                 'Próxima vacuna',
//                 style: TextStyle(
//                   fontSize: 10,
//                 ),
//               ),
//               Text(
//                 '30-11-2020',
//                 style: TextStyle(
//                   fontSize: 14,
//                   fontWeight: FontWeight.bold,
//                 ),
//               ),
//             ],
//           ),
//           subtitle: Text(
//             'Vacuna lestospira',
//             style: TextStyle(
//               fontSize: 12,
//             ),
//             maxLines: 2,
//           ),
//         ),
//       );
//     },
//   );
// }

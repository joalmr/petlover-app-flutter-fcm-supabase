// import 'package:flutter/material.dart';
// import 'package:get/get.dart';
// import 'package:proypet/src/app/styles/styles.dart';
// import 'package:proypet/src/app/views/components/form_control/button_primary.dart';
// import 'package:proypet/src/controllers/mascota_controller/detalle_mascota_controller.dart';

// final _mdC = Get.find<MascotaDetalleController>();

// funtionFleas() {
//   return showDialog(
//     context: Get.context,
//     barrierDismissible: false,
//     child: AlertDialog(
//       actions: [buttonPri('Guardar', () {})],
//       title: Row(
//         mainAxisAlignment: MainAxisAlignment.spaceBetween,
//         children: [
//           Text(
//             'Antipulgas en casa',
//             style: TextStyle(fontSize: 16),
//           ),
//           InkWell(
//             borderRadius: borderRadius,
//             child: Icon(Icons.close, size: 18),
//             onTap: () => Get.back(),
//           )
//         ],
//       ),
//       scrollable: true,
//       content: Column(
//         children: [
//           Text('¿Con qué frecuencia aplica antipulgas?'),
//           SizedBox(height: 5),
//           TextFormField(
//             key: Key('frecuencyFleas'),
//             keyboardType: TextInputType.number,
//             initialValue: '',
//             onChanged: (value) =>
//                 _mdC.frecuenciaFleas.value = int.tryParse(value),
//             decoration: InputDecoration(
//               hintText: 'Indique días',
//             ),
//           ),
//         ],
//       ),
//     ),
//   );
// }

// funtionBed() {
//   return showDialog(
//     context: Get.context,
//     barrierDismissible: false,
//     child: AlertDialog(
//       actions: [buttonPri('Guardar', () {})],
//       title: Row(
//         mainAxisAlignment: MainAxisAlignment.spaceBetween,
//         children: [
//           Text(
//             'Limpieza de cama',
//             style: TextStyle(fontSize: 16),
//           ),
//           InkWell(
//             borderRadius: borderRadius,
//             child: Icon(Icons.close, size: 18),
//             onTap: () => Get.back(),
//           )
//         ],
//       ),
//       scrollable: true,
//       content: Column(
//         children: [
//           Text('¿Con qué frecuencia limpia la cama?'),
//           SizedBox(height: 5),
//           TextFormField(
//             key: Key('frecuencyBed'),
//             keyboardType: TextInputType.number,
//             initialValue: '',
//             onChanged: (value) =>
//                 _mdC.frecuenciaBed.value = int.tryParse(value),
//             decoration: InputDecoration(
//               hintText: 'Indique días',
//             ),
//           ),
//         ],
//       ),
//     ),
//   );
// }

// funtionLitterBox() {
//   return showDialog(
//     context: Get.context,
//     barrierDismissible: false,
//     child: AlertDialog(
//       actions: [buttonPri('Guardar', () {})],
//       title: Row(
//         mainAxisAlignment: MainAxisAlignment.spaceBetween,
//         children: [
//           Text(
//             'Cambio de arena',
//             style: TextStyle(fontSize: 16),
//           ),
//           InkWell(
//             borderRadius: borderRadius,
//             child: Icon(Icons.close, size: 18),
//             onTap: () => Get.back(),
//           )
//         ],
//       ),
//       scrollable: true,
//       content: Column(
//         children: [
//           Text('¿Con qué frecuencia cambia de arena?'),
//           SizedBox(height: 5),
//           TextFormField(
//             key: Key('frecuencyLitterBox'),
//             keyboardType: TextInputType.number,
//             initialValue: '',
//             onChanged: (value) =>
//                 _mdC.frecuenciaLitterBox.value = int.tryParse(value),
//             decoration: InputDecoration(
//               hintText: 'Indique días',
//             ),
//           ),
//         ],
//       ),
//     ),
//   );
// }

// funtionFood() {
//   RxInt page = 1.obs;
//   return showDialog(
//     context: Get.context,
//     barrierDismissible: false,
//     child: AlertDialog(
//       actions: [
//         Obx(
//           () => buttonPri(page.value == 1 ? 'Continuar' : 'Guardar', () {
//             if (page.value == 1) page.value = page.value + 1;
//             print(page.value);
//           }),
//         )
//       ],
//       title: Row(
//         mainAxisAlignment: MainAxisAlignment.spaceBetween,
//         children: [
//           Text(
//             'Alimentación',
//             style: TextStyle(fontSize: 16),
//           ),
//           InkWell(
//             borderRadius: borderRadius,
//             child: Icon(Icons.close, size: 18),
//             onTap: () => Get.back(),
//           )
//         ],
//       ),
//       scrollable: true,
//       content: Obx(() => contentFood(page.value)),
//     ),
//   );
// }

// contentFood(page) {
//   switch (page) {
//     case 1:
//       return Column(
//         children: [
//           Text('¿Cuántas veces al día come?'),
//           SizedBox(height: 5),
//           TextFormField(
//             key: Key('frecuencyFood'),
//             keyboardType: TextInputType.number,
//             initialValue: '',
//             onChanged: (value) =>
//                 _mdC.frecuenciaFood.value = int.tryParse(value),
//           ),
//         ],
//       );
//       break;
//     case 2:
//       return Column(
//         children: [
//           Text('¿En qué horarios?'),
//           Text(
//             '(Si es más de uno separar con coma)',
//             style: TextStyle(fontSize: 12),
//           ),
//           SizedBox(height: 5),
//           TextFormField(
//             key: Key('hoursFood'),
//             initialValue: '',
//             onChanged: (value) => _mdC.horasFood.value = value,
//             decoration: InputDecoration(
//               hintText: 'Ejm: 10:30,16:00,20:00',
//             ),
//           ),
//         ],
//       );
//       break;
//   }
// }

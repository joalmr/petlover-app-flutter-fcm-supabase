import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:proypet/source/veterinarias/domain/controller/filtra_vets_controller.dart';
import 'cardFrecuentes.dart';

final filtros = Get.find<FiltraVetsController>();

emergenciaHome(bool alone) {
  return cardFrecuente(
    onTap: () {
      filtros.listaFiltros.clear();
      filtros.listaFiltros.addAll([8]);
      filtros.filtrar();
    },
    rootImg: 'images/fre-emergencia.jpg',
    title: 'Emergencia',
    subtitle: '24 horas',
    color: Colors.red,
    urlImg: false,
    alone: alone,
  );
}

myFavorite(String vetId, String vetName, String vetImg){
  return cardFrecuente(
    onTap: () => Get.toNamed('vet', arguments: vetId),
    rootImg: vetImg=='' ? 'images/vet_prueba.jpg' : vetImg,
    title: vetName,
    urlImg: vetImg=='' ? false : true,
  );
}

// consultaHome() {
//   return cardFrecuente(
//     onTap: () {
//       filtros.listaFiltros.clear();
//       filtros.listaFiltros.addAll([2]);
//       filtros.filtrar();
//     },
//     rootImg: 'images/fre-consulta.jpg',
//     title: 'Consulta',
//   );
// }

// vacunaHome() {
//   return cardFrecuente(
//     onTap: () {
//       filtros.listaFiltros.clear();
//       filtros.listaFiltros.addAll([4]);
//       filtros.filtrar();
//     },
//     rootImg: 'images/fre-vacuna.jpeg',
//     title: 'Vacuna',
//   );
// }

// banioHome() {
//   return cardFrecuente(
//     onTap: () {
//       filtros.listaFiltros.clear();
//       filtros.listaFiltros.addAll([1]);
//       filtros.filtrar();
//     },
//     rootImg: 'images/fre-banio.jpg',
//     title: 'Baño',
//   );
// }

// desparasitaHome() {
//   return cardFrecuente(
//     onTap: () {
//       filtros.listaFiltros.clear();
//       filtros.listaFiltros.addAll([11]);
//       filtros.filtrar();
//     },
//     rootImg: 'images/fre-desparacita.jpg',
//     title: 'Desparasitación',
//   );
// }

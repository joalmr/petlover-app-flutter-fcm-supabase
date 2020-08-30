import 'package:flutter/material.dart';
import 'package:proypet/icons/icon_proypet_icons.dart';
import 'package:proypet/icons/proypet_icons.dart';

class ServicioReserva {
  int id;
  IconData icon;
  String name;
  String category;

  ServicioReserva({
    this.id,
    this.icon,
    this.name,
    this.category,
  });
}

final List<ServicioReserva> servicioReservaList = [
  ServicioReserva(
    id: 1,
    icon: IconProypet.consulta,
    name: 'Consulta',
    category: 'Consulta',
  ),
  ServicioReserva(
    id: 7,
    icon: IconProypet.consulta,
    name: 'Chequeo preventivo',
    category: 'Consulta',
  ),
  ServicioReserva(
    id: 4,
    icon: IconProypet.desparasitacion,
    name: 'Desparasitación',
    category: 'Desparasitación',
  ),
  ServicioReserva(
    id: 2,
    icon: IconProypet.vacuna,
    name: 'Vacuna',
    category: 'Vacuna',
  ),
  ServicioReserva(
    id: 3,
    icon: IconProypet.grooming,
    name: 'Baño',
    category: 'Grooming',
  ),
  ServicioReserva(
    id: 5,
    icon: IconProypet.grooming,
    name: 'Baño y corte',
    category: 'Grooming',
  ),
  ServicioReserva(
    id: 6,
    icon: Proypet.proypet,
    name: 'Otro servicio',
    category: 'Otro',
  ),
];

// final List<ServicioReserva> servicioReservaList = [
//   ...reservaList,
//   ServicioReserva(
//     id: 6,
//     icon: Proypet.proypet,
//     name: 'Otro servicio',
//     category: 'Otro',
//   ),
// ];

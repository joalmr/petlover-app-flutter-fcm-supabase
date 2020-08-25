import 'package:flutter/material.dart';
import 'package:proypet/icons/icon_proypet_icons.dart';
import 'package:proypet/icons/proypet_icons.dart';

class ServicioReserva {
  int id;
  IconData icon;
  String name;
  String subtitle;

  ServicioReserva({
    this.id,
    this.icon,
    this.name,
    this.subtitle,
  });
}

final List<ServicioReserva> servicioReservaList = [
  ServicioReserva(
    id: 1,
    icon: IconProypet.consulta,
    name: 'Consulta',
    subtitle: 'Consulta',
  ),
  ServicioReserva(
    id: 7,
    icon: IconProypet.consulta,
    name: 'Chequeo preventivo',
    subtitle: 'Consulta',
  ),
  ServicioReserva(
    id: 4,
    icon: IconProypet.desparasitacion,
    name: 'Desparasitación',
    subtitle: 'Desparasitación',
  ),
  ServicioReserva(
    id: 2,
    icon: IconProypet.vacuna,
    name: 'Vacuna',
    subtitle: 'Vacuna',
  ),
  ServicioReserva(
    id: 3,
    icon: IconProypet.grooming,
    name: 'Baño',
    subtitle: 'Grooming',
  ),
  ServicioReserva(
    id: 5,
    icon: IconProypet.grooming,
    name: 'Baño y corte',
    subtitle: 'Grooming',
  ),
  ServicioReserva(
    id: 6,
    icon: Proypet.proypet,
    name: 'Otro servicio',
    subtitle: 'Otro',
  ),
];

// final List<ServicioReserva> servicioReservaList = [
//   ...reservaList,
//   ServicioReserva(
//     id: 6,
//     icon: Proypet.proypet,
//     name: 'Otro servicio',
//     subtitle: 'Otro',
//   ),
// ];

import 'package:flutter/material.dart';
import 'package:proypet/icon_proypet_icons.dart';
    
final iconMap = <String, IconData>{
  'grooming'          : IconProypet.grooming,
  'consultation'      : IconProypet.consulta,
  'surgery'           : IconProypet.cirugia,
  'vaccination'       : IconProypet.vacuna,
  'delivery'          : IconProypet.delivery,
  'ecg'               : IconProypet.cardiograma,
  'laboratory'        : IconProypet.tubo_ensayo,
  '24-hours'          : IconProypet.horas_24,
  'lodging'           : IconProypet.hospedaje,
  'petshop'           : IconProypet.petshop,
  'deworming'         : IconProypet.desparasitacion,
  'ultrasound'        : IconProypet.ecografia,
  'x-ray'             : IconProypet.rayos_x,
  'resonance'         : IconProypet.resonancia,
  'pharmacy'          : IconProypet.farmacia,
  'hospitalization'   : IconProypet.hospitalizacion,
};

final slugNum = <String, int>{
  'grooming'          : 1,
  'consultation'      : 2,
  'surgery'           : 3,
  'vaccination'       : 4,
  'delivery'          : 5,
  'ecg'               : 6,
  'laboratory'        : 7,
  '24-hours'          : 8,
  'lodging'           : 9,
  'petshop'           : 10,
  'deworming'         : 11,
  'ultrasound'        : 12,
  'x-ray'             : 13,
  'resonance'         : 14,
  'pharmacy'          : 15,
  'hospitalization'   : 16,
};

final iconNum = <int, IconData>{
  1    : IconProypet.grooming,
  2    : IconProypet.consulta,
  3    : IconProypet.cirugia,
  4    : IconProypet.vacuna,
  5    : IconProypet.delivery,
  6    : IconProypet.cardiograma,
  7    : IconProypet.tubo_ensayo,
  8    : IconProypet.horas_24,
  9    : IconProypet.hospedaje,
  10   : IconProypet.petshop,
  11   : IconProypet.desparasitacion,
  12   : IconProypet.ecografia,
  13   : IconProypet.rayos_x,
  14   : IconProypet.resonancia,
  15   : IconProypet.farmacia,
  16   : IconProypet.hospitalizacion,
};

final textMap = <int, String>{
  1    : "Grooming",
  2    : "Consulta",
  3    : "Cirugía",
  4    : "Vacunas",
  5    : "Movilidad",//Recojo/Entrega
  6    : "Electrocardiograma",
  7    : "Laboratorio",
  8    : "24 horas",
  9    : "Hospedaje",
  10   : "Petshop",
  11   : "Desparasitación",
  12   : "Ecografía",
  13   : "Rayos x",
  14   : "Resonancia",
  15   : "Farmacia",
  16   : "Hospitalización",
};
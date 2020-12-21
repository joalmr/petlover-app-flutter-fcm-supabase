import 'package:flutter/material.dart';
import 'package:proypet/src/app/styles/styles.dart';
import 'package:proypet/src/app/views/components/timeline_life.dart';
import 'package:proypet/src/data/models/update/mascota/pet_model.dart';

Widget generalTab(MascotaModel2 pet) {
  DateTime fecha = DateTime.now().add(Duration(days: -900));

  return timelineLife(dateBorn: fecha, petStatus: pet.specieId);
}

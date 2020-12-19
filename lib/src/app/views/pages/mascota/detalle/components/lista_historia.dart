import 'dart:convert';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:proypet/src/app/views/components/timeline.dart';
import 'icono_historia.dart';

Widget listaHistorial(historias) {
  return ListView.builder(
    itemCount: historias.length,
    itemBuilder: (BuildContext context, int index) {
      String dmyString = historias[index].createdAt;
      DateTime dateTime = DateFormat('dd-MM-yyyy HH:mm').parse(dmyString);
      // Hm -> 24 horas // jm -> am pm
      var time = DateFormat.Hm().format(dateTime);

      return timeline(
        circleData: CircleAvatar(
          backgroundColor: Colors.transparent,
          backgroundImage:
              CachedNetworkImageProvider(historias[index].establishmentLogo),
          radius: 20.0,
        ),
        dayData: dateTime.day,
        monthData: dateTime.month,
        timeData: time,
        functionData: () {
          Get.toNamed('detallehistoriamascota', arguments: {
            "detalle": jsonEncode(historias[index].details),
            "precio": historias[index].amount,
            "proximacita": historias[index].nextdate,
            "motivo": historias[index].reason
          });
        },
        indexData: index,
        listLength: historias.length,
        subtitleIndex: iconosHistoria(historias[index].details),
        titleIndex: historias[index].establishment,
        yearValue: dateTime.year,
      );
    },
  );
}

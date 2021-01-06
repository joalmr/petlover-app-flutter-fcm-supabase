import 'dart:convert';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:proypet/src/app/views/components/timeline.dart';
import 'package:proypet/src/data/models/update/mascota/history_model.dart';
import 'icono_historia.dart';

Widget listaHistorialTab(List<HistoriaModel2> historias) {
  return ListView.builder(
    itemCount: historias.length,
    itemBuilder: (BuildContext context, int index) {
      String dmyString = historias[index].createdAt;
      DateTime dateTime = DateFormat('dd-MM-yyyy HH:mm').parse(dmyString);

      int yearPreviou = 0;
      if (index > 0) {
        DateTime datePrevio = DateFormat('dd-MM-yyyy HH:mm')
            .parse(historias[index - 1].createdAt);
        yearPreviou = datePrevio.year;
      }
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
        detailData: jsonEncode(historias[index].details),
        monthData: dateTime.month,
        priceData: historias[index].amount.toString(),
        timeData: time,
        indexData: index,
        listLength: historias.length,
        subtitleIndex: iconosHistoria(historias[index].details),
        titleIndex: historias[index].establishment,
        yearPreviou: index == 0 ? DateTime.now().year : yearPreviou,
        yearValue: dateTime.year,
      );
    },
  );
}

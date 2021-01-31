import 'dart:convert';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:proypet/src/app/components/timeline/timeline.dart';
import 'package:proypet/src/data/models/pet/pet_history_model.dart';
import 'icono_historia.dart';

Widget allHistories(List<PetHistoryModel> historias) {
  return ListView.builder(
    itemCount: historias.length,
    itemBuilder: (BuildContext context, int index) {
      DateTime dateTime = historias[index].attentionDate;

      int yearPreviou = 0;
      if (index > 0) {
        DateTime datePrevio = historias[index - 1].attentionDate;
        yearPreviou = datePrevio.year;
      }
      // Hm -> 24 horas // jm -> am pm
      var time = DateFormat.Hm().format(dateTime);

      return timeline(
        bonification: int.parse(historias[index].attentionBonification ?? '0'),
        circleData: CircleAvatar(
          backgroundColor: Colors.transparent,
          backgroundImage:
              CachedNetworkImageProvider(historias[index].establishmentLogo),
          radius: 20.0,
        ),
        dayData: dateTime.day,
        detailData: jsonEncode(historias[index].attentionDetails),
        monthData: dateTime.month,
        priceData: historias[index].attentionAmount,
        timeData: time,
        indexData: index,
        listLength: historias.length,
        subtitleIndex: iconosHistoria(historias[index].attentionDetails),
        titleIndex: historias[index].establishmentName,
        yearPreviou: index == 0 ? DateTime.now().year : yearPreviou,
        yearValue: dateTime.year,
      );
    },
  );
}

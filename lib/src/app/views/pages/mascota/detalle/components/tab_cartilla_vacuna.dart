import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:proypet/icons/icon_proypet_icons.dart';
import 'package:proypet/src/app/styles/lottie.dart';
import 'package:proypet/src/app/styles/styles.dart';
import 'package:proypet/src/controllers/mascota_controller/historia_vacuna_mascota_controller.dart';

import 'timeline/timeline_vacuna.dart';

class CartillaDigitalTab extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GetX<HistoriaVacunasController>(
        init: HistoriaVacunasController(),
        builder: (_) {
          return _.cargando.value
              ? Container(
                  child: Center(
                    child: lottieLoading,
                  ),
                )
              : _.listavacunas.length == 0
                  ? Center(
                      child: Text('No tiene registro de vacunas'),
                    )
                  : ListView.builder(
                      itemCount: _.listavacunas.length,
                      padding: EdgeInsets.only(top: 0),
                      itemBuilder: (BuildContext context, int index) {
                        String dmyString = _.listavacunas[index]['date'];
                        int yearPreviou = 0;
                        if (index > 0) {
                          DateTime datePrevio = DateFormat('yyyy-MM-dd')
                              .parse(_.listavacunas[index - 1]['date']);
                          yearPreviou = datePrevio.year;
                        }
                        DateTime dateTime =
                            DateFormat('yyyy-MM-dd').parse(dmyString);

                        return timelineVacuna(
                          circleData: CircleAvatar(
                            backgroundColor: colorMain,
                            child: Icon(
                              IconProypet.vacuna,
                              size: 18,
                              color: colorGray1,
                            ),
                            radius: 20.0,
                          ),
                          dayData: dateTime.day,
                          monthData: dateTime.month,
                          functionData: () {},
                          indexData: index,
                          listLength: _.listavacunas.length,
                          titleIndex: _.listavacunas[index]['vaccines'],
                          yearPreviou:
                              index == 0 ? DateTime.now().year : yearPreviou,
                          yearValue: dateTime.year,
                        );
                      },
                    );
        });
  }
}

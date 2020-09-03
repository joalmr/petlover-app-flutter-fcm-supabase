import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:proypet/src/app/views/components/appbar_menu.dart';
import 'package:proypet/src/app/views/components/transition/fadeViewSafeArea.dart';

import 'package:proypet/src/app/styles/styles.dart';

import 'components/cirugia.dart';
import 'components/consulta.dart';
import 'components/desparasitacion.dart';
import 'components/grooming.dart';
import 'components/vacuna.dart';

class HistoriaPage extends StatelessWidget {
  const HistoriaPage({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final dynamic historiaData = ModalRoute.of(context).settings.arguments;

    var jsonText = historiaData["detalle"];
    var precio = historiaData["precio"];
    var proximacita;
    var motivo = historiaData["motivo"];

    if (historiaData["proximacita"] != "") {
      proximacita = DateFormat('dd-MM-yyyy').format(DateTime.parse(historiaData["proximacita"]));
    }

    return Scaffold(
        appBar: appbar(null, 'Detalle de atención', null),
        body: FadeViewSafeArea(
          child: SingleChildScrollView(
            padding: const EdgeInsets.symmetric(vertical: 20.0, horizontal: 20.0),
            child: Column(
              children: <Widget>[
                (jsonText.toString().contains("grooming")) ? banio(jsonText["grooming"]) : SizedBox(),
                (jsonText.toString().contains("deworming")) ? desparasita(jsonText["deworming"]) : SizedBox(),
                (jsonText.toString().contains("vaccination")) ? vacuna(jsonText["vaccination"]) : SizedBox(),
                (jsonText.toString().contains("consultation")) ? consulta(jsonText["consultation"]) : SizedBox(),
                (jsonText.toString().contains("surgery")) ? cirugia(jsonText["surgery"]) : SizedBox(),
                Divider(
                  height: 30.0,
                  color: colorBrown1,
                ),
                Container(
                    width: double.infinity,
                    padding: EdgeInsets.only(right: 20.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        Text("Precio", style: TextStyle(fontWeight: FontWeight.bold, color: Get.textTheme.subtitle2.color)),
                        Text(
                          precio.toString(),
                          textAlign: TextAlign.right,
                          style: TextStyle(fontWeight: FontWeight.bold, color: Get.textTheme.subtitle2.color),
                        ),
                      ],
                    )),
                SizedBox(
                  height: 20.0,
                ),
                // Divider(),
                Container(
                  width: double.infinity,
                  padding: EdgeInsets.symmetric(vertical: 10.0, horizontal: 10.0),
                  decoration: BoxDecoration(
                    borderRadius: borderRadius,
                    color: Get.theme.backgroundColor,
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: <Widget>[
                      Text("Próxima cita", style: TextStyle(fontWeight: FontWeight.bold, fontSize: sizeSmallx2, color: Get.textTheme.subtitle2.color)),
                      Text(proximacita, style: TextStyle(fontWeight: FontWeight.bold, color: Get.textTheme.subtitle2.color)),
                      SizedBox(height: 10.0),
                      Text("Motivo", style: TextStyle(fontWeight: FontWeight.bold, fontSize: sizeSmallx2, color: Get.textTheme.subtitle2.color)),
                      Text(motivo, style: TextStyle(fontWeight: FontWeight.bold, color: Get.textTheme.subtitle2.color)),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ));
  }
}

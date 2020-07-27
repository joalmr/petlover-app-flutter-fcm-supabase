import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:proypet/icon_proypet_icons.dart';
import 'package:proypet/src/views/components/appbar_menu.dart';
import 'package:proypet/src/views/components/transicion/fadeViewSafeArea.dart';

import 'package:proypet/src/styles/styles.dart';

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
      proximacita = DateFormat('dd-MM-yyyy')
          .format(DateTime.parse(historiaData["proximacita"]));
    }

    return Scaffold(
        appBar: appbar(null, 'Detalle de atención', null),
        body: FadeViewSafeArea(
          child: SingleChildScrollView(
            padding:
                const EdgeInsets.symmetric(vertical: 20.0, horizontal: 20.0),
            child: Column(
              children: <Widget>[
                (jsonText.toString().contains("grooming"))
                    ? _banio(jsonText["grooming"], context)
                    : SizedBox(),
                (jsonText.toString().contains("deworming"))
                    ? _desparasita(jsonText["deworming"], context)
                    : SizedBox(),
                (jsonText.toString().contains("vaccination"))
                    ? _vacuna(jsonText["vaccination"], context)
                    : SizedBox(),
                (jsonText.toString().contains("consultation"))
                    ? _consulta(jsonText["consultation"], context)
                    : SizedBox(),
                (jsonText.toString().contains("surgery"))
                    ? _cirugia(jsonText["surgery"], context)
                    : SizedBox(),
                Divider(
                  height: 30.0,
                  color: colorBrown1,
                ),
                Container(
                    width: double.infinity,
                    padding: EdgeInsets.only(
                        right: 20.0), //.symmetric(horizontal: 0.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        Text("Precio",
                            style: TextStyle(
                                fontWeight: FontWeight.bold,
                                color: Theme.of(context)
                                    .textTheme
                                    .subtitle2
                                    .color)),
                        Text(
                          precio.toString(),
                          textAlign: TextAlign.right,
                          style: TextStyle(
                              fontWeight: FontWeight.bold,
                              color:
                                  Theme.of(context).textTheme.subtitle2.color),
                        ),
                      ],
                    )),
                SizedBox(
                  height: 20.0,
                ),
                // Divider(),
                Container(
                  width: double.infinity,
                  padding:
                      EdgeInsets.symmetric(vertical: 10.0, horizontal: 10.0),
                  decoration: BoxDecoration(
                    borderRadius: borderRadius,
                    color: Theme.of(context).backgroundColor,
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: <Widget>[
                      Text("Próxima cita",
                          style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: sizeLite,
                              color:
                                  Theme.of(context).textTheme.subtitle2.color)),
                      Text(proximacita,
                          style: TextStyle(
                              fontWeight: FontWeight.bold,
                              color:
                                  Theme.of(context).textTheme.subtitle2.color)),
                      SizedBox(
                        height: 10.0,
                      ),
                      Text("Motivo",
                          style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: sizeLite,
                              color:
                                  Theme.of(context).textTheme.subtitle2.color)),
                      Text(motivo,
                          style: TextStyle(
                              fontWeight: FontWeight.bold,
                              color:
                                  Theme.of(context).textTheme.subtitle2.color)),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ));
  }

  _banio(data, context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.start,
      children: <Widget>[
        Row(
          children: <Widget>[
            Icon(IconProypet.grooming,
                size: 16.0, color: Theme.of(context).textTheme.subtitle2.color),
            SizedBox(
              width: 10.0,
            ),
            Text(
              'Baño',
              style: Theme.of(context)
                  .textTheme
                  .subtitle1
                  .apply(fontWeightDelta: 2),
            ),
          ],
        ),
        SizedBox(
          height: 10,
        ),
        Text(
          "Recomendación",
          style: TextStyle(fontWeight: FontWeight.bold, fontSize: sizeLite),
        ),
        Text((data["recommendations"] != null) ? data["recommendations"] : "-"),
        SizedBox(
          height: 10,
        ),
        Text(
          "Atendido por",
          style: TextStyle(fontWeight: FontWeight.bold, fontSize: sizeLite),
        ),
        Text((data["employee"] != null) ? data["employee"] : "-"),
        Divider(),
        Container(
            width: double.infinity,
            padding: EdgeInsets.symmetric(horizontal: 20.0),
            child: Text(data["amount"].toString(), textAlign: TextAlign.right)),
      ],
    );
  }

  _desparasita(data, context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.start,
      children: <Widget>[
        Row(
          children: <Widget>[
            Icon(IconProypet.desparasitacion,
                size: 16.0, color: Theme.of(context).textTheme.subtitle2.color),
            SizedBox(
              width: 10.0,
            ),
            Text('Desparasitación',
                style: Theme.of(context)
                    .textTheme
                    .subtitle1
                    .apply(fontWeightDelta: 2)),
          ],
        ),
        SizedBox(
          height: 10,
        ),
        Text(
          "Recomendación",
          style: TextStyle(fontWeight: FontWeight.bold, fontSize: sizeLite),
        ),
        Text((data["recommendations"]) != null ? data["recommendations"] : "-"),
        SizedBox(
          height: 10,
        ),
        Text(
          "Atendido por",
          style: TextStyle(fontWeight: FontWeight.bold, fontSize: sizeLite),
        ),
        Text((data["employee"] != null) ? data["employee"] : "-"),
        Divider(),
        Container(
            width: double.infinity,
            padding: EdgeInsets.symmetric(horizontal: 20.0),
            child: Text(data["amount"].toString(), textAlign: TextAlign.right))
      ],
    );
  }

  _vacuna(data, context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.start,
      children: <Widget>[
        Row(
          children: <Widget>[
            Icon(IconProypet.vacuna,
                size: 16.0, color: Theme.of(context).textTheme.subtitle2.color),
            SizedBox(
              width: 10.0,
            ),
            Text(
              'Vacuna',
              style: Theme.of(context)
                  .textTheme
                  .subtitle1
                  .apply(fontWeightDelta: 2),
            ),
          ],
        ),
        SizedBox(
          height: 10,
        ),
        Text(
          "Recomendación",
          style: TextStyle(fontWeight: FontWeight.bold, fontSize: sizeLite),
        ),
        Text((data["recommendations"] != null) ? data["recommendations"] : "-"),
        SizedBox(
          height: 10,
        ),
        Text(
          "Atendido por",
          style: TextStyle(fontWeight: FontWeight.bold, fontSize: sizeLite),
        ),
        Text((data["employee"] != null) ? data["employee"] : "-"),
        Divider(),
        Container(
            width: double.infinity,
            padding: EdgeInsets.symmetric(horizontal: 20.0),
            child: Text(data["amount"].toString(), textAlign: TextAlign.right))
      ],
    );
  }

  _consulta(data, context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.start,
      children: <Widget>[
        Row(
          children: <Widget>[
            Icon(IconProypet.consulta,
                size: 16.0, color: Theme.of(context).textTheme.subtitle2.color),
            SizedBox(
              width: 10.0,
            ),
            Text(
              'Consulta',
              style: Theme.of(context)
                  .textTheme
                  .subtitle1
                  .apply(fontWeightDelta: 2),
            ),
          ],
        ),
        SizedBox(
          height: 10,
        ),
        Text(
          "Recomendación",
          style: TextStyle(fontWeight: FontWeight.bold, fontSize: sizeLite),
        ),
        Text((data["recommendations"] != null) ? data["recommendations"] : "-"),
        Text(
          "Atendido por",
          style: TextStyle(fontWeight: FontWeight.bold, fontSize: sizeLite),
        ),
        Text((data["employee"] != null) ? data["employee"] : "-"),
        Divider(),
        Container(
            width: double.infinity,
            padding: EdgeInsets.symmetric(horizontal: 20.0),
            child: Text(data["amount"].toString(), textAlign: TextAlign.right))
      ],
    );
  }

  _cirugia(data, context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.start,
      children: <Widget>[
        Row(
          children: <Widget>[
            Icon(IconProypet.cirugia,
                size: 16.0, color: Theme.of(context).textTheme.subtitle2.color),
            SizedBox(
              width: 10.0,
            ),
            Text(
              'Cirugía',
              style: Theme.of(context)
                  .textTheme
                  .subtitle1
                  .apply(fontWeightDelta: 2),
            ),
          ],
        ),
        SizedBox(
          height: 10,
        ),
        Text(
          "Recomendación",
          style: TextStyle(fontWeight: FontWeight.bold, fontSize: sizeLite),
        ),
        Text((data["recommendations"] != null) ? data["recommendations"] : "-"),
        Text(
          "Atendido por",
          style: TextStyle(fontWeight: FontWeight.bold, fontSize: sizeLite),
        ),
        Text((data["employee"] != null) ? data["employee"] : "-"),
        Divider(),
        Container(
            width: double.infinity,
            padding: EdgeInsets.symmetric(horizontal: 20.0),
            child: Text(data["amount"].toString(), textAlign: TextAlign.right))
      ],
    );
  }
}

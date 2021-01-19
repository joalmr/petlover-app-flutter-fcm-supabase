import 'dart:convert';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:proypet/src/app/styles/styles.dart';
import 'package:proypet/src/app/views/pages/mascota/historia/components/cirugia.dart';
import 'package:proypet/src/app/views/pages/mascota/historia/components/consulta.dart';
import 'package:proypet/src/app/views/pages/mascota/historia/components/desparasitacion.dart';
import 'package:proypet/src/app/views/pages/mascota/historia/components/grooming.dart';
import 'package:proypet/src/app/views/pages/mascota/historia/components/vacuna.dart';
import 'package:proypet/src/data/providers/pet/model/pet_history_model.dart';
import '../icono_historia.dart';

Widget cardHistory(PetHistoryModel history) {
  return Card(
    child: ExpansionTile(
      leading: CircleAvatar(
        backgroundColor: Colors.transparent,
        backgroundImage: CachedNetworkImageProvider(history.establishmentLogo),
        radius: 20.0,
      ),
      title: Text(
        history.establishmentName,
        style: Get.textTheme.subtitle2.apply(fontWeightDelta: 2),
        maxLines: 2,
      ),
      subtitle: iconosHistoria(history.attentionDetails),
      expandedCrossAxisAlignment: CrossAxisAlignment.start,
      childrenPadding: EdgeInsets.only(left: 10, right: 10.0, top: 2),
      children: [
        _service(jsonEncode(history.attentionDetails)),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              'Precio',
              style: TextStyle(
                fontWeight: FontWeight.bold,
              ),
            ),
            Text(
              history.attentionAmount,
              style: TextStyle(
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
        Container(
          width: double.infinity,
          padding: EdgeInsets.only(top: 5),
          child: Row(
            children: <Widget>[
              Icon(FontAwesomeIcons.coins, size: 12, color: colorMain),
              SizedBox(width: 2.5),
              Text(
                "Ganaste ${history.attentionBonification} puntos",
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),
        ),
        SizedBox(height: 20),
        // //TODO: quitar antes de publicar
        // appPruebas
        //     ? Align(
        //         widthFactor: double.maxFinite,
        //         alignment: Alignment.centerRight,
        //         child: IconButton(
        //           iconSize: 22,
        //           icon: Icon(Icons.help_outline),
        //           onPressed: () {},
        //           tooltip: 'Ayuda',
        //         ),
        //       )
        //     : SizedBox(height: 0)
      ],
    ),
  );
}

Widget _service(jsonDato) {
  Map<String, dynamic> jsonData;
  try {
    jsonData = jsonDecode(jsonDato);
  } catch (e) {
    jsonData = null;
  }

  if (jsonData != null)
    return Column(
      children: [
        jsonData.containsKey('grooming')
            ? banio(jsonData['grooming'])
            : SizedBox(height: 0),
        jsonData.containsKey('deworming')
            ? desparasita(jsonData["deworming"])
            : SizedBox(height: 0),
        jsonData.containsKey('vaccination')
            ? vacuna(jsonData["vaccination"])
            : SizedBox(height: 0),
        jsonData.containsKey('consultation')
            ? consulta(jsonData["consultation"])
            : SizedBox(height: 0),
        jsonData.containsKey('surgery')
            ? cirugia(jsonData["surgery"])
            : SizedBox(height: 0)
      ],
    );
  else
    return SizedBox(
      height: 20,
      width: double.maxFinite,
      child: Container(
        color: colorRed,
        child: Center(
          child: Text(
            'Error',
            style: TextStyle(color: Colors.white),
          ),
        ),
      ),
    );
}

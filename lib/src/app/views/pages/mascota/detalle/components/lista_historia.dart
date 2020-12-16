import 'dart:convert';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:proypet/src/app/styles/styles.dart';

import 'icono_historia.dart';

Widget listaHistorial(BuildContext context, historias) {
  return ListView.builder(
    padding: EdgeInsets.only(top: 0),
    itemCount: historias.length,
    itemBuilder: (context, int index) {
      final fecha = historias[index].createdAt.toString().split(' ')[0];
      final firstYear =
          historias[0].createdAt.toString().split(' ')[0].split('-')[2];
      final dataYear = fecha.split('-')[2];
      return Container(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            index == 0 ? years(dataYear) : SizedBox(height: 0),
            firstYear != dataYear ? years(dataYear) : SizedBox(height: 0),
            //
            Row(
              children: [
                Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      '${fecha.split('-')[0]}-${fecha.split('-')[1]}',
                      style: TextStyle(
                        fontSize: 10,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Text(
                      historias[index].createdAt.toString().split(' ')[1],
                      style: TextStyle(
                        fontSize: 10,
                      ),
                      textAlign: TextAlign.center,
                    ),
                  ],
                ),
                Column(
                  children: [
                    Container(
                      width: 1,
                      height: 30,
                      color: Get.theme.iconTheme.color,
                    ),
                    Padding(
                      padding: const EdgeInsets.all(2),
                      child: Container(
                        margin: EdgeInsets.only(left: 5, right: 5),
                        padding: EdgeInsets.all(1),
                        decoration: BoxDecoration(
                          color: index == 0
                              ? colorMain
                              : Get.theme.iconTheme.color,
                          borderRadius: BorderRadius.circular(50),
                        ),
                        child: CircleAvatar(
                          backgroundColor: Colors.transparent,
                          backgroundImage: CachedNetworkImageProvider(
                              historias[index].establishmentLogo),
                          radius: 20.0,
                        ),
                      ),
                    ),
                    Container(
                      width: 1,
                      height: 30,
                      color: index == historias.length - 1
                          ? Colors.transparent
                          : Get.theme.iconTheme.color,
                    )
                  ],
                ),
                Expanded(
                  child: Container(
                    child: Card(
                      // elevation: 0,
                      child: ListTile(
                        onTap: () {
                          Get.toNamed('detallehistoriamascota', arguments: {
                            "detalle": jsonEncode(historias[index].details),
                            "precio": historias[index].amount,
                            "proximacita": historias[index].nextdate,
                            "motivo": historias[index].reason
                          });
                        },
                        title: Text(
                          historias[index].establishment,
                          style:
                              Get.textTheme.subtitle2.apply(fontWeightDelta: 2),
                          maxLines: 2,
                        ),
                        subtitle: iconosHistoria(historias[index].details),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      );
    },
  );
}

Widget years(dataYear) {
  return Row(
    mainAxisAlignment: MainAxisAlignment.start,
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          SizedBox(height: 10),
          Padding(
            padding: EdgeInsets.only(left: 30),
            child: Text(
              dataYear,
              style: TextStyle(
                fontSize: 14,
                fontWeight: FontWeight.bold,
                letterSpacing: 2.2,
                color: colorMain,
              ),
            ),
          ),
        ],
      ),
      Expanded(
        child: SizedBox(height: 25),
      ),
    ],
  );
}

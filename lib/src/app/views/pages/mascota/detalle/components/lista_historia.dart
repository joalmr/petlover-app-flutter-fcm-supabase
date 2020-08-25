import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'icono_historia.dart';

listaHistorial(BuildContext context, historias) {
  return ListView.builder(
      physics: NeverScrollableScrollPhysics(),
      shrinkWrap: true,
      itemCount: historias.length,
      itemBuilder: (context, int index) {
        return FlatButton(
          onPressed: () => Get.toNamed('detallehistoriamascota', arguments: {
            "detalle": historias[index].details,
            "precio": historias[index].amount,
            "proximacita": historias[index].nextdate,
            "motivo": historias[index].reason
          }),
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 10.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                Expanded(
                  child: Row(
                    children: <Widget>[
                      CircleAvatar(
                        backgroundColor: Colors.transparent,
                        backgroundImage: CachedNetworkImageProvider(historias[index].establishmentLogo),
                        radius: 20.0,
                      ),
                      SizedBox(width: 7.0),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Text(
                            historias[index].establishment,
                            style: Get.textTheme.subtitle2.apply(fontWeightDelta: 2),
                          ),
                          iconosHistoria(historias[index].details)
                        ],
                      ),
                    ],
                  ),
                ),
                Column(
                  children: <Widget>[
                    Text(
                      historias[index].createdAt.toString().split(' ')[0],
                      style: Get.textTheme.subtitle2.apply(fontWeightDelta: 2).copyWith(fontSize: 12.0),
                    ),
                    Text(
                      historias[index].createdAt.toString().split(' ')[1],
                      style: Get.textTheme.subtitle2.apply(fontWeightDelta: 2),
                      textAlign: TextAlign.center,
                    ),
                  ],
                ),
              ],
            ),
          ),
        );
      });
}

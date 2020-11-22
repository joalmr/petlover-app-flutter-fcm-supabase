import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'icono_historia.dart';

Widget listaHistorial(BuildContext context, historias) {
  return SingleChildScrollView(
    child: ListView.builder(
        physics: NeverScrollableScrollPhysics(),
        padding: EdgeInsets.only(top: 0),
        shrinkWrap: true,
        itemCount: historias.length,
        itemBuilder: (context, int index) {
          return Card(
            child: ListTile(
              onTap: () => Get.toNamed('detallehistoriamascota', arguments: {
                "detalle": historias[index].details,
                "precio": historias[index].amount,
                "proximacita": historias[index].nextdate,
                "motivo": historias[index].reason
              }),
              leading: CircleAvatar(
                backgroundColor: Colors.transparent,
                backgroundImage: CachedNetworkImageProvider(
                    historias[index].establishmentLogo),
                radius: 20.0,
              ),
              title: Text(
                historias[index].establishment,
                style: Get.textTheme.subtitle2.apply(fontWeightDelta: 2),
                maxLines: 2,
              ),
              subtitle: iconosHistoria(historias[index].details),
              trailing: Column(
                children: <Widget>[
                  Text(
                    historias[index].createdAt.toString().split(' ')[0],
                    style: Get.textTheme.subtitle2
                        .apply(fontWeightDelta: 2)
                        .copyWith(fontSize: 12.0),
                  ),
                  Text(
                    historias[index].createdAt.toString().split(' ')[1],
                    style: Get.textTheme.subtitle2.apply(fontWeightDelta: 2),
                    textAlign: TextAlign.center,
                  ),
                ],
              ),
            ),
          );
        }),
  );
}

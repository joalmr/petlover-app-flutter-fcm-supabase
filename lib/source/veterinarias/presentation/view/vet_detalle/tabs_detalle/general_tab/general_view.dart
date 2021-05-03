import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:proypet/source/veterinarias/domain/controller/detalle_vet_controller.dart';
import 'components/servicios.dart';

class ViewGeneral extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GetBuilder<VetDetalleController>(builder: (_) {
      return SingleChildScrollView(
        child: Column(
          children: <Widget>[
            SizedBox(height: 10.0),
            Container(
              width: double.infinity,
              padding: EdgeInsets.only(left: 20.0, right: 20.0, bottom: 5.0),
              child: Text("Servicios",
                  style: Get.textTheme.subtitle2.apply(fontWeightDelta: 2)),
            ),
            Container(
              padding: EdgeInsets.symmetric(horizontal: 10.0),
              child: servicios(_.vet.services),
            ),
            Container(
              padding: EdgeInsets.only(
                  left: 20.0, right: 20.0, top: 10.0, bottom: 10.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.start,
                children: <Widget>[
                  Text('Descripción',
                      style: Get.textTheme.subtitle2.apply(fontWeightDelta: 2)),
                  SizedBox(height: 5.0),
                  Text(
                    _.vet.description,
                    textAlign: TextAlign.justify,
                  ),
                  SizedBox(width: double.infinity),
                ],
              ),
            ),
          ],
        ),
      );
    });
  }
}

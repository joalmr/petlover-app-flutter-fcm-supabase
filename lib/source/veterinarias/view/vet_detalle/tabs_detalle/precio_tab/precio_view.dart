import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:proypet/design/styles/styles.dart';
import 'package:proypet/source/veterinarias/controller/detalle_vet_controller.dart';

import 'components/lista_precios.dart';

class ViewPrecio extends StatelessWidget {
  const ViewPrecio({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<VetDetalleController>(builder: (_) {
      return SingleChildScrollView(
        child: Column(
          children: <Widget>[
            SizedBox(height: 10.0),
            Container(
                padding: const EdgeInsets.symmetric(horizontal: 20.0),
                width: double.infinity,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Text("Precio referencial",
                        style:
                            Get.textTheme.subtitle2.apply(fontWeightDelta: 2)),
                    Text("*Sujeto a revisión física de mascota",
                        style: TextStyle(fontSize: sizeSmallx2)),
                    if (_.vet.prices.length > 0)
                      listaPrecio(_.vet.prices)
                    else
                      Text("No tiene precios registrados")
                  ],
                )),
          ],
        ),
      );
    });
  }
}

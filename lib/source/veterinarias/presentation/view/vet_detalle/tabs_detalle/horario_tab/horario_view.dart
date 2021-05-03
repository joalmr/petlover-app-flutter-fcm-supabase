import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:proypet/source/veterinarias/domain/controller/detalle_vet_controller.dart';
import 'components/lista_horarios.dart';

class ViewHorario extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GetBuilder<VetDetalleController>(builder: (_) {
      return SingleChildScrollView(
        child: Column(
          children: <Widget>[
            SizedBox(
              height: 10.0,
            ),
            Container(
                padding: const EdgeInsets.symmetric(horizontal: 20.0),
                width: double.infinity,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    (_.vet.schedule.length > 0)
                        ? listHorario(_.vet.schedule)
                        : Center(child: Text("No tiene horarios registrados"))
                  ],
                )),
          ],
        ),
      );
    });
  }
}

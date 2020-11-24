import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:proypet/src/app/styles/styles.dart';
import 'package:proypet/src/data/models/model/servicio_reserva.dart';

import '../../reserva_vet_controller.dart';

class MisServicioReserva extends StatelessWidget {
  // final String texto;
  // final int numero;
  final ServicioReserva item;
  MisServicioReserva(this.item);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<ReservaVetController>(builder: (_) {
      return Padding(
        padding: const EdgeInsets.symmetric(horizontal: 4, vertical: 2),
        child: FlatButton(
          child: Text(
            item.name,
            style: TextStyle(
                color:
                    _.listaServicio.contains(item) ? Colors.white : colorGray3),
          ),
          onPressed: () => _.add2List(item),
          color:
              _.listaServicio.contains(item) ? colorGreen2 : Colors.transparent,
          shape: RoundedRectangleBorder(
            borderRadius: new BorderRadius.circular(20.0),
            side: BorderSide(
                color:
                    _.listaServicio.contains(item) ? colorGreen2 : colorGray3),
          ),
        ),
      );
    });
  }
}

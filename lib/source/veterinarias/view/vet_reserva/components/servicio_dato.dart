import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:proypet/design/styles/styles.dart';
import 'package:proypet/source/veterinarias/controller/reserva_vet_controller.dart';

import 'package:proypet/source/booking/model/servicio_reserva.dart';

class MisServicioReserva extends StatelessWidget {
  final ServicioReserva item;
  MisServicioReserva(this.item);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<ReservaVetController>(
      builder: (_) {
        return Padding(
          padding: const EdgeInsets.symmetric(horizontal: 2, vertical: 0),
          child: FlatButton(
            padding: EdgeInsets.all(5),
            child: Text(
              item.name,
              style: TextStyle(
                fontSize: 12,
                color:
                    _.listaServicio.contains(item) ? Colors.white : colorGray3,
              ),
            ),
            onPressed: () => _.add2List(item),
            color: _.listaServicio.contains(item)
                ? colorGreen2
                : Colors.transparent,
            shape: RoundedRectangleBorder(
              borderRadius: new BorderRadius.circular(20.0),
              side: BorderSide(
                color:
                    _.listaServicio.contains(item) ? colorGreen2 : colorGray3,
              ),
            ),
          ),
        );
      },
    );
  }
}

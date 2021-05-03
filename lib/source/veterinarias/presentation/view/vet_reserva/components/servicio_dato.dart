import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:proypet/design/styles/styles.dart';
import 'package:proypet/source/booking/model/servicio_reserva.dart';
import 'package:proypet/source/veterinarias/domain/controller/reserva_vet_controller.dart';

class MisServicioReserva extends StatelessWidget {
  final ServicioReserva item;
  MisServicioReserva(this.item);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<ReservaVetController>(
      builder: (_) {
        return Padding(
          padding: const EdgeInsets.symmetric(horizontal: 2, vertical: 0),
          child: TextButton(
            child: Text(
              item.name,
              style: TextStyle(
                color: _.listaServicio.contains(item) ? Colors.white : colorGray3,
                fontSize: 12,
              ),
            ),
            onPressed: () => _.add2List(item),
            style: TextButton.styleFrom(
              padding: EdgeInsets.all(7.5),
              textStyle: TextStyle(fontWeight: FontWeight.bold),
              backgroundColor: _.listaServicio.contains(item) ? colorMain : Colors.transparent,
              shape: RoundedRectangleBorder(
                borderRadius: new BorderRadius.circular(20.0),
                side: BorderSide(color: _.listaServicio.contains(item) ? colorMain : colorGray3),
              ),
            ),
          ),
        );
      },
    );
  }
}

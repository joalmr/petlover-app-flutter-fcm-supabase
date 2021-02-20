import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:proypet/components/form_control/button_primary.dart';
import 'package:proypet/source/veterinarias/controller/reserva_vet_controller.dart';

import 'servicio_dato.dart';

serviciosSeleccionados(context) {
  return GetBuilder<ReservaVetController>(builder: (_) {
    return Container(
      padding:
          EdgeInsets.symmetric(horizontal: 20, vertical: Get.height * 0.10),
      child: Card(
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 10),
          child: Column(
            children: [
              Text(
                'Seleccione servicios',
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 20),
              Expanded(
                child: Wrap(
                  children: _.servicioReservaLista
                      .map((item) => MisServicioReserva(item))
                      .toList()
                      .cast<Widget>(),
                ),
              ),
              buttonPri('Aplicar', () => Get.back()),
            ],
          ),
        ),
      ),
    );
  });
}

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:proypet/src/app/views/components/form_control/button_primary.dart';
import 'package:proypet/src/data/models/model/servicio_reserva.dart';
import '../../reserva_vet_controller.dart';
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
                child: FutureBuilder(
                  future: _.getData(),
                  builder: (BuildContext context,
                      AsyncSnapshot<List<ServicioReserva>> snapshot) {
                    if (snapshot.data == null) {
                      return Text("Espere...");
                    } else {
                      return Wrap(
                        children: snapshot.data
                            .map((item) => MisServicioReserva(item))
                            .toList()
                            .cast<Widget>(),
                      );
                    }
                  },
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

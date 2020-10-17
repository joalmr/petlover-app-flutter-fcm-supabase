import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:proypet/src/app/views/components/form_control/button_primary.dart';
import 'package:proypet/src/app/views/components/transition/fadeViewSafeArea.dart';
import 'package:proypet/src/controllers/veterinaria_controller/filtra_vets_controller.dart';

import 'components/direccion.dart';
import 'components/servicio_flat.dart';

class FiltraVets extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final alto = context.height;
    final ancho = context.width;

    //GetX
    return GetX<FiltraVetsController>(
      builder: (_) {
        return Scaffold(
          appBar: AppBar(
            iconTheme: IconThemeData(color: Get.textTheme.subtitle2.color),
            title: Text(
              'Filtrar veterinarias',
              style: TextStyle(color: Get.textTheme.subtitle2.color),
            ),
            backgroundColor: Colors.transparent,
            elevation: 0,
          ),
          body: FadeViewSafeArea(
            child: Stack(
              children: <Widget>[
                Container(height: alto),
                Container(
                  height: alto - 130,
                  child: SingleChildScrollView(
                    padding: EdgeInsets.symmetric(horizontal: 20, vertical: 0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: <Widget>[
                        SizedBox(height: 10),
                        Padding(
                          padding: const EdgeInsets.symmetric(vertical: 5),
                          child: Text('Actualizar ubicación', style: Get.textTheme.subtitle2.apply(fontWeightDelta: 2)),
                        ),
                        autocompleteAddress(),
                        SizedBox(height: 5),
                        // InkWell(
                        //   child: Text('Ubicación actual', style: TextStyle(color: colorMain)),
                        //   onTap: _.ubicacionActual,
                        // ),
                        SizedBox(height: 10),
                        Padding(
                          padding: const EdgeInsets.symmetric(vertical: 5),
                          child: Text(
                            'Servicios',
                            style: Get.textTheme.subtitle2.apply(fontWeightDelta: 2),
                          ),
                        ),
                        Wrap(
                          children: <Widget>[
                            ServicioFlat('Baños/Grooming', 1),
                            ServicioFlat('Cirugía', 3),
                            ServicioFlat('Consulta', 2),
                            ServicioFlat('Desparasitación', 11),
                            ServicioFlat('Ecografía', 12),
                            ServicioFlat('Electrocardiograma', 6),
                            ServicioFlat('Emergencia 24 horas', 8),
                            ServicioFlat('Farmacia', 15),
                            ServicioFlat('Hospedaje', 9),
                            ServicioFlat('Hospitalización', 16),
                            ServicioFlat('Laboratorio', 7),
                            ServicioFlat('Movilidad', 5),
                            ServicioFlat('Petshop', 10),
                            ServicioFlat('Rayos x', 13),
                            ServicioFlat('Resonancia', 14),
                            ServicioFlat('Vacuna', 4),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
                Positioned(
                    bottom: 0,
                    child: Container(
                      width: ancho,
                      color: Theme.of(context).dialogBackgroundColor,
                      padding: EdgeInsets.symmetric(horizontal: 20, vertical: 5),
                      child: buttonPri("Filtrar", _.filtrar, cargando: _.btnFiltra.value),
                    ))
              ],
            ),
          ),
        );
      },
    );
  }
}

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:proypet/components/form_control/button_primary.dart';
import 'package:proypet/components/form_control/buttons/btn_alternative.dart';
import 'package:proypet/components/form_control/buttons/btn_primary.dart';
import 'package:proypet/components/transition/fadeViewSafeArea.dart';
import 'package:proypet/design/styles/styles.dart';
import 'package:proypet/source/veterinarias/controller/filtra_vets_controller.dart';
import 'package:share/share.dart';

import 'components/direccion.dart';
import 'components/servicio_flat.dart';

class FiltraVets extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final ancho = context.width;

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
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.start,
              children: <Widget>[
                Expanded(
                  child: ListView(
                    padding: EdgeInsets.all(10),
                    children: [
                      Padding(
                        padding: const EdgeInsets.symmetric(vertical: 5),
                        child: Text('Actualizar ubicación',
                            style: Get.textTheme.subtitle2
                                .apply(fontWeightDelta: 2)),
                      ),
                      autocompleteAddress(),
                      SizedBox(height: 5),
                      SizedBox(height: 10),
                      Padding(
                        padding: const EdgeInsets.symmetric(vertical: 5),
                        child: Text(
                          'Servicios',
                          style:
                              Get.textTheme.subtitle2.apply(fontWeightDelta: 2),
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
                Card(
                  margin: EdgeInsets.symmetric(horizontal: 20),
                  child: Container(
                    width: double.maxFinite,
                    padding: EdgeInsets.all(10),
                    child: Column(
                      children: [
                        Text(
                          '¿No encuentras tu veterinaria?',
                          style: TextStyle(fontSize: 16),
                        ),
                        SizedBox(height: 0.5),
                        btnAltern(
                          text: 'Solicita su ingreso',
                          onPressed: () => Get.toNamed('solicitaveterinaria'),
                          color: colorMain, //observado
                        ),
                        FlatButton(
                          onPressed: () => Share.share(
                              'Hola! Te invito a que seas parte de Proypet❤️ Entérate más en: https://proypet.com/veterinarias',
                              subject: 'Se parte de Proypet'),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Icon(
                                Icons.share,
                                color: colorMain,
                              ),
                              SizedBox(width: 10),
                              Text(
                                'Invitar a mi veterinaria',
                                style: TextStyle(
                                  fontSize: 14.0,
                                  fontWeight: FontWeight.bold,
                                  color: colorMain,
                                ),
                              ),
                            ],
                          ),
                          padding: EdgeInsets.symmetric(
                            vertical: 12.0,
                            horizontal: 20.0,
                          ),
                          shape: shape10,
                        ),
                      ],
                    ),
                  ),
                ),
                SizedBox(height: 10),
                Container(
                  width: ancho,
                  padding: EdgeInsets.symmetric(horizontal: 20, vertical: 5),
                  child: btnPrimary(
                    text: "Filtrar",
                    onPressed: _.filtrar,
                    cargando: _.btnFiltra.value,
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}

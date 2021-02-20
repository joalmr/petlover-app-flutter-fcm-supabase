import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:proypet/components/appbar_menu.dart';
import 'package:proypet/source/mascota/controller/detalle_mascota_controller.dart';

import 'all_histories.dart';

class HistorialMascota extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GetBuilder<MascotaDetalleController>(
      initState: (_) {},
      builder: (_) {
        return Scaffold(
          appBar: appbar(null, 'Historial de ${_.pet.name}', null),
          body: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10),
            child: _.petAllHistory.length == 0
                ? Center(
                    child: Text('No tiene registros de historial'),
                  )
                : allHistories(_.petAllHistory.toList()),
          ),
        );
      },
    );
  }
}

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/state_manager.dart';
import 'package:proypet/src/app/styles/lottie.dart';
import 'package:proypet/src/app/styles/styles.dart';
import 'package:proypet/src/app/views/components/form_control/button_primary.dart';
import 'package:proypet/src/app/views/components/form_control/text_from.dart';
import 'package:proypet/src/controllers/veterinaria_controller/buscar_vet_controller.dart';

class BuscarVeterinaria extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GetX<BuscarVetController>(
      init: BuscarVetController(),
      builder: (_) {
        return Scaffold(
          appBar: AppBar(
            title: FormularioText(
              hintText: 'Buscar veterinaria',
              autofocus: true,
              onChanged: (value) => _.findVet(value),
            ),
          ),
          body: _.carga.value
              ? Center(
                  child: lottieLoading,
                )
              : _.veterinarias.length == 0
                  ? Card(
                      margin:
                          EdgeInsets.symmetric(horizontal: 20, vertical: 60),
                      child: Container(
                        width: double.maxFinite,
                        height: 90,
                        padding: EdgeInsets.all(10),
                        child: Column(
                          children: [
                            Text(
                              '¿No encuentras tu veterinaria?',
                              style: TextStyle(fontSize: 16),
                            ),
                            SizedBox(height: 0.5),
                            buttonFlat(
                              'Solicita su ingreso',
                              () => Get.toNamed('solicitaveterinaria'),
                              colorMain,
                            ),
                          ],
                        ),
                      ),
                    )
                  : ListView.builder(
                      itemCount: _.veterinarias.length,
                      padding: EdgeInsets.all(5),
                      itemBuilder: (BuildContext context, int index) {
                        return Card(
                          child: ListTile(
                            onTap: () => Get.toNamed(
                              'vetdetalle',
                              arguments: _.veterinarias[index].id,
                            ),
                            leading: CircleAvatar(
                              backgroundImage: CachedNetworkImageProvider(
                                  _.veterinarias[index].logo),
                            ),
                            title: Text(_.veterinarias[index].name),
                            subtitle: Text(_.veterinarias[index].address),
                            trailing: Column(
                              children: [
                                Icon(Icons.star, color: colorYellow),
                                Text(_.veterinarias[index].stars),
                              ],
                            ),
                          ),
                        );
                      },
                    ),
        );
      },
    );
  }
}

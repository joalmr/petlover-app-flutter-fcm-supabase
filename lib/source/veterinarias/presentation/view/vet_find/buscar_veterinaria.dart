import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:proypet/components/form_control/buttons/btn_alternative.dart';
import 'package:proypet/components/form_control/buttons/btn_secondary.dart';
import 'package:proypet/components/form_control/text_from.dart';
import 'package:proypet/design/styles/lottie.dart';
import 'package:proypet/design/styles/styles.dart';
import 'package:proypet/source/veterinarias/domain/controller/buscar_vet_controller.dart';
import 'package:proypet/source/veterinarias/presentation/view/components/direccion.dart';
import 'package:share/share.dart';

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
              : !_.hasPosition.value
                  ? Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 20),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: <Widget>[
                          SizedBox(height: 40),
                          Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 30),
                            child: Text(
                              'Debe ingresar una dirección para buscar veterinarias',
                              style: Get.textTheme.subtitle1,
                              textAlign: TextAlign.center,
                            ),
                          ),
                          SizedBox(height: 10),
                          autocompleteAddress(),
                          SizedBox(height: 10),
                          btnSecondary(
                            text: 'Buscar',
                            onPressed: () => _.filtra(),
                            color: colorMain,
                          ),
                        ],
                      ),
                    )
                  : _.veterinarias.length == 0
                      ? Card(
                          margin: EdgeInsets.symmetric(
                              horizontal: 20, vertical: 60),
                          child: Container(
                            width: double.maxFinite,
                            height: 140,
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
                                  onPressed: () =>
                                      Get.toNamed('help/solicitavet'),
                                  color: colorMain, //observado
                                ),
                                TextButton(
                                  onPressed: () => Share.share(
                                      'Hola! Te invito a que seas parte de Proypet❤️ Entérate más en: https://proypet.com/veterinarias',
                                      subject: 'Se parte de Proypet'),
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
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
                                  'vet',
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

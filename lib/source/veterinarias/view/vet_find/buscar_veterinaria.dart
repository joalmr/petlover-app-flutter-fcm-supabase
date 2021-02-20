import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/state_manager.dart';
import 'package:proypet/components/form_control/button_primary.dart';
import 'package:proypet/components/form_control/text_from.dart';
import 'package:proypet/design/styles/lottie.dart';
import 'package:proypet/design/styles/styles.dart';
import 'package:proypet/source/veterinarias/controller/buscar_vet_controller.dart';
import 'package:proypet/source/veterinarias/view/components/direccion.dart';
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
                          buttonOutLine(
                            'Buscar',
                            () => _.filtra(),
                            colorMain,
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
                                buttonFlat(
                                  'Solicita su ingreso',
                                  () => Get.toNamed('solicitaveterinaria'),
                                  colorMain,
                                ),
                                FlatButton(
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
                                  padding: EdgeInsets.symmetric(
                                    vertical: 12.0,
                                    horizontal: 20.0,
                                  ),
                                  shape: shape10,
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

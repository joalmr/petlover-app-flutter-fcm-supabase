import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:proypet/components/form_control/buttons/btn_alternative.dart';
import 'package:proypet/components/form_control/buttons/btn_secondary.dart';
import 'package:proypet/components/navegadores/appbar.dart';
import 'package:proypet/config/path_variables.dart';
import 'package:proypet/design/styles/styles.dart';
import 'package:proypet/source/mascota/controller/mascota_drawer_controller.dart';

class FalleceMacota extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return GetBuilder<MascotaDrawerController>(
      builder: (_){
        return Scaffold(
          appBar: appBar(texto: 'Fallecido', acc: null),
          body: SingleChildScrollView(
            child: 
            Container(
              width: double.maxFinite,
              child: _.petC.pet.status != 0
                ? Column(
                  children: [
                    _.petC.pet.specieId == 2 
                      ? Image(image: AssetImage('images/cat_dog/dog-death.png'),height: 100,)
                      : Image(image: AssetImage('images/cat_dog/cat-death.png'),height: 100,),
                    SizedBox(height: 10),
                    Text(
                      'Lamentamos la perdida de tu ser querido.',
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                    SizedBox(height: 20),
                    Container(
                      padding: EdgeInsets.only(left: 15),
                      width: double.maxFinite,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text('• Se eliminaran las atenciones y reservas pendientes'),
                          // Text('• '),
                        ],
                      ),
                    ),
                    SizedBox(height: 30),
                    btnSecondary(
                      text: 'Falleció mi mascota',
                      color: colorRed,
                      onPressed: () => _.falleceMascota(true),
                    ),
                    SizedBox(height: 10),
                    btnAltern(
                      text: 'Cancelar',
                      onPressed: () => Get.back(),
                    ),
                  ],
                )
                : Column(
                  children: [
                    _.petC.pet.specieId == 2 
                      ? Image(image: AssetImage(pathGif('perro-kb')),height: 100,)
                      : Image(image: AssetImage(pathGif('gato-kb')),height: 100,),
                    SizedBox(height: 10),
                    Text(
                      'Cometiste un error?',
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                    SizedBox(height: 20),
                    btnSecondary(
                      text: 'Sí, cometí un error',
                      color: colorMain,
                      onPressed: () => _.falleceMascota(false),
                    ),
                    SizedBox(height: 10),
                    btnAltern(
                      text: 'Cancelar',
                      onPressed: () => Get.back(),
                    ),
                  ],
                ),
            ),
          )
        );
      },
    );
  }
}
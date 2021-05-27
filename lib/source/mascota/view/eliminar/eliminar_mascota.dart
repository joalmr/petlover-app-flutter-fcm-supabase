import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:proypet/components/form_control/buttons/btn_alternative.dart';
import 'package:proypet/components/form_control/buttons/btn_secondary.dart';
import 'package:proypet/components/navegadores/appbar.dart';
import 'package:proypet/design/styles/styles.dart';
import 'package:proypet/source/mascota/controller/mascota_drawer_controller.dart';

class EliminarMascota extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return GetBuilder<MascotaDrawerController>(
      builder: (_){
        return Scaffold(
          appBar: appBar(texto: 'Eliminar', acc: null),
          body: SingleChildScrollView(
            child: Container(
              width: double.maxFinite,
              child: Column(
                children: [
                  Icon(Icons.cancel_rounded,color: colorRed,size: 65,),
                  SizedBox(height: 10),
                  Text(
                    'Seguro que desea eliminar a ${_.petC.pet.name}?',
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
                        Text('• Esta acción no tiene marcha atrás, si elimina a su mascota no podrá ser recuperada'),
                        Text('• Se eliminaran las atenciones y reservas pendientes'),
                      ],
                    ),
                  ),
                  SizedBox(height: 30),
                  btnSecondary(
                    text: 'Sí, eliminar',
                    color: colorRed,
                    onPressed: () => Get.dialog(
                      AlertDialog(
                        title: Text('Eliminar'),
                        content: Text('Confirma que desea eliminar a ${_.petC.pet.name}?'), //${mascota.name}
                        actions: <Widget>[
                          TextButton(
                            onPressed: () => Get.back(),
                            child: Text('Cancelar',
                              style: Get.textTheme.subtitle2.apply(fontWeightDelta: 2),
                            ),
                          ),
                          TextButton(
                            onPressed: () => _.eliminaMascota(),
                            child: Text('Sí, eliminar',
                              style: Get.textTheme.subtitle2
                              .apply(fontWeightDelta: 2, color: colorRed),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  SizedBox(height: 10),
                  btnAltern(
                    text: 'Cancelar',
                    onPressed: () => Get.back(),
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
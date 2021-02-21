import 'package:animate_do/animate_do.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:proypet/design/styles/lottie.dart';
import 'package:proypet/design/styles/styles.dart';
import 'package:proypet/source/mascota/controller/agregar_mascota_controller.dart';
import 'components/add_pet_step.dart';

class MascotaAgregarPage extends StatelessWidget {
  const MascotaAgregarPage({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetX<MascotaAgregarController>(
        init: MascotaAgregarController(),
        builder: (_) {
          return Scaffold(
            // appBar: appbar(null, 'Agregar mascota', null),
            appBar: AppBar(
              leading: Padding(
                padding: const EdgeInsets.all(8.0),
                child: CircleAvatar(
                  backgroundColor: colorMain,
                  child: Text(
                    _.page.toString(),
                    style: TextStyle(color: Colors.white),
                  ),
                ),
              ),
              title: Text('Agregar mascota'),
            ),
            body: _.loading.value
                ? FadeIn(
                    child: Container(
                      child: Center(
                        child: lottieLoading,
                      ),
                    ),
                  )
                : ContentAdd(),
          );
        });
  }
}

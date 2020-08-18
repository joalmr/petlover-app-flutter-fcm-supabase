import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:proypet/src2/app/styles/styles.dart';
import 'package:proypet/src2/app/views/components/appbar_menu.dart';
import 'package:proypet/src2/app/views/components/form_control/button_primary.dart';
import 'package:proypet/src2/app/views/components/form_control/ddl_control.dart';
import 'package:proypet/src2/app/views/components/form_control/text_from.dart';
import 'package:proypet/src2/app/views/components/transition/fadeViewSafeArea.dart';
import 'package:proypet/src2/controllers/mascota_controller/agregar_mascota_controller.dart';

import '../data/tipo_pet.dart';

class MascotaAgregarPage extends StatelessWidget {
  const MascotaAgregarPage({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetX<MascotaAgregarController>(
        init: MascotaAgregarController(),
        builder: (_) {
          return Scaffold(
            appBar: appbar(null, 'Agregar mascota', null),
            body: _.loading.value
                ? FadeIn(
                    child: Container(
                      child: Center(
                        child: CircularProgressIndicator(),
                      ),
                    ),
                  )
                : FadeViewSafeArea(
                    child: SingleChildScrollView(
                      child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 20),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            SizedBox(height: 25.0),
                            Padding(
                              padding: const EdgeInsets.symmetric(vertical: 5.0),
                              child: Center(
                                child: Stack(
                                  children: <Widget>[
                                    CircleAvatar(backgroundImage: _.mostrarFoto(), radius: 80.0),
                                    Positioned(
                                        bottom: 1.5,
                                        right: 10.0,
                                        child: CircleAvatar(
                                          child: IconButton(
                                            icon: Icon(Icons.camera_enhance, color: Colors.white),
                                            onPressed: () => showDialog(
                                                context: context,
                                                builder: (BuildContext context) {
                                                  return FadeIn(
                                                    child: SimpleDialog(
                                                      children: <Widget>[
                                                        SimpleDialogOption(child: const Text('Tomar foto'), onPressed: _.tomarFoto), //_tomarFoto
                                                        SimpleDialogOption(
                                                            child: const Text('Seleccionar foto'), onPressed: _.seleccionarFoto), //_seleccionarFoto
                                                      ],
                                                    ),
                                                  );
                                                }),
                                          ),
                                          backgroundColor: colorMain,
                                          radius: 22.0,
                                        ))
                                  ],
                                ),
                              ),
                            ),
                            FormularioText(
                              labelText: 'Nombre',
                              hintText: 'Nombre de mascota',
                              icon: Icons.pets,
                              obscureText: false,
                              onChanged: (value) => _.nombre = value,
                              textCap: TextCapitalization.words,
                              boardType: TextInputType.text,
                            ),
                            Padding(
                              padding: const EdgeInsets.only(top: 10, bottom: 10),
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.start,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: <Widget>[
                                  Text('Seleccione tipo de mascota'),
                                  SizedBox(height: 7.5),
                                  // ddlMain(context, _.especie.toString(), tipopet, (opt) {
                                  //   _.especie = int.parse(opt);
                                  //   _.obtenerRaza();
                                  // }),
                                  _.cargaRaza.value
                                      ? TextFormField(
                                          enableInteractiveSelection: false,
                                          decoration: InputDecoration(
                                            suffixIcon: Padding(
                                              padding: const EdgeInsets.only(right: 20),
                                              child: Icon(Icons.keyboard_arrow_down, color: colorMain),
                                            ),
                                          ))
                                      : ddlMain(context, _.especie.toString(), tipopet, (opt) {
                                          _.especie = int.parse(opt);
                                          _.obtenerRaza();
                                        }),
                                ],
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(top: 10, bottom: 10),
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.start,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: <Widget>[
                                  Text('Seleccione raza'),
                                  SizedBox(height: 7.5),
                                  TextFormField(
                                    controller: _.razaTextC,
                                    enableInteractiveSelection: false,
                                    decoration: InputDecoration(
                                      suffixIcon: Padding(
                                        padding: const EdgeInsets.only(right: 20),
                                        child: Icon(Icons.keyboard_arrow_down, color: colorMain),
                                      ),
                                    ),
                                    onTap: () => _.razasPet(context),
                                  ),
                                ],
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(top: 10, bottom: 10),
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.start,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: <Widget>[
                                  Text('Fecha de nacimiento'),
                                  SizedBox(height: 7.5),
                                  _.crearFecha(context),
                                ],
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(top: 10, bottom: 10),
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.start,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: <Widget>[Text('Sexo'), SizedBox(height: 7.5), _.sexoEdit(context)],
                              ),
                            ),
                            SizedBox(height: 25.0),
                            buttonPri(
                              'Agregar mascota',
                              _.cargaRaza.value ? null : _.btnCarga.value ? null : _.mascotaAdd,
                            ), //_onEdit
                            SizedBox(height: 10.0),
                          ],
                        ),
                      ),
                    ),
                  ),
          );
        });
  }
}

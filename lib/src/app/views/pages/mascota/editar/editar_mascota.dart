import 'package:animate_do/animate_do.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:proypet/src/app/styles/lottie.dart';
import 'package:proypet/src/app/styles/styles.dart';
import 'package:proypet/src/app/components/appbar_menu.dart';
import 'package:proypet/src/app/components/form_control/button_primary.dart';
import 'package:proypet/src/app/components/form_control/ddl_control.dart';
import 'package:proypet/src/app/components/form_control/text_from.dart';
import 'package:proypet/src/app/components/transition/fadeViewSafeArea.dart';
import 'package:proypet/src/controllers/mascota_controller/editar_mascota_controller.dart';
import '../data/tipo_pet.dart';

class MascotaEditarPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GetX<MascotaEditarController>(
      init: MascotaEditarController(),
      builder: (_) => Scaffold(
        appBar: appbar(null, 'Editar mascota', null),
        body: _.loading.value
            ? FadeIn(
                child: Container(
                  child: Center(
                    child: lottieLoading,
                  ),
                ),
              )
            : FadeViewSafeArea(
                child: SingleChildScrollView(
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 10),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        SizedBox(height: 25.0),
                        Padding(
                          padding: const EdgeInsets.symmetric(vertical: 5.0),
                          child: Center(
                            child: Stack(
                              children: <Widget>[
                                CircleAvatar(
                                    backgroundImage: _.mostrarFoto(),
                                    radius: 80.0),
                                Positioned(
                                    bottom: 1.5,
                                    right: 10.0,
                                    child: CircleAvatar(
                                      child: IconButton(
                                        icon: Icon(Icons.camera_enhance,
                                            color: Colors.white),
                                        onPressed: () => showDialog(
                                            context: context,
                                            builder: (BuildContext context) {
                                              return FadeIn(
                                                child: SimpleDialog(
                                                  children: <Widget>[
                                                    SimpleDialogOption(
                                                        child: const Text(
                                                            'Tomar foto'),
                                                        onPressed: _.tomarFoto),
                                                    SimpleDialogOption(
                                                        child: const Text(
                                                            'Seleccionar foto'),
                                                        onPressed:
                                                            _.seleccionarFoto),
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
                          valorInicial: _.petC.pet.name,
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
                              ddlMainOut(
                                  context,
                                  _.petC.pet.specieId.toString(),
                                  tipopet,
                                  null,
                                  _.petC.pet.specieName),
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
                                    child: Icon(Icons.keyboard_arrow_down,
                                        color: colorMain),
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
                            children: <Widget>[
                              Text('Sexo'),
                              SizedBox(height: 7.5),
                              _.sexoEdit(context)
                            ],
                          ),
                        ),
                        SizedBox(height: 25.0),
                        buttonPri('Guardar cambios',
                            _.btnCarga.value ? null : _.mascotaEdit),
                        SizedBox(height: 10.0),
                      ],
                    ),
                  ),
                ),
              ),
      ),
    );
  }
}

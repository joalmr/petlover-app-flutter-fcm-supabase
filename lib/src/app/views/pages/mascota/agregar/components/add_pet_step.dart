import 'dart:async';

import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:flutter_conditional_rendering/conditional_switch.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:proypet/config/path_variables.dart';
import 'package:proypet/src/app/styles/styles.dart';
import 'package:proypet/src/app/views/components/form_control/button_primary.dart';
import 'package:proypet/src/app/views/components/form_control/text_from.dart';
import 'package:proypet/src/app/views/components/snackbar.dart';
import 'package:proypet/src/app/views/pages/mascota/detalle/components/tab_general/card_style.dart';
import 'package:proypet/src/controllers/mascota_controller/agregar_mascota_controller.dart';

class ContentAdd extends StatelessWidget {
  //TODO: buscar mejorar el step creado
  @override
  Widget build(BuildContext context) {
    return GetX<MascotaAgregarController>(
      builder: (_) => ConditionalSwitch.single<String>(
        context: context,
        valueBuilder: (BuildContext context) => _.page.toString(),
        caseBuilders: {
          '1': (BuildContext context) => FadeIn(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Expanded(
                      child: ListView(
                        padding: EdgeInsets.symmetric(horizontal: 10),
                        children: [
                          SizedBox(height: 30),
                          Text(
                            '¿Qué tipo de mascota deseas agregar?',
                            style: GoogleFonts.lato(
                              color: colorMain,
                              fontSize: 28,
                              fontWeight: FontWeight.w300,
                            ),
                          ),
                          SizedBox(height: 60),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                              InkWell(
                                borderRadius: borderRadius,
                                onTap: () {
                                  _.especie = 2;
                                  _.obtenerRaza();
                                  if (_.cargaRaza.value)
                                    Timer(
                                      Duration(milliseconds: 500),
                                      () => _.page = _.page + 1,
                                    );
                                },
                                child: Container(
                                  width: (Get.width / 2) - 20,
                                  child: AspectRatio(
                                    aspectRatio: 4 / 3,
                                    child: Container(
                                      child: Stack(
                                        children: [
                                          ClipRRect(
                                            borderRadius:
                                                BorderRadius.circular(10),
                                            child: Image(
                                              image: AssetImage(
                                                  "images/blue-dog.png"),
                                              fit: BoxFit.cover,
                                            ),
                                          ),
                                          Positioned(
                                            top: 10,
                                            left: 5,
                                            child: Text(
                                              'Perro',
                                              style: TextStyle(
                                                fontSize: 16,
                                                fontWeight: FontWeight.w900,
                                                color: Colors.white,
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                              InkWell(
                                borderRadius: borderRadius,
                                onTap: () {
                                  _.especie = 1;
                                  _.obtenerRaza();
                                  if (_.cargaRaza.value)
                                    Timer(
                                      Duration(milliseconds: 500),
                                      () => _.page = _.page + 1,
                                    );
                                },
                                child: Container(
                                  width: (Get.width / 2) - 20,
                                  child: AspectRatio(
                                    aspectRatio: 4 / 3,
                                    child: Container(
                                      child: Stack(
                                        children: [
                                          ClipRRect(
                                            borderRadius:
                                                BorderRadius.circular(10),
                                            child: Image(
                                              image: AssetImage(
                                                  "images/green-cat.png"),
                                              fit: BoxFit.cover,
                                            ),
                                          ),
                                          Positioned(
                                            top: 10,
                                            left: 5,
                                            child: Text(
                                              'Gato',
                                              style: TextStyle(
                                                fontSize: 16,
                                                fontWeight: FontWeight.w900,
                                                color: Colors.white,
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.only(bottom: 10),
                      child: buttonFlat(
                        'Salir',
                        () => Get.back(),
                        Get.iconColor,
                      ),
                    ),
                  ],
                ),
              ),
          '2': (BuildContext context) => FadeIn(
                child: Column(
                  children: [
                    Expanded(
                      child: ListView(
                        padding: EdgeInsets.symmetric(horizontal: 10),
                        children: [
                          SizedBox(height: 20),
                          Center(
                            child: Stack(
                              children: <Widget>[
                                CircleAvatar(
                                    backgroundImage: _.mostrarFoto(),
                                    radius: 80.0),
                                Positioned(
                                  bottom: 1.5,
                                  right: 7.5,
                                  child: CircleAvatar(
                                    backgroundColor: colorMain,
                                    // radius: 16.0,
                                    child: IconButton(
                                      icon: Icon(
                                        Icons.camera_enhance,
                                        color: Colors.white,
                                        // size: 18,
                                      ),
                                      onPressed: () => showDialog(
                                          context: Get.context,
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
                                  ),
                                ),
                              ],
                            ),
                          ),
                          SizedBox(height: 20),
                          FormularioText(
                            // labelText: 'Nombre',
                            hintText: 'Nombre de mascota',
                            valorInicial: _.nombre ?? '',
                            icon: Icons.pets,
                            obscureText: false,
                            onChanged: (value) => _.nombre = value,
                            autofocus: false,
                            textCap: TextCapitalization.words,
                            boardType: TextInputType.text,
                          ),
                          // SizedBox(height: 10),
                          Text(
                            'Seleccione raza',
                            style: GoogleFonts.lato(
                              color: colorMain,
                              fontSize: 20,
                              fontWeight: FontWeight.w300,
                            ),
                          ),
                          SizedBox(height: 7.5),
                          TextFormField(
                            controller: _.razaTextC,
                            enableInteractiveSelection: false,
                            autofocus: false,
                            readOnly: true,
                            decoration: InputDecoration(
                              suffixIcon: Padding(
                                padding: const EdgeInsets.only(right: 20),
                                child: Icon(Icons.keyboard_arrow_down,
                                    color: colorMain),
                              ),
                            ),
                            onTap: () => _.razasPet(Get.context),
                          ),
                          SizedBox(height: 10),
                          Text(
                            'Fecha de nacimiento',
                            style: GoogleFonts.lato(
                              color: colorMain,
                              fontSize: 20,
                              fontWeight: FontWeight.w300,
                            ),
                          ),
                          SizedBox(height: 7.5),
                          _.crearFecha(Get.context),
                          SizedBox(height: 10),
                          Text(
                            'Sexo',
                            style: GoogleFonts.lato(
                              color: colorMain,
                              fontSize: 20,
                              fontWeight: FontWeight.w300,
                            ),
                          ),
                          SizedBox(height: 7.5),
                          _.sexoEdit(Get.context),
                        ],
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.only(bottom: 10),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          buttonFlat('Atras', () {
                            _.page = _.page - 1;
                          }, colorMain),
                          buttonFlat('Siguiente', () {
                            if (_.sinNombreMascota || _.sinFechaMascota) {
                              if (_.sinNombreMascota)
                                mostrarSnackbar(
                                    'Ingrese nombre de la mascota.', colorRed);
                              if (_.sinFechaMascota)
                                mostrarSnackbar(
                                    'Ingrese nacimiento de la mascota.',
                                    colorRed);
                            } else
                              _.page = _.page + 1;
                          }, colorMain),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
          '3': (BuildContext context) => FadeIn(
                child: Column(
                  children: [
                    SizedBox(height: Get.height * 0.1),
                    CircleAvatar(
                        backgroundImage: _.mostrarFoto(), radius: 80.0),
                    SizedBox(height: 10),
                    Text(
                      _.nombre,
                      style: GoogleFonts.lato(
                        color: colorMain,
                        fontSize: 28,
                        fontWeight: FontWeight.w300,
                      ),
                    ),
                    Text(
                      _.getRaza(_.razaId),
                      style: TextStyle(
                        fontSize: 12,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(height: 5),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(
                          Icons.cake,
                          size: 16,
                        ),
                        SizedBox(width: 5),
                        Text(_.fecha),
                      ],
                    ),
                    SizedBox(height: 10),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        cardSt(
                          height: 80.0,
                          width: 60.0,
                          content: _.sexo == 1
                              ? Icon(
                                  FontAwesomeIcons.mars,
                                  color: Colors.lightBlue,
                                )
                              : Icon(
                                  FontAwesomeIcons.venus,
                                  color: Colors.pink,
                                ),
                          text: 'sexo',
                        ),
                        cardSt(
                          height: 80.0,
                          width: 70.0,
                          content: _.especie == 1
                              ? ClipRRect(
                                  borderRadius: BorderRadius.circular(2.5),
                                  child: Image(
                                    image: AssetImage(pathGif('gato-kb')),
                                    fit: BoxFit.cover,
                                  ),
                                )
                              : ClipRRect(
                                  borderRadius: BorderRadius.circular(2.5),
                                  child: Image(
                                    image: AssetImage(pathGif('perro-kb')),
                                    fit: BoxFit.cover,
                                  ),
                                ),
                          text: _.especie == 1 ? 'gato' : 'perro',
                        ),
                      ],
                    ),
                    SizedBox(height: 30),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 20),
                      child: buttonPri(
                        'Finalizar',
                        _.btnCarga.value ? null : _.mascotaAdd,
                        cargando: _.btnCarga.value,
                      ),
                    ),
                    Expanded(child: Text('')),
                    Padding(
                      padding: EdgeInsets.only(bottom: 10),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          buttonFlat('Atras', () {
                            _.page = _.page - 1;
                          }, colorMain),
                        ],
                      ),
                    ),
                  ],
                ),
              )
        },
        fallbackBuilder: (BuildContext context) => Container(),
      ),
    );
  }
}

import 'dart:io';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:proypet/components/form_control/btn_others.dart';
import 'package:proypet/config/variables_globales.dart';
import 'package:proypet/design/styles/styles.dart';
import 'package:url_launcher/url_launcher.dart';

Widget updateView() {
  return Column(
    crossAxisAlignment: CrossAxisAlignment.center,
    mainAxisAlignment: MainAxisAlignment.center,
    children: [
      Image(
        image: AssetImage('images/actualiza.png'),
        fit: BoxFit.cover,
        height: 220,
      ),
      SizedBox(height: 20),
      Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10),
        child: Text.rich(
          TextSpan(
            style: TextStyle(),
            text: 'Necesitas actualizar la aplicación, ',
            children: <TextSpan>[
              TextSpan(
                text: 'tenemos una versión pendiente ',
              ),
              TextSpan(
                text: Platform.isIOS ? '$versionIOS' : '$versionAndroid',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  color: colorMain,
                ),
              ),
            ],
          ),
        ),
      ),
      SizedBox(height: 10),
      btnWIcon(
        icono: Platform.isIOS
            ? FontAwesomeIcons.appStore
            : FontAwesomeIcons.googlePlay,
        color: colorMain,
        texto: 'Actualizar aplicación',
        funtion: () => Platform.isIOS
            ? launch('https://apps.apple.com/pe/app/proypet/id1529231253')
            : launch(
                'https://play.google.com/store/apps/details?id=com.proypet.user'),
      ),
    ],
  );
}

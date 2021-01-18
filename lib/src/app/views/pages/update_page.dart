import 'dart:io';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:proypet/config/global_variables.dart';
import 'package:proypet/src/app/styles/styles.dart';
import 'package:proypet/src/app/views/components/form_control/button_primary.dart';
import 'package:proypet/src/app/views/components/transition/fadeViewSafeArea.dart';
import 'package:url_launcher/url_launcher.dart';

class UpdatePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: FadeViewSafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 20),
          child: Column(
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
                        text:
                            Platform.isIOS ? '$versionIOS' : '$versionAndroid',
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
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: btnWIcon(
                  icono: Platform.isIOS
                      ? FontAwesomeIcons.appStore
                      : FontAwesomeIcons.googlePlay,
                  color: colorMain,
                  texto: 'Actualizar aplicación',
                  funtion: () => Platform.isIOS
                      ? launch(
                          'https://apps.apple.com/pe/app/proypet/id1529231253')
                      : launch(
                          'https://play.google.com/store/apps/details?id=com.proypet.user'),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

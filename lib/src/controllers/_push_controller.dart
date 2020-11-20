import 'package:animate_do/animate_do.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:proypet/src/app/views/pages/_nav_view/notificaciones/push/buildPushNoti.dart';
import 'package:proypet/src/controllers/home_controller/home_controller.dart';
import 'package:proypet/src/data/services/auth_service.dart';
import 'package:proypet/src/utils/preferencias_usuario/preferencias_usuario.dart';

class PushController extends GetxController {
  AuthService loginApi = AuthService();
  final homeC = Get.find<HomeController>();

  final _prefs = new PreferenciasUsuario();

  Map<String, dynamic> mensaje;

  FirebaseMessaging _firebaseMessaging = FirebaseMessaging();

  void firebase() {
    firebasePermiso();
    firebaseToken();
  }

  void firebasePermiso() {
    _firebaseMessaging.requestNotificationPermissions();
  }

  void firebaseToken() {
    _firebaseMessaging.getToken().then((token) {
      print('==token==');
      print(token);
      loginApi.sendTokenFire(token);
    });
  }

  void firebaseConfigure() {
    _firebaseMessaging.configure(
      onMessage: (Map<String, dynamic> message) async {
        mensaje = message;
        _prefs.notificaAviso = true;
        push();
      },
      onLaunch: (Map<String, dynamic> message) async {
        mensaje = message;
        _prefs.notificaAviso = true;
        push();
      },
      onResume: (Map<String, dynamic> message) async {
        mensaje = message;
        _prefs.notificaAviso = true;
        push();
      },
    );
  }

  void push() {
    if (mensaje != null) {
      pushVoid();
    }
  }

  Future<void> pushVoid() async {
    var mensajePush = mensaje['data']['message'];
    var tipoPush = mensaje['data']['type'];
    var dataPush = mensaje['data'];

    if (tipoPush == "AttentionFinished") {
      print(dataPush);
      homeC.getSummary();
      Get.toNamed('calificaatencion', arguments: dataPush);
      // Get.dialog(FadeIn(
      //   child: SimpleDialog(
      //     children: <Widget>[
      //       BuildPushQualify(noti: dataPush, mensaje: mensajePush),
      //     ],
      //   ),
      // ));
    } else {
      Get.dialog(FadeIn(
          child: SimpleDialog(
        contentPadding: EdgeInsets.symmetric(vertical: 0, horizontal: 0),
        children: <Widget>[
          BuildPushNoti(noti: dataPush, mensaje: mensajePush),
        ],
      )));
    }
  }
}

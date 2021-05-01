import 'package:animate_do/animate_do.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:proypet/source/home/controller/home_controller.dart';
import 'package:proypet/source/auth/service/auth_service.dart';
import 'package:proypet/source/notificaciones/view/push/buildPushNoti.dart';
import 'package:proypet/utils/preferencias_usuario/preferencias_usuario.dart';

class PushController extends GetxController {
  AuthService loginApi = AuthService();
  final homeC = Get.find<HomeController>();
  final _prefs = new PreferenciasUsuario();

  Map<String, dynamic> mensaje;

  // FirebaseMessaging _firebaseMessaging = FirebaseMessaging();
  FirebaseMessaging _firebaseMessaging = FirebaseMessaging.instance;

  void firebase() {
    firebasePermiso();
    firebaseToken();
  }

  Future<void> firebasePermiso() async {
    // _firebaseMessaging.requestNotificationPermissions();
    // NotificationSettings settings =

    await _firebaseMessaging.requestPermission(
      alert: true,
      announcement: false,
      badge: true,
      carPlay: false,
      criticalAlert: false,
      provisional: false,
      sound: true,
    );
  }

  void firebaseToken() {
    _firebaseMessaging.getToken().then((token) {
      loginApi.sendTokenFire(token);
    });
  }

  void firebaseConfigure() {
    _firebaseMessaging.configure(
      onMessage: (Map<String, dynamic> message) async {
        mensaje = message;
        _prefs.notificaAviso = true;
        _push();
      },
      onLaunch: (Map<String, dynamic> message) async {
        mensaje = message;
        _prefs.notificaAviso = true;
        _push();
      },
      onResume: (Map<String, dynamic> message) async {
        mensaje = message;
        _prefs.notificaAviso = true;
        _push();
      },
    );
  }

  void _push() {
    if (mensaje != null) {
      _pushVoid();
    }
  }

  Future<void> _pushVoid() async {
    var mensajePush = mensaje['data']['message'];
    var tipoPush = mensaje['data']['type'];
    var dataPush = mensaje['data'];

    if (tipoPush == "AttentionFinished") {
      homeC.getSummary();
      Get.toNamed('calificaatencion', arguments: dataPush);
    } else {
      Get.dialog(
        FadeIn(
          child: SimpleDialog(
            contentPadding: EdgeInsets.symmetric(vertical: 0, horizontal: 0),
            children: <Widget>[
              BuildPushNoti(noti: dataPush, mensaje: mensajePush),
            ],
          ),
        ),
      );
    }
  }
}

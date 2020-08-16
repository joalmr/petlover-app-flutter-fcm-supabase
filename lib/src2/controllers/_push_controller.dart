import 'package:animate_do/animate_do.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:proypet/src/views/pages/viewNotificaciones/push/buildPushNoti.dart';
import 'package:proypet/src/views/pages/viewNotificaciones/push/buildPushQualify.dart';
import 'package:proypet/src2/data/services/auth_service.dart';

class PushController extends GetxController {
  AuthService loginApi = AuthService();

  // RxBool _notificacionPush = false.obs;
  // bool _notificacionPush = false;
  // set notificacionPush(bool value) => _notificacionPush = value;
  // bool get notificacionPush => _notificacionPush;
  // bool get hasPush => mensaje.keys.contains('data');

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
        push();
      },
      onLaunch: (Map<String, dynamic> message) async {
        mensaje = message;
        push();
      },
      onResume: (Map<String, dynamic> message) async {
        mensaje = message;
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
    if (mensaje['data']['type'] == "AttentionFinished") {
      Get.dialog(FadeIn(
        child: SimpleDialog(
          children: <Widget>[
            BuildPushQualify(
              noti: mensaje['data'],
              mensaje: mensaje['notification']['body'],
            ),
          ],
        ),
      ));
    } else {
      Get.dialog(FadeIn(
          child: SimpleDialog(
        contentPadding: EdgeInsets.symmetric(vertical: 0, horizontal: 0),
        children: <Widget>[
          BuildPushNoti(
            noti: mensaje['data'],
            mensaje: mensaje['notification']['body'],
          ),
        ],
      )));
    }
  }
}

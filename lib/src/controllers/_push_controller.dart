import 'dart:io';

import 'package:animate_do/animate_do.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:proypet/src/app/views/pages/_nav_view/notificaciones/push/buildPushNoti.dart';
import 'package:proypet/src/app/views/pages/_nav_view/notificaciones/push/buildPushQualify.dart';
import 'package:proypet/src/controllers/home_controller/home_controller.dart';
import 'package:proypet/src/data/services/auth_service.dart';

class PushController extends GetxController {
  AuthService loginApi = AuthService();
  final homeC = Get.find<HomeController>();

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
        print(mensaje);
        push();
      },
      onLaunch: (Map<String, dynamic> message) async {
        mensaje = message;
        print(mensaje);
        push();
      },
      onResume: (Map<String, dynamic> message) async {
        mensaje = message;
        print(mensaje);
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
    // var tipoPush;
    // var dataPush;
    var mensajePush = mensaje['data']['message'];
    var tipoPush = mensaje['data']['type'];
    var dataPush = mensaje['data'];
    // if (Platform.isAndroid) {
    //   tipoPush = mensaje['data']['type'];
    //   dataPush = mensaje['data'];
    // }
    // else {
    //   tipoPush = mensaje['type'];
    //   dataPush = mensaje;
    // }
    //
    if (tipoPush == "AttentionFinished") {
      homeC.getSummary();
      Get.dialog(FadeIn(
        child: SimpleDialog(
          children: <Widget>[
            BuildPushQualify(noti: dataPush, mensaje: mensajePush),
          ],
        ),
      ));
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

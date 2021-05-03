import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:proypet/source/auth/data/service/auth_service.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:get/get.dart';
import 'package:proypet/source/home/domain/controller/home_controller.dart';
import 'package:proypet/source/notificaciones/view/push/buildPushNoti.dart';

class PushController extends GetxController {
  AuthService loginApi = AuthService();
  final homeC = Get.find<HomeController>();
  Map<String, dynamic> mensaje;

  FirebaseMessaging _firebaseMessaging = FirebaseMessaging.instance;

  @override
  void onInit() {
    super.onInit();
  }


  firebase() => _firebase();
  Future<void> _firebase() async {
    firebasePermiso();
    firebaseToken();
  }

  firebasePermiso() async {
    await _firebaseMessaging.requestPermission();
  }

  void firebaseToken() {
    _firebaseMessaging.getToken().then((token) {
      print("==firebase token==");
      loginApi.sendTokenFire(token);
    });
  }

  void firebaseConfigure() {
    FirebaseMessaging.instance.getInitialMessage().then((RemoteMessage message) {
      print('getInitialMessage');
      if (message != null) {
        print(message.data);
        mensaje = message.data;
        _push();
      }
    });

    FirebaseMessaging.onMessage.listen((RemoteMessage message) {
      print('onMessage');
      if (message != null) {
        print(message.data);
        mensaje = message.data;
        _push();
      }
    });

    FirebaseMessaging.onMessageOpenedApp.listen((RemoteMessage message) {
      print('onMessageOpenedApp');
      if (message != null) {
        print(message.data);
        mensaje = message.data;
        _push();
      }
    });
  }

  void _push() {
    if (mensaje != null){
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

// RemoteNotification notification = message.notification;
// AndroidNotification android = message.notification?.android;
// if (notification != null && android != null) {
//   flutterLocalNotificationsPlugin.show(
//     notification.hashCode,
//     notification.title,
//     notification.body,
//     NotificationDetails(
//       android: AndroidNotificationDetails(
//         channel.id,
//         channel.name,
//         channel.description,
//         icon: 'launch_background',
//       ),
//     ),
//   );
// }
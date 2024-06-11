// import 'dart:convert';
// import 'package:animate_do/animate_do.dart';
// import 'package:flutter/material.dart';
import 'package:proypet/source/auth/data/service/auth_service.dart';
// import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:get/get.dart';
import 'package:proypet/source/home/domain/controller/home_controller.dart';
// import 'package:proypet/source/notificaciones/view/push/buildPushNoti.dart';

class PushController extends GetxController {
  AuthService loginApi = AuthService();
  final homeC = Get.find<HomeController>();

  // FirebaseMessaging _firebaseMessaging = FirebaseMessaging.instance;

  @override
  void onInit() {
    super.onInit();
  }

  // firebase() => _firebase();
  // Future<void> _firebase() async {
  //   firebasePermiso();
  //   firebaseToken();
  // }

  // firebasePermiso() async {
  //   await _firebaseMessaging.requestPermission();
  // }

  // void firebaseToken() {
  //   _firebaseMessaging.getToken().then((token) {
  //     print("==firebase token==");
  //     loginApi.sendTokenFire(token);
  //   });
  // }

  // void firebaseConfigure() {
  //   FirebaseMessaging.instance
  //       .getInitialMessage()
  //       .then((RemoteMessage message) {
  //     if (message != null) {
  //       _push(jsonEncode(message.data));
  //     }
  //   });

  //   FirebaseMessaging.onMessage.listen((RemoteMessage message) {
  //     if (message != null) {
  //       _push(jsonEncode(message.data));
  //     }
  //   });

  //   FirebaseMessaging.onMessageOpenedApp.listen((RemoteMessage message) {
  //     if (message != null) {
  //       _push(jsonEncode(message.data));
  //     }
  //   });
  // }

  // void _push(mensaje) {
  //   if (mensaje != null) {
  //     _pushVoid(mensaje);
  //   }
  // }

  // Future<void> _pushVoid(mensaje) async {
  //   var dataPush = jsonDecode(mensaje);
  //   var mensajePush = dataPush['message'];
  //   var tipoPush = dataPush['type'];

  //   if (tipoPush == "AttentionFinished") {
  //     homeC.getSummary();
  //     Get.toNamed('calificaatencion', arguments: dataPush);
  //   } else {
  //     Get.dialog(
  //       FadeIn(
  //         child: SimpleDialog(
  //           contentPadding: EdgeInsets.symmetric(vertical: 0, horizontal: 0),
  //           children: <Widget>[
  //             BuildPushNoti(noti: dataPush, mensaje: mensajePush),
  //           ],
  //         ),
  //       ),
  //     );
  //   }
  // }
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

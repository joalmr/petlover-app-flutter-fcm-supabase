import 'package:proypet/source/auth/data/service/auth_service.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:animate_do/animate_do.dart';
import 'package:proypet/source/home/domain/controller/home_controller.dart';
import 'package:proypet/source/notificaciones/view/push/buildPushNoti.dart';
import 'package:proypet/utils/preferencias_usuario/preferencias_usuario.dart';

class PushController extends GetxController {
  AuthService loginApi = AuthService();
  final homeC = Get.find<HomeController>();
  // final _prefs = new PreferenciasUsuario();

  Map<String, dynamic> mensaje;

  // // FirebaseMessaging _firebaseMessaging = FirebaseMessaging();
  FirebaseMessaging _firebaseMessaging = FirebaseMessaging.instance;

  Future<void> _firebaseMessagingBackgroundHandler(
      RemoteMessage message) async {
    await Firebase.initializeApp();
    print(message.notification.title);

    flutterLocalNotificationsPlugin.show(
      message.notification.hashCode,
      message.notification.title,
      message.notification.body,
      NotificationDetails(
        android: AndroidNotificationDetails(
          channel.id,
          channel.name,
          channel.description,
          icon: message.notification.android?.smallIcon,
        ),
      ),
    );
  }

  AndroidNotificationChannel channel = AndroidNotificationChannel(
    'high_importance_channel', // id
    'High Importance Notifications', // title
    'This channel is used for important notifications.', // description
    importance: Importance.high,
  );

  final FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin =
      FlutterLocalNotificationsPlugin();

  firebase() => _firebase();
  Future<void> _firebase() async {
    firebasePermiso();
    firebaseToken();

    await flutterLocalNotificationsPlugin
        .resolvePlatformSpecificImplementation<
            AndroidFlutterLocalNotificationsPlugin>()
        ?.createNotificationChannel(channel);
  }

  firebaseSet() => _firebaseSet();
  _firebaseSet() {
    var initializationSettingsAndroid =
        AndroidInitializationSettings('@mipmap/ic_launcher');
    var initializationSettings = InitializationSettings(
      android: initializationSettingsAndroid,
    );

    flutterLocalNotificationsPlugin.initialize(initializationSettings);
  }

  firebasePermiso() => _firebasePermiso();
  Future<void> _firebasePermiso() async {
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
      print("==firebase token==");
      print(token);
      loginApi.sendTokenFire(token);
    });
  }

  void firebaseConfigure() {
    FirebaseMessaging.onBackgroundMessage(_firebaseMessagingBackgroundHandler);

    FirebaseMessaging.onMessage.listen(
      (RemoteMessage message) {
        RemoteNotification notification = message.notification;
        AndroidNotification android = message.notification?.android;
        if (notification != null && android != null) {
          flutterLocalNotificationsPlugin.show(
            notification.hashCode,
            notification.title,
            notification.body,
            NotificationDetails(
              android: AndroidNotificationDetails(
                channel.id,
                channel.name,
                channel.description,
                icon: android?.smallIcon,
              ),
            ),
          );
        }
      },
    );
  }

  // void firebaseConfigure() {
  //   _firebaseMessaging.configure(
  //     onMessage: (Map<String, dynamic> message) async {
  //       mensaje = message;
  //       _prefs.notificaAviso = true;
  //       _push();
  //     },
  //     onLaunch: (Map<String, dynamic> message) async {
  //       mensaje = message;
  //       _prefs.notificaAviso = true;
  //       _push();
  //     },
  //     onResume: (Map<String, dynamic> message) async {
  //       mensaje = message;
  //       _prefs.notificaAviso = true;
  //       _push();
  //     },
  //   );
  // }

  // void _push() {
  //   if (mensaje != null) {
  //     _pushVoid();
  //   }
  // }

  // Future<void> _pushVoid() async {
  //   var mensajePush = mensaje['data']['message'];
  //   var tipoPush = mensaje['data']['type'];
  //   var dataPush = mensaje['data'];

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

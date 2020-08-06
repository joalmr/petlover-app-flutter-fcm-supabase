import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:mobx/mobx.dart';
import 'package:proypet/src/providers/user_provider.dart';
import 'package:proypet/src/views/pages/viewNotificaciones/push/buildPushNoti.dart';
import 'package:proypet/src/views/pages/viewNotificaciones/push/buildPushQualify.dart';

part 'push_store.g.dart';

class PushStore = _PushStore with _$PushStore;

abstract class _PushStore with Store {
  @observable
  bool notificacionPush = false;

  @observable
  Map<String, dynamic> mensaje;

  FirebaseMessaging _firebaseMessaging = FirebaseMessaging();

  @action
  void firebase() {
    firebasePermiso();
    firebaseToken();
    firebaseConfigure();
  }

  @action
  void firebasePermiso() {
    _firebaseMessaging.requestNotificationPermissions();
  }

  final loginProvider = UserProvider();

  @action
  void firebaseToken() {
    _firebaseMessaging
        .getToken()
        .then((token) => loginProvider.sendTokenFire(token));
  }

  @action
  void firebaseConfigure() {
    _firebaseMessaging.configure(
      onMessage: (Map<String, dynamic> message) async {
        notificacionPush = true;
        mensaje = message;
        // espera();
      },
      onLaunch: (Map<String, dynamic> message) async {
        notificacionPush = true;
        mensaje = message;
        // espera();
      },
      onResume: (Map<String, dynamic> message) async {
        notificacionPush = true;
        mensaje = message;
        // espera();
      },
    );
  }

  @action
  Future<Null> espera() async {
    await Future.delayed(Duration(milliseconds: 900));
    notificacionPush = false;
  }

  @action
  void push(BuildContext context) {
    if (mensaje != null) {
      pushVoid(context);
    }
  }

  @action
  Future<void> pushVoid(BuildContext context) async {
    if (mensaje['data']['type'] == "AttentionFinished") {
      showDialog(
        context: context,
        builder: (context) => SimpleDialog(
          children: <Widget>[
            BuildPushQualify(
              noti: mensaje['data'],
              mensaje: mensaje['notification']['body'],
            ),
          ],
        ),
      );
    } else {
      showDialog(
        context: context,
        builder: (context) => SimpleDialog(
          contentPadding: EdgeInsets.symmetric(vertical: 0, horizontal: 0),
          children: <Widget>[
            BuildPushNoti(
              noti: mensaje['data'],
              mensaje: mensaje['notification']['body'],
            ),
          ],
        ),
      );
    }
  }
}

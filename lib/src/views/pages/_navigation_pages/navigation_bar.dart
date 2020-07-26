import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:proypet/src/providers/user_provider.dart';
import 'package:proypet/src/utils/preferencias_usuario/preferencias_usuario.dart';
import 'package:proypet/src/styles/styles.dart';
import 'package:proypet/src/views/pages/viewDestacados/destacados_page.dart';
import 'package:proypet/src/views/pages/viewHome/home_page.dart';
import 'package:proypet/src/views/pages/viewNotificaciones/push/buildPushNoti.dart';
import 'package:proypet/src/views/pages/viewNotificaciones/push/buildPushQualify.dart';
import 'package:proypet/src/views/pages/viewNotificaciones/notificaciones_page.dart';
import 'package:proypet/src/views/pages/viewRecompensas/recompensas_page.dart';
import 'package:proypet/src/views/pages/viewVeterinarias/reserva_list.dart';

FirebaseMessaging _firebaseMessaging = FirebaseMessaging(); //TODO: firebase

class NavigationBar extends StatefulWidget {
  final int currentTabIndex;

  // final int marcar;
  NavigationBar({
    @required this.currentTabIndex,
  }); //this.marcar

  @override
  _NavigationBarState createState() =>
      _NavigationBarState(currentTabIndex: currentTabIndex); //, marcar: marcar
}

class _NavigationBarState extends State<NavigationBar> {
  int currentTabIndex;
  _NavigationBarState({@required this.currentTabIndex});

  final loginProvider = UserProvider();
  final _prefs = new PreferenciasUsuario();

  //TODO: firebase
  @override
  void initState() {
    super.initState();
    // fnPosition().then((value) {
    //   _prefs.position = '${value.latitude},${value.longitude}';
    // });
    //ejecuta firebase
    _fnFireBaseEjec();
  }

  @override
  Widget build(BuildContext context) {
    final _kTabPages = <Widget>[
      HomePage(),
      NotificacionesPage(),
      ReservaList(),
      DestacadosPage(),
      RecompensasPage(),
    ];

    final _kBottmonNavBarItems = <BottomNavigationBarItem>[
      BottomNavigationBarItem(
        icon: Icon(Icons.pets),
        title: Text('Inicio', style: TextStyle(fontSize: 10.5)), //
      ),
      BottomNavigationBarItem(
        icon: Icon(
          Icons.notifications_active,
        ),
        title: Text('Notificaciones', style: TextStyle(fontSize: 10.5)), //
      ),
      BottomNavigationBarItem(
        icon: Icon(Icons.search), //Proypet.proypet
        title: Text('Veterinarias', style: TextStyle(fontSize: 10.5)), //
      ),
      BottomNavigationBarItem(
        icon: Icon(Icons.favorite),
        title: Text('Destacados', style: TextStyle(fontSize: 10.5)), //
      ),
      BottomNavigationBarItem(
        icon: Icon(
          Icons.monetization_on,
        ),
        title: Text('Puntos', style: TextStyle(fontSize: 10.5)), //
      ),
    ];

    final bottomNavBar = BottomNavigationBar(
      iconSize: 28.0,
      selectedItemColor: colorMain,
      unselectedItemColor: Color.fromRGBO(116, 117, 152, 1.0),
      items: _kBottmonNavBarItems,
      currentIndex: currentTabIndex,
      type: BottomNavigationBarType.fixed,
      backgroundColor: Theme.of(context).backgroundColor,
      onTap: (int index) {
        setState(() {
          currentTabIndex = index;
        });
      },
    );

    return Scaffold(
      body: _kTabPages[currentTabIndex],
      bottomNavigationBar: bottomNavBar,
    );
  }

  _fnFireBaseEjec() {
    _firebaseMessaging.requestNotificationPermissions();
    _firebaseMessaging.getToken().then((token) {
      print("======== token ========");
      // print(token);
      loginProvider.sendTokenFire(token);
    });

    _firebaseMessaging.configure(
        onMessage: (Map<String, dynamic> message) async {
      onPush(message);
      message = null;
    }, onLaunch: (Map<String, dynamic> message) async {
      if (message.isNotEmpty) onPush(message);
      message = null;
    }, onResume: (Map<String, dynamic> message) async {
      if (message.isNotEmpty) onPush(message);
      message = null;
    });
  }

  onPush(message) {
    print('== llega ==');
    //AttentionFinished = qualify
    if (message['data']['type'] == "AttentionFinished") {
      showDialog(
        context: context,
        builder: (context) => SimpleDialog(
          children: <Widget>[
            BuildPushQualify(
                noti: message['data'],
                mensaje: message['notification']['body']),
            // buildPushQualify(context, message['data']),
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
                noti: message['data'], mensaje: message['notification']['body'])
            // buildPushNoti(context, message['data']),
          ],
        ),
      );
    }
    // switch (message['data']['type']) {
    //   case "qualify":
    //     return;
    //     break;
    //   default:
    //     return;
    //     break;
    // }
  }
}

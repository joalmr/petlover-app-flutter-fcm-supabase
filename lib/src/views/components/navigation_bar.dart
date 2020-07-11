// import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:proypet/src/providers/user_provider.dart';
import 'package:proypet/src/utils/posicion.dart';
import 'package:proypet/src/utils/utils.dart';
import 'package:proypet/src/views/pages/navigation_pages/destacados_page.dart';
import 'package:proypet/src/views/pages/navigation_pages/home_page.dart';
import 'package:proypet/src/views/pages/navigation_pages/notificaciones_page.dart';
import 'package:proypet/src/views/pages/navigation_pages/recompensas_page.dart';
import 'package:proypet/src/views/pages/navigation_pages/reserva_list.dart';
import 'package:proypet/src/styles/styles.dart';
import 'package:proypet/src/views/pages/notificaciones/buildPushNoti.dart';
import 'package:proypet/src/views/pages/notificaciones/buildPushQualify.dart';

FirebaseMessaging _firebaseMessaging = FirebaseMessaging(); //TODO: firebase

// final scaffoldKey = GlobalKey<ScaffoldState>();

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

  //TODO: firebase
  @override
  void initState() {
    fnPosition().then((value) {
      _prefs.position = '${value.latitude},${value.longitude}';
      print(_prefs.position);
    });

    super.initState();
    _firebaseMessaging.requestNotificationPermissions();
    _firebaseMessaging.getToken().then((token) {
      //los tokens a agregar en la bd deben ser un arreglo de tokens
      print("======== token ========");
      print(token);
      loginProvider.sendTokenFire(token);
    });

    _firebaseMessaging.configure(
        onMessage: (Map<String, dynamic> message) async {
      onPush(message);
    }, onLaunch: (Map<String, dynamic> message) async {
      // print(message);
      // print('======== onLaunch ========');
      if (message.isNotEmpty) onPush(message);
      message = null; //TODO: verificar
    }, onResume: (Map<String, dynamic> message) async {
      // print(message);
      // print('======== onResume ========');
      if (message.isNotEmpty) onPush(message);
      message = null;
    });
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

    // final bottomNavBar = SnakeNavigationBar(
    //   style: SnakeBarStyle.floating,
    //   snakeShape: SnakeShape.indicator,
    //   snakeColor: colorMain,
    //   backgroundColor: Theme.of(context).backgroundColor,
    //   showUnselectedLabels: true,
    //   showSelectedLabels: true,
    //   selectedItemColor: colorMain,
    //   padding: EdgeInsets.zero,
    //   items: _kBottmonNavBarItems,
    //   currentIndex: currentTabIndex,
    //   onPositionChanged: (int index) {
    //     setState(() {
    //       currentTabIndex = index;
    //     });
    //   },
    // );

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
      // key: scaffoldKey,
      body: _kTabPages[currentTabIndex],
      bottomNavigationBar: bottomNavBar,
    );
  }

  onPush(message) {
    if (message['data']['type'] == "qualify") {
      showDialog(
        context: context,
        builder: (context) => SimpleDialog(
          contentPadding: EdgeInsets.symmetric(vertical: 10, horizontal: 10),
          children: <Widget>[
            BuildPushQualify(noti: message['data'])
            // buildPushQualify(context, message['data']),
          ],
        ),
      );
    } else {
      showDialog(
        context: context,
        builder: (context) => SimpleDialog(
          contentPadding: EdgeInsets.symmetric(vertical: 10, horizontal: 10),
          children: <Widget>[
            BuildPushNoti(noti: message['data'])
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

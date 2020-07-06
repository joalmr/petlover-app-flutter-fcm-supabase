// import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:proypet/src/views/pages/navigation_pages/destacados_page.dart';
import 'package:proypet/src/views/pages/navigation_pages/home_page.dart';
import 'package:proypet/src/views/pages/navigation_pages/notificaciones_page.dart';
import 'package:proypet/src/views/pages/navigation_pages/recompensas_page.dart';
import 'package:proypet/src/views/pages/navigation_pages/reserva_list.dart';
import 'package:proypet/src/styles/styles.dart';

// FirebaseMessaging _firebaseMessaging = FirebaseMessaging(); //TODO: firebase

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
  _NavigationBarState({
    @required this.currentTabIndex,
  }); //TODO: firebase
  // @override
  // void initState() {
  //   super.initState();

  //   _firebaseMessaging.requestNotificationPermissions();

  //   _firebaseMessaging.getToken().then((token) {
  //     //los tokens a agregar en la bd deben ser un arreglo de tokens
  //     print("======== token ========");
  //     print(token);
  //   });

  //   _firebaseMessaging.configure(

  //     onMessage: (Map<String, dynamic> message) async {
  //       showDialog(
  //         context: context,
  //         builder: (context) => SimpleDialog(
  //           contentPadding: EdgeInsets.symmetric(vertical: 10, horizontal: 10),
  //           children: <Widget>[
  //             buildPushNoti(context,message['data']),
  //           ],
  //         ),
  //       );
  //     },

  //     onLaunch: ( info ) async {
  //       print('======== onLaunch ========');
  //       print(info);
  //     },

  //     onResume: ( info ) async {
  //       print('======== onResume ========');
  //       print(info);
  //     }

  //   );
  // }

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
        title: Text('Mascota', style: TextStyle(fontSize: 10.5)), //
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
}

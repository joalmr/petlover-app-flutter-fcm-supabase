import 'dart:io';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:proypet/src/pages/navigation_pages/destacados_page.dart';
import 'package:proypet/src/pages/navigation_pages/home_page.dart';
import 'package:proypet/src/pages/navigation_pages/notificaciones_page.dart';
import 'package:proypet/src/pages/navigation_pages/recompensas_page.dart';
import 'package:proypet/src/pages/navigation_pages/reserva_list.dart';
import 'package:proypet/src/pages/notificaciones/buildPushNoti.dart';
import 'package:proypet/src/styles/styles.dart';


// Future<dynamic> myBackgroundMessageHandler(Map<String, dynamic> message) {
//   if (message.containsKey('data')) {
//     // Handle data message
//     final dynamic data = message['data'];
//   }

//   if (message.containsKey('notification')) {
//     // Handle notification message
//     final dynamic notification = message['notification'];
//   }

//   // Or do other work.
// }

FirebaseMessaging _firebaseMessaging = FirebaseMessaging();

class NavigationBar extends StatefulWidget {
  final int currentTabIndex;
  // final int marcar;
  NavigationBar({@required this.currentTabIndex, }); //this.marcar

  @override
  _NavigationBarState createState() => _NavigationBarState(currentTabIndex: currentTabIndex); //, marcar: marcar
}

class _NavigationBarState extends State<NavigationBar> {
  int currentTabIndex;
  _NavigationBarState({@required this.currentTabIndex, }); //this.marcar

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    _firebaseMessaging.requestNotificationPermissions();

    _firebaseMessaging.getToken().then((token) {
      //los tokens a agregar en la bd deben ser un arreglo de tokens
      print("======== token ========");
      print(token);
    });
    
    _firebaseMessaging.configure(

      onMessage: (Map<String, dynamic> message) async {
        print('======== onMessage ========');
        print(message['data']);
        showDialog(
          context: context,
          builder: (context) => SimpleDialog(
            contentPadding: EdgeInsets.symmetric(vertical: 10, horizontal: 10),
            children: <Widget>[
              buildPushNoti(context,message['data']),
            ],
            
            // content: //buildPushNoti(message['notification']['data']),
            //   ListTile(
            //     leading: Image(image: CachedNetworkImageProvider(message['data']['petPicture'])),
            //   // title: Text(message['notification']['title']),
            //     subtitle: Text(message['data']['message']),
            //   ),
            //   actions: <Widget>[
            //   FlatButton(
            //       child: Text('Ok'),
            //       onPressed: () => Navigator.of(context).pop(),
            //   ),
            // ],
          ),
        );
      },

      onLaunch: ( info ) async {
        print('======== onLaunch ========');
        print(info);

        final noti = info['data']['comida'];
        print(noti);
      },
 
      onResume: ( info ) async {
        print('======== onResume ========');
        print(info);

        final noti = info['data']['comida'];
        print(noti);
      }

    );
  }
  
  @override
  Widget build(BuildContext context){
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
        title: Text('Mascota',style: TextStyle(fontSize: 10.5)),//
      ),
      BottomNavigationBarItem(
        icon: Icon(Icons.notifications_active,),
        title: Text('Notificaciones',style: TextStyle(fontSize: 10.5)),//
      ),
      BottomNavigationBarItem(
        icon: Icon(Icons.search),//Proypet.proypet
        title: Text('Veterinarias',style: TextStyle(fontSize: 10.5)),//
      ),      
      BottomNavigationBarItem(
        icon: Icon(Icons.favorite),
        title: Text('Destacados',style: TextStyle(fontSize: 10.5)),//
      ),
      BottomNavigationBarItem(
        icon: Icon(Icons.monetization_on,),
        title: Text('Puntos',style: TextStyle(fontSize: 10.5)),//
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

    return 
      Scaffold(
        body: _kTabPages[currentTabIndex],
        bottomNavigationBar: bottomNavBar,
      );

  }
}

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:proypet/config/global_variables.dart';
import 'package:proypet/src/app/styles/styles.dart';
import 'package:proypet/src/app/views/components/appbar_menu.dart';
import 'package:proypet/src/app/views/pages/_nav_view/notificaciones/notificaciones_view.dart';
import 'package:proypet/src/app/views/pages/_nav_view/recompensas/recompensas_view.dart';
import 'package:proypet/src/app/views/pages/_nav_view/veterinarias/veterinarias_view.dart';
import 'package:proypet/src/controllers/_navigation_controller.dart';
import 'package:proypet/src/app/views/pages/_nav_view/home/home_view.dart';

class NavigationBar extends StatefulWidget {
  final int currentTabIndex;
  NavigationBar({@required this.currentTabIndex});

  @override
  _NavigationBarState createState() =>
      _NavigationBarState(currentTabIndex: currentTabIndex);
}

class _NavigationBarState extends State<NavigationBar> {
  int currentTabIndex;
  _NavigationBarState({@required this.currentTabIndex});

  @override
  Widget build(BuildContext context) {
    final _kTabPages = <Widget>[
      HomePage(),
      NotificacionesPage(),
      ReservaList(),
      // DestacadosPage(),
      RecompensasPage(),
    ];

    final _kBottmonNavBarItems = <BottomNavigationBarItem>[
      BottomNavigationBarItem(
        icon: Icon(Icons.pets),
        label: 'Inicio',
      ),
      BottomNavigationBarItem(
        icon: Icon(Icons.notifications_active),
        label: 'Notificaciones',
      ),
      BottomNavigationBarItem(
        icon: Icon(Icons.search),
        label: 'Veterinarias',
      ),
      // BottomNavigationBarItem(icon: Icon(Icons.favorite), title: Text('Destacados', style: TextStyle(fontSize: 10.5)),),
      BottomNavigationBarItem(
        icon: Icon(Icons.monetization_on),
        label: 'Puntos',
      ),
    ];

    return GetBuilder<NavigationController>(
      init: NavigationController(),
      builder: (_) {
        return mediaAncho < 600
            ? Scaffold(
                body: _kTabPages[currentTabIndex],
                bottomNavigationBar: BottomNavigationBar(
                  iconSize: 28.0,
                  selectedLabelStyle: TextStyle(fontSize: 11.0),
                  unselectedLabelStyle: TextStyle(fontSize: 9.0),
                  selectedItemColor: colorMain,
                  unselectedItemColor: Color.fromRGBO(116, 117, 152, 1.0),
                  items: _kBottmonNavBarItems,
                  currentIndex: currentTabIndex,
                  type: BottomNavigationBarType.fixed,
                  backgroundColor: Theme.of(context).backgroundColor,
                  onTap: (int index) => setState(() => currentTabIndex = index),
                ),
              )
            : Scaffold(
                appBar: navbar(),
                body: Container(child: _kTabPages[currentTabIndex]),
              );
      },
    );
  }
}

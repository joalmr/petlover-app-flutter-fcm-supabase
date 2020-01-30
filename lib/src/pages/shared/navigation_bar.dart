import 'package:flutter/material.dart';
import 'package:proypet/src/pages/atenciones_page.dart';
import 'package:proypet/src/pages/home_page.dart';
import 'package:proypet/src/pages/notificaciones_page.dart';
import 'package:proypet/src/pages/reserva_mapa_page.dart';
//import 'package:proypet/src/pages/reserva_page.dart';
import '../../../main.dart';

class NavigationBar extends StatefulWidget {
  @override
  _NavigationBarState createState() => _NavigationBarState() ;
}

class _NavigationBarState extends State<NavigationBar> {
  int _currentTabIndex = 1;
  @override
  Widget build(BuildContext context){
    final _kTabPages = <Widget>[
      NotificacionesPage(), 
      HomePage(),
      ReservaMapaPage(),//ReservaPage(),
      AtencionesPage(),
      AtencionesPage(),
    ];
    final _kBottmonNavBarItems = <BottomNavigationBarItem>[
      BottomNavigationBarItem(
        icon: Icon(Icons.notifications_active,),
        title: Text('Notificaciones',style: TextStyle(fontSize: 12.0)),
      ),
      BottomNavigationBarItem(
        icon: Icon(Icons.pets,),
        title: Text('Greco',style: TextStyle(fontSize: 12.0)),
      ),
      BottomNavigationBarItem(
        icon: Icon(Icons.search,),
        title: Text('Veterinarias',style: TextStyle(fontSize: 12.0)),
      ),      
      BottomNavigationBarItem(
        icon: Icon(Icons.info,),
        title: Text('Destacados',style: TextStyle(fontSize: 12.0)),
      ),
      BottomNavigationBarItem(
            icon: Icon(Icons.monetization_on,),
            title: Text('Recompensas',style: TextStyle(fontSize: 12.0)),
          ),
    ];

    //assert(_kTabPages.length == _kBottmonNavBarItems.length);
    final bottomNavBar = BottomNavigationBar(
      iconSize: 28.0,
      selectedItemColor: colorMain,
      unselectedItemColor: Color.fromRGBO(116, 117, 152, 1.0),//Colors.grey[300],
      items: _kBottmonNavBarItems,
      currentIndex: _currentTabIndex,
      type: BottomNavigationBarType.fixed,
      onTap: (int index) {
        setState(() {
          _currentTabIndex = index;
        });
      },
    );

    return Scaffold(
      body: _kTabPages[_currentTabIndex],
      bottomNavigationBar: bottomNavBar,
    );

  }
}

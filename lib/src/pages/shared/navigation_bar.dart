import 'package:flutter/material.dart';
import 'package:proypet/src/pages/atenciones_page.dart';
import 'package:proypet/src/pages/home_page.dart';
import 'package:proypet/src/pages/mascotas_page.dart';
import 'package:proypet/src/pages/notificaciones_page.dart';
import 'package:proypet/src/pages/reserva_page.dart';
import '../../../main.dart';

class NavigationBar extends StatefulWidget {
  @override
  _NavigationBarState createState() => _NavigationBarState() ;
}

class _NavigationBarState extends State<NavigationBar> {
  int _currentTabIndex = 2;
  @override
  Widget build(BuildContext context){
    final _kTabPages = <Widget>[
      MascotasPage(),
      AtencionesPage(),
      ReservaPage(),
      HomePage(),
      NotificacionesPage(),      
    ];
    final _kBottmonNavBarItems = <BottomNavigationBarItem>[
      BottomNavigationBarItem(
        icon: Icon(Icons.list,),
        title: Text('Mascotas',style: TextStyle(fontSize: 12.0)),
      ),
      BottomNavigationBarItem(
        icon: Icon(Icons.assignment_late,),
        title: Text('Atenciones',style: TextStyle(fontSize: 12.0)),
      ),
      BottomNavigationBarItem(
        icon: Container(
          height: 50.0,
          width: 50.0,
          decoration: BoxDecoration(
            color: colorSec,
            borderRadius: BorderRadius.circular(100.0),
          ),
          child: Icon(Icons.search,color: Colors.white70,),
        ),
        title: Text('',style: TextStyle(fontSize: 0.0)),
        activeIcon: Container(
          height: 50.0,
          width: 50.0,
          decoration: BoxDecoration(
            color: colorMain,
            borderRadius: BorderRadius.circular(100.0),
          ),
          child: Icon(Icons.search,color: Colors.white,),
        ),
      ),
      BottomNavigationBarItem(
        icon: Icon(Icons.pets,),
        title: Text('Greco',style: TextStyle(fontSize: 12.0)),
      ),
      BottomNavigationBarItem(
            icon: Icon(Icons.notifications,),
            title: Text('Notificaciones',style: TextStyle(fontSize: 12.0)),
          ),
    ];
    assert(_kTabPages.length == _kBottmonNavBarItems.length);
    final bottomNavBar = BottomNavigationBar(
      iconSize: 28.0,
      selectedItemColor: colorMain,
      unselectedItemColor: Color.fromRGBO(116, 117, 152, 1.0),
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

import 'package:flutter/material.dart';
import 'package:proypet/src/pages/navigation_pages/destacados_page.dart';
import 'package:proypet/src/pages/navigation_pages/home_page.dart';
import 'package:proypet/src/pages/navigation_pages/notificaciones_page.dart';
import 'package:proypet/src/pages/navigation_pages/recompensas_page.dart';
import 'package:proypet/src/pages/navigation_pages/reserva_list.dart';
import 'package:proypet/src/styles/styles.dart';


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
      // backgroundColor: colorGray1,
      // elevation: 0,
      unselectedItemColor: Color.fromRGBO(116, 117, 152, 1.0), //colorGray3 //Color.fromRGBO(116, 117, 152, 1.0), //Colors.black54,
      items: _kBottmonNavBarItems,
      currentIndex: currentTabIndex,
      type: BottomNavigationBarType.fixed,
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

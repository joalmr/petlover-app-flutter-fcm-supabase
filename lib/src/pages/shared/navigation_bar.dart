import 'package:flutter/material.dart';
import 'package:proypet/proypet_icons.dart';
import 'package:proypet/src/pages/navigation_pages/destacados_page.dart';
import 'package:proypet/src/pages/navigation_pages/home_page.dart';
import 'package:proypet/src/pages/navigation_pages/notificaciones_page.dart';
import 'package:proypet/src/pages/navigation_pages/recompensas_page.dart';
import 'package:proypet/src/pages/navigation_pages/reserva_list.dart';
import 'package:proypet/src/pages/shared/styles/styles.dart';


class NavigationBar extends StatefulWidget {
  final int currentTabIndex;
  // final int marcar;
  NavigationBar({@required this.currentTabIndex, }); //this.marcar

  @override
  _NavigationBarState createState() => _NavigationBarState(currentTabIndex: currentTabIndex); //, marcar: marcar
}

class _NavigationBarState extends State<NavigationBar> {
  int currentTabIndex;
  // int marcar;
  _NavigationBarState({@required this.currentTabIndex, }); //this.marcar

  @override
  Widget build(BuildContext context){
    final _kTabPages = <Widget>[
      HomePage(),
      NotificacionesPage(),      
      ReservaList(),//marcar: marcar, // ReservaPage(),
      DestacadosPage(),
      RecompensasPage(),
    ];

    final _kBottmonNavBarItems = <BottomNavigationBarItem>[
      BottomNavigationBarItem(
        icon: Icon(Icons.pets),
        title: Text('Inicio',style: TextStyle(fontSize: 12.0)),
      ),
      BottomNavigationBarItem(
        icon: Icon(Icons.notifications_active,),
        title: Text('Notificaciones',style: TextStyle(fontSize: 12.0)),
      ),
      BottomNavigationBarItem(
        icon: Icon(Proypet.proypet),//Icons.search
        title: Text('Establecimientos',style: TextStyle(fontSize: 12.0)),
      ),      
      BottomNavigationBarItem(
        icon: Icon(Icons.info),
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
      currentIndex: currentTabIndex,
      type: BottomNavigationBarType.fixed,
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

import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:mobx/mobx.dart';
import 'package:proypet/src/provider/home_store.dart';
import 'package:proypet/src/provider/push_store.dart';
import 'package:proypet/src/styles/styles.dart';
import 'package:proypet/src/utils/posicion.dart';
import 'package:proypet/src/utils/preferencias_usuario/preferencias_usuario.dart';
import 'package:proypet/src/views/pages/viewDestacados/destacados_page.dart';
import 'package:proypet/src/views/pages/viewHome/home_page.dart';
import 'package:proypet/src/views/pages/viewNotificaciones/notificaciones_page.dart';
import 'package:proypet/src/views/pages/viewRecompensas/recompensas_page.dart';
import 'package:proypet/src/views/pages/viewVeterinarias/reserva_list.dart';

class NavigationBar extends StatefulWidget {
  final int currentTabIndex;

  NavigationBar({
    @required this.currentTabIndex,
  });

  @override
  _NavigationBarState createState() => _NavigationBarState(currentTabIndex: currentTabIndex); //, marcar: marcar
}

class _NavigationBarState extends State<NavigationBar> {
  int currentTabIndex;
  _NavigationBarState({@required this.currentTabIndex});

  final _prefs = new PreferenciasUsuario();

  PushStore pushStore;
  // HomeStore homeStore;

  ReactionDisposer disposer;

  @override
  void initState() {
    super.initState();
    // homeStore = GetIt.I.get<HomeStore>();
    pushStore = GetIt.I.get<PushStore>();

    // homeStore.getSummary();
    pushStore.firebase(); //TODO: ejecuta firebase

    fnPosition().then((value) => _prefs.position = '${value.latitude},${value.longitude}');
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    pushStore.firebaseConfigure(context);
  }

  @override
  void dispose() {
    disposer();
    super.dispose();
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
      BottomNavigationBarItem(icon: Icon(Icons.pets), title: Text('Inicio', style: TextStyle(fontSize: 10.5))),
      BottomNavigationBarItem(icon: Icon(Icons.notifications_active), title: Text('Notificaciones', style: TextStyle(fontSize: 10.5))),
      BottomNavigationBarItem(icon: Icon(Icons.search), title: Text('Veterinarias', style: TextStyle(fontSize: 10.5))),
      BottomNavigationBarItem(icon: Icon(Icons.favorite), title: Text('Destacados', style: TextStyle(fontSize: 10.5))),
      BottomNavigationBarItem(icon: Icon(Icons.monetization_on), title: Text('Puntos', style: TextStyle(fontSize: 10.5))),
    ];

    final bottomNavBar = BottomNavigationBar(
      iconSize: 28.0,
      selectedItemColor: colorMain,
      unselectedItemColor: Color.fromRGBO(116, 117, 152, 1.0),
      items: _kBottmonNavBarItems,
      currentIndex: currentTabIndex,
      type: BottomNavigationBarType.fixed,
      backgroundColor: Theme.of(context).backgroundColor,
      onTap: (int index) => setState(() => currentTabIndex = index),
    );

    return Scaffold(
      body: _kTabPages[currentTabIndex],
      bottomNavigationBar: bottomNavBar,
    );
  }
}

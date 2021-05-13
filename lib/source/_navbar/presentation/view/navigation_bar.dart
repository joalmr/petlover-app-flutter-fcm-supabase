import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:proypet/components/appbar_menu.dart';
import 'package:proypet/design/styles/styles.dart';
import 'package:proypet/source/_navbar/domain/_navigation_controller.dart';
import 'package:proypet/source/home/domain/controller/home_controller.dart';
import 'package:proypet/source/home/presentation/view/home_view.dart';
import 'package:proypet/source/notificaciones/view/notificaciones_view.dart';
import 'package:proypet/source/recompensas/view/recompensas_view.dart';
import 'package:proypet/source/veterinarias/presentation/view/main_vet.dart';

class NavigationBar extends StatelessWidget {
//   final int currentTabIndex;
//   const NavigationBar({@required this.currentTabIndex});

//   @override
//   _NavigationBarState createState() => _NavigationBarState(currentTabIndex: this.currentTabIndex);
// }

// class _NavigationBarState extends State<NavigationBar> {
//   int currentTabIndex;
//   _NavigationBarState({@required this.currentTabIndex});

  @override
  Widget build(BuildContext context) {
    final _kTabPages = <Widget>[
      HomePage(),
      NotificacionesPage(),
      MainVet(), //TODO: lista o favoritas
      RecompensasPage(),
      // ShoppingPage(),
    ];

    final _kBottmonNavBarItems = <BottomNavigationBarItem>[
      BottomNavigationBarItem(icon: Icon(Icons.pets), label: 'Inicio'),
      BottomNavigationBarItem(icon: Icon(Icons.notifications_active), label: 'Notificaciones'),
      BottomNavigationBarItem(icon: Icon(Icons.search), label: 'Veterinarias'),
      BottomNavigationBarItem(icon: Icon(Icons.monetization_on), label: 'Puntos'),
      // BottomNavigationBarItem(icon: Icon(Icons.shopping_cart), label: 'Shopping'),
    ];

    // final _home = Get.find<HomeController>();

    return GetX<NavigationController>(
      // init: NavigationController(),
      builder: (_) {
        return Get.width < 600
            ? Scaffold(
                body: _kTabPages[_.currentTabIndex.value],
                bottomNavigationBar: BottomNavigationBar(
                  iconSize: 28.0,
                  selectedLabelStyle: TextStyle(fontSize: 11.0),
                  unselectedLabelStyle: TextStyle(fontSize: 9.0),
                  selectedItemColor: colorMain,
                  unselectedItemColor: Color.fromRGBO(116, 117, 152, 1.0),
                  items: _kBottmonNavBarItems,
                  currentIndex: _.currentTabIndex.value,
                  type: BottomNavigationBarType.fixed,
                  backgroundColor: Theme.of(context).backgroundColor,
                  onTap: (int index)=> _.currentTabIndex.value=index, //setState(() => currentTabIndex = index),
                ),
              )
            : Scaffold(
                appBar: navbar(),
                body: Container(child: _kTabPages[_.currentTabIndex.value]),
              );
      },
    );
  }
}

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:proypet/src/app/views/components/enddrawer/config_drawer.dart';
import 'package:proypet/src/app/views/components/transition/fadeViewSafeArea.dart';
import 'package:proypet/src/controllers/home_controller/home_controller.dart';

import 'components/atenciones.dart';
import 'components/frecuentes.dart';
import 'components/mascota.dart';
// import 'components/usuario.dart';

class HomePage extends StatelessWidget {
  final GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey<ScaffoldState>();
  final refreshKey = GlobalKey<RefreshIndicatorState>();

  @override
  Widget build(BuildContext context) {
    return GetX<HomeController>(
      builder: (_) {
        return Scaffold(
          key: _scaffoldKey,
          // backgroundColor: appPruebas ? colorRed : null,
          endDrawer: ConfigDrawer(),
          body: RefreshIndicator(
            key: refreshKey,
            onRefresh: _.refresh,
            child: FadeViewSafeArea(
              child: Stack(
                children: <Widget>[
                  ListView(
                    padding: EdgeInsets.only(top: 95, left: 20, right: 20),
                    children: <Widget>[
                      SizedBox(height: 25.0),
                      Mascotas(),
                      Container(
                        margin: EdgeInsets.symmetric(vertical: 25.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: <Widget>[
                            Text(' Servicios frecuentes',
                                style: Get.textTheme.headline6
                                    .apply(fontWeightDelta: 2)),
                            SizedBox(height: 15.0),
                            SingleChildScrollView(
                              physics: BouncingScrollPhysics(),
                              scrollDirection: Axis.horizontal,
                              child: Row(
                                children: <Widget>[
                                  emergencia(),
                                  SizedBox(width: 15.0),
                                  banio(),
                                  SizedBox(width: 15.0),
                                  vacuna(),
                                  SizedBox(width: 15.0),
                                  desparasita(),
                                  SizedBox(width: 15.0),
                                  consulta(),
                                ],
                              ),
                            )
                          ],
                        ),
                      ),
                      SizedBox(height: 10.0),
                      Row(
                        children: <Widget>[
                          Expanded(
                              child: Text("Mis Reservas",
                                  style: Get.textTheme.headline6
                                      .apply(fontWeightDelta: 2))),
                          Icon(Icons.timelapse,
                              color: Get.textTheme.subtitle2.color),
                        ],
                      ),
                      Atenciones(),
                    ],
                  ),
                  Container(
                    height: 95,
                    color: Theme.of(context).scaffoldBackgroundColor,
                    padding: EdgeInsets.symmetric(horizontal: 20),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: <Widget>[
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: <Widget>[
                            Text(
                              "Hola,",
                              style: TextStyle(
                                fontSize: 34,
                                fontWeight: FontWeight.w300,
                              ),
                            ),
                            IconButton(
                                icon: Icon(Icons.settings,
                                    color: Get.textTheme.subtitle2.color),
                                onPressed: () =>
                                    _scaffoldKey.currentState.openEndDrawer())
                          ],
                        ),
                        Text(
                          _.usuario,
                          style:
                              Get.textTheme.headline4.apply(fontWeightDelta: 2),
                        )
                      ],
                    ),
                  )
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}

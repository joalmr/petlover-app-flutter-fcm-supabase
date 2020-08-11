import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:get_it/get_it.dart';
import 'package:proypet/src/provider/home_store.dart';
import 'package:proypet/src/views/components/enddrawer/config_drawer.dart';
import 'package:proypet/src/views/components/transicion/fadeViewSafeArea.dart';

import 'components/atenciones.dart';
import 'components/frecuentes.dart';
import 'components/mascota.dart';
import 'components/usuario.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> with TickerProviderStateMixin {
  final GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey<ScaffoldState>();

  var refreshKey = GlobalKey<RefreshIndicatorState>();
  HomeStore homeStore;

  @override
  void initState() {
    super.initState();
    homeStore = GetIt.I.get<HomeStore>();
  }

  @override
  void dispose() {
    super.dispose();
  }

  Future _refresh() => homeStore.refresh();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      endDrawer: ConfigDrawer(),
      body: inUser(),
    );
  }

  Widget inUser() {
    return RefreshIndicator(
      key: refreshKey,
      onRefresh: _refresh,
      child: Observer(
        builder: (_) => FadeViewSafeArea(
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
                        Text(' Servicios frecuentes', style: Theme.of(context).textTheme.headline6.apply(fontWeightDelta: 2)),
                        SizedBox(height: 15.0),
                        SingleChildScrollView(
                          physics: BouncingScrollPhysics(),
                          scrollDirection: Axis.horizontal,
                          child: Row(
                            children: <Widget>[
                              emergencia(context),
                              SizedBox(width: 15.0),
                              banio(context),
                              SizedBox(width: 15.0),
                              vacuna(context),
                              SizedBox(width: 15.0),
                              desparasita(context),
                              SizedBox(width: 15.0),
                              consulta(context),
                            ],
                          ),
                        )
                      ],
                    ),
                  ),
                  SizedBox(height: 10.0),
                  Row(
                    children: <Widget>[
                      Expanded(child: Text("Mis Reservas", style: Theme.of(context).textTheme.headline6.apply(fontWeightDelta: 2))),
                      Icon(Icons.timelapse, color: Theme.of(context).textTheme.subtitle2.color),
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
                  children: <Widget>[
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        Text("Hola,", style: Theme.of(context).textTheme.headline4.copyWith(fontWeight: FontWeight.normal)),
                        IconButton(
                            icon: Icon(Icons.settings, color: Theme.of(context).textTheme.subtitle2.color),
                            onPressed: () => _scaffoldKey.currentState.openEndDrawer())
                      ],
                    ),
                    usuario(homeStore.usuario, context),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}

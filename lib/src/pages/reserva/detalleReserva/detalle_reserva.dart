import 'package:flutter/material.dart';
import 'package:proypet/src/pages/shared/appbar_menu.dart';

class DetalleReserva extends StatelessWidget {
  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: scaffoldKey,
      appBar: appbar(null,'Detalle de reserva',null),
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            Image(
              image: AssetImage("mascotas.png"),
              height: 350,
              width: double.infinity,
              fit: BoxFit.cover,
            )
          ],
        ),
      ),
    );
  }
}
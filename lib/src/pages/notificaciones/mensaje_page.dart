import 'package:flutter/material.dart';
import 'package:proypet/src/pages/shared/appbar_menu.dart';

class MensajePage extends StatelessWidget {

  @override
  Widget build(BuildContext context) {

    // final arg = ModalRoute.of(context).settings.arguments;
    return Scaffold(
      appBar: appbar(null,'Detalle notificación',null),
      body: Center(
        child: Container(
          child: Text("Texto"),
        ),
      ),
    );
  }
}
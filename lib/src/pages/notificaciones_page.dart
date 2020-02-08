import 'package:flutter/material.dart';
import 'package:proypet/main.dart';
import 'package:proypet/src/pages/shared/appbar_menu.dart';

final List imagen = ['images/elegante1.jpg','images/royal1.jpg'];
final List imagen2 = ['images/royal1.jpg','images/elegante1.jpg'];
class NotificacionesPage extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: colorMain,
        leading: leadingH,
        title: titleH,
        actions: actionsH,
        elevation: 0,
      ),
      body: Container(
        child: Center(
          child: Text('Etc'),
        ),
      ),
    );
  }
}
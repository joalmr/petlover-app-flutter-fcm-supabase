import 'package:flutter/material.dart';
import 'package:proypet/main.dart';
import 'package:proypet/src/pages/shared/appbar_menu.dart';
import 'package:proypet/src/pages/shared/card_swiper.dart';

final List imagen = ['images/elegante1.jpg','images/royal1.jpg'];
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
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: _swiperOtros(imagen),
            )
          ],
        ),
      ),
    );
  }

  Widget _swiperOtros(imagen){
    return CardSwiper(imagenes : imagen,autoplay1: true);    
  }
}
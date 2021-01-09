import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:proypet/src/app/views/components/appbar_menu.dart';
import 'package:proypet/src/app/views/components/transition/fadeViewSafeArea.dart';

import 'package:proypet/src/app/styles/styles.dart';
import 'package:proypet/src/data/models/model/destacado/destacado_model.dart';

class DestacadosPage extends StatelessWidget {
  const DestacadosPage({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: appbar(leadingH, 'Destacados', null),
        body: FadeViewSafeArea(child: _onDestacado()));
  }

  _onDestacado() {
    return SingleChildScrollView(
      child: Column(
        children: <Widget>[_destacado(destacadoList[0])],
      ),
    );
  }

  _destacado(destacado) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 10.0, horizontal: 20.0),
      child: InkWell(
        onTap: () => Get.toNamed('detalledestacado', arguments: destacado),
        child: Card(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              ClipRRect(
                borderRadius: BorderRadius.circular(10.0),
                child: Image(
                    fit: BoxFit.cover,
                    height: 300,
                    width: double.infinity,
                    image: AssetImage(destacado.image)),
              ),
              Padding(
                padding:
                    const EdgeInsets.only(left: 10.0, right: 10.0, top: 10.0),
                child: Text(destacado.title,
                    style: Get.textTheme.subtitle2.apply(fontWeightDelta: 2)),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 10.0),
                child: Text(
                  destacado.text,
                  maxLines: 3,
                  textAlign: TextAlign.justify,
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: <Widget>[
                  FlatButton(
                    onPressed: () =>
                        Get.toNamed('detalledestacado', arguments: destacado),
                    child: Text("Leer más", style: TextStyle(color: colorMain)),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}

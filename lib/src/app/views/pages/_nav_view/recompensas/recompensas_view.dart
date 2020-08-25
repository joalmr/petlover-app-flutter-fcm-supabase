import 'package:animate_do/animate_do.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:proypet/src/app/styles/styles.dart';
import 'package:proypet/src/app/views/components/appbar_menu.dart';
import 'package:proypet/src/app/views/components/transition/fadeViewSafeArea.dart';
import 'package:proypet/src/controllers/recompensas_controller/recompensas_controller.dart';
import 'package:proypet/src/data/models/model/bonificacion/bonificacion_model.dart';

class RecompensasPage extends StatelessWidget {
  final refreshKey = GlobalKey<RefreshIndicatorState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appbar(leadingH, 'Puntos', null),
      body: GetX<RecompensasController>(
        init: RecompensasController(),
        builder: (_) {
          return RefreshIndicator(
            key: refreshKey,
            onRefresh: _.refresh,
            child: _.loading.value
                ? FadeViewSafeArea(
                    child: Container(
                      child: Center(
                        child: CupertinoActivityIndicator(),
                      ),
                    ),
                  )
                : FadeViewSafeArea(
                    child: ListView(
                      children: [
                        FadeIn(
                          child: Padding(
                            padding: const EdgeInsets.symmetric(vertical: 20.0, horizontal: 30.0),
                            child: Row(
                              children: [
                                Expanded(
                                  child: Container(
                                    padding: EdgeInsets.all(8.0),
                                    height: 120.0,
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(10.0),
                                      color: colorGreen2,
                                    ),
                                    child: Padding(
                                      padding: const EdgeInsets.symmetric(horizontal: 30.0),
                                      child: Row(
                                        crossAxisAlignment: CrossAxisAlignment.center,
                                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                        children: <Widget>[
                                          Icon(
                                            FontAwesomeIcons.coins,
                                            color: Colors.white,
                                            size: 50.0,
                                          ),
                                          Align(
                                            alignment: Alignment.centerRight,
                                            child: Column(
                                              crossAxisAlignment: CrossAxisAlignment.end,
                                              mainAxisAlignment: MainAxisAlignment.center,
                                              children: <Widget>[
                                                Text(
                                                  '${_.bonificacion.points}',
                                                  style: TextStyle(
                                                    color: Colors.white,
                                                    fontWeight: FontWeight.bold,
                                                    fontSize: 30.0,
                                                  ),
                                                ),
                                                Text(
                                                  'Puntos acumulados',
                                                  style: TextStyle(color: Colors.white60, fontSize: sizeSmallx1, fontWeight: FontWeight.bold),
                                                ),
                                              ],
                                            ),
                                          )
                                        ],
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                        SizedBox(height: 20.0),
                        FadeIn(
                          child: Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 20.0),
                            child: Text('Últimos puntos ganados', style: Get.textTheme.subtitle2.apply(fontWeightDelta: 2)),
                          ),
                        ),
                        FadeIn(
                          child: _listaBonificacion(_.bonificacion.bonifications),
                        )
                      ],
                    ),
                  ),
          );
        },
      ),
    );
  }

  Widget _listaBonificacion(List<Bonification> bonificados) {
    if (bonificados.length < 1)
      return Center(
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 10.0),
          child: Text("No tiene puntos ganados"),
        ),
      );
    else
      return ListView.builder(
        physics: NeverScrollableScrollPhysics(),
        shrinkWrap: true,
        itemCount: bonificados.length,
        itemBuilder: (BuildContext context, int index) {
          return Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10.0),
            child: ListTile(
              title: Text('${bonificados[index].establishmentName}', style: Get.textTheme.subtitle2),
              trailing: CircleAvatar(
                  backgroundColor: colorMain,
                  foregroundColor: Colors.white,
                  child: Text(
                    '+${bonificados[index].points}',
                    style: TextStyle(fontSize: sizeSmallx1, fontWeight: FontWeight.bold),
                  )),
            ),
          );
        },
      );
  }
}

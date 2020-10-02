import 'package:animate_do/animate_do.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:proypet/src/app/styles/styles.dart';
import 'package:proypet/src/app/views/components/navegadores/appbar.dart';
import 'package:proypet/src/app/views/components/transition/fadeViewSafeArea.dart';
import 'package:proypet/src/controllers/recompensas_controller/recompensas_controller.dart';

import 'data.dart';

class RecompensasPage extends StatelessWidget {
  final refreshKey = GlobalKey<RefreshIndicatorState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appBar(
        texto: 'Puntos',
        acc: null,
      ),
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
                    child: Stack(
                    children: [
                      ListView(
                        padding: EdgeInsets.only(top: 150),
                        children: [
                          SizedBox(height: 20.0),
                          Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 15),
                            child: Text('Ranking de puntos'),
                          ),
                          topList(),
                        ],
                      ),
                      FadeIn(
                        child: Container(
                          color: Theme.of(context).scaffoldBackgroundColor,
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
                      ),
                    ],
                  )),
          );
        },
      ),
    );
  }

  Widget topList() {
    int numero = 5;
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 15),
      child: DataTable(
        columnSpacing: 1,
        horizontalMargin: 10,
        columns: const <DataColumn>[
          DataColumn(label: Text('Nombre')),
          DataColumn(label: Text('Mascota')),
          DataColumn(label: Text('Puntos')),
          DataColumn(label: Text('')),
        ],
        rows: List<DataRow>.generate(
          listaTop.length,
          (index) => DataRow(
            cells: [
              DataCell(
                Text(listaTop[index]['name']),
              ),
              DataCell(
                Stack(
                  children: List<Widget>.generate(
                    4,
                    (index) => Positioned(
                      top: 3,
                      left: index.toDouble() * 8,
                      child: index < 3
                          ? CircleAvatar(
                              radius: 20,
                              backgroundColor: colorMain,
                              backgroundImage: AssetImage('images/fre-vacuna.jpeg'),
                            )
                          : CircleAvatar(
                              radius: 20,
                              backgroundColor: colorMain,
                              child: Center(
                                child: Text(
                                  '+${numero - 3}',
                                  style: TextStyle(color: Colors.white70, fontSize: 14),
                                ),
                              ),
                            ),
                    ),
                  ),
                ),
              ),
              DataCell(
                Text(listaTop[index]['points'].toString()),
              ),
              DataCell(
                listaTop[index]['cup'] ? Icon(Icons.star) : SizedBox(width: 0),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

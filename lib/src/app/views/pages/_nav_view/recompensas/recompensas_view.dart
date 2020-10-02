import 'package:animate_do/animate_do.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:proypet/src/app/styles/styles.dart';
import 'package:proypet/src/app/views/components/navegadores/appbar.dart';
import 'package:proypet/src/app/views/components/transition/fadeViewSafeArea.dart';
import 'package:proypet/src/controllers/recompensas_controller/recompensas_controller.dart';
import 'package:proypet/src/data/models/model/bonificacion/bonificacion_top_model.dart';

class RecompensasPage extends StatelessWidget {
  final refreshKey = GlobalKey<RefreshIndicatorState>();

  @override
  Widget build(BuildContext context) {
    int numero = 5;

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
                          // topList(_.top.value),
                          Padding(
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
                                _.top.length,
                                (index) {
                                  BonificacionTop dataTop = _.top[index];
                                  int petsCount = dataTop.pets == null ? 0 : dataTop.pets.length;
                                  return DataRow(
                                    cells: [
                                      DataCell(
                                        Text(dataTop.user),
                                      ),
                                      DataCell(
                                        petsCount > 0
                                            ? Stack(
                                                children: List<Widget>.generate(
                                                  petsCount,
                                                  (index) {
                                                    var pet = dataTop.pets[index];
                                                    return Positioned(
                                                      top: 3,
                                                      left: index.toDouble() * 12,
                                                      child: index < 3
                                                          ? CircleAvatar(
                                                              radius: 20,
                                                              backgroundColor: Colors.white,
                                                              backgroundImage: CachedNetworkImageProvider(pet),
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
                                                    );
                                                  },
                                                ),
                                              )
                                            : SizedBox(width: 0),
                                      ),
                                      DataCell(
                                        Text(dataTop.points.toString()),
                                      ),
                                      DataCell(
                                        dataTop.cup ? Icon(Icons.star) : SizedBox(width: 0),
                                      ),
                                    ],
                                  );
                                },
                              ),
                            ),
                          )
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

  // Widget topList(List<BonificacionTop> top) {
  //   int numero = 5;
  //   return;
  // }
}

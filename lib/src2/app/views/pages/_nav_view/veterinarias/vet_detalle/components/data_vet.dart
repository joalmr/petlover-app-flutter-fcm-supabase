import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:proypet/src2/app/styles/styles.dart';
import 'package:proypet/src2/app/views/pages/_nav_view/veterinarias/vet_detalle/tabs_detalle/comentario_tab/comentario_view.dart';
import 'package:proypet/src2/app/views/pages/_nav_view/veterinarias/vet_detalle/tabs_detalle/general_tab/general_view.dart';
import 'package:proypet/src2/app/views/pages/_nav_view/veterinarias/vet_detalle/tabs_detalle/horario_tab/horario_view.dart';
import 'package:proypet/src2/app/views/pages/_nav_view/veterinarias/vet_detalle/tabs_detalle/precio_tab/precio_view.dart';
import 'package:proypet/src2/controllers/veterinaria_controller/detalle_vet_controller.dart';

class DataVet extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GetBuilder<VetDetalleController>(builder: (_) {
      return DefaultTabController(
        length: 4,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 0.0),
              child: Container(
                width: MediaQuery.of(context).size.width - 0.0,
                // height: MediaQuery.of(context).size.height * 0.1 ,
                child: ListTile(
                  title: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: <Widget>[
                      Text(
                        '${_.vet.distance}km de distancia',
                        style: TextStyle(fontSize: sizeSmallx2),
                      ),
                      Text(_.vet.name, //nombreVet(0),
                          maxLines: 2,
                          style: Get.textTheme.headline6.apply(fontWeightDelta: 2)),
                    ],
                  ),
                  subtitle: Text('${_.vet.address} ', style: TextStyle(fontSize: sizeSmallx1)),
                  trailing: Stack(
                    children: <Widget>[
                      Container(height: 56.0, width: 60.0),
                      Container(
                        height: 50.0,
                        width: 50.0,
                        padding: EdgeInsets.symmetric(horizontal: 5.0),
                        decoration: BoxDecoration(borderRadius: BorderRadius.circular(100.0), color: colorYellow),
                        child: Center(
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: <Widget>[
                              Icon(Icons.star, color: Colors.white, size: 12.0),
                              // SizedBox(width: 5.0),
                              Text(
                                _.vet.stars.toString(),
                                style: TextStyle(
                                  fontSize: 14.0,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.white,
                                ),
                              )
                            ],
                          ),
                        ),
                      ),
                      Positioned(
                        bottom: 0.0,
                        right: 0.0,
                        child: Tooltip(
                          message: 'Atenciones',
                          child: Container(
                            height: 25.0,
                            width: 25.0,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(20.0),
                              color: colorMain,
                            ),
                            child: Center(
                              child: Text(
                                _.vet.attentions.toString(),
                                style: TextStyle(fontSize: 10, color: Colors.white),
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            SizedBox(
              height: 10.0,
            ),
            TabBar(
              indicatorColor: colorMain,
              labelStyle: TextStyle(fontWeight: FontWeight.bold),
              labelColor: colorMain,
              unselectedLabelColor: Get.textTheme.subtitle2.color,
              unselectedLabelStyle: TextStyle(fontWeight: FontWeight.normal),
              isScrollable: true,
              tabs: [
                Tab(text: "General"),
                Tab(text: "Precios"),
                Tab(text: "Horarios"),
                Tab(text: "Comentarios"),
              ],
            ),
            Expanded(
              child: TabBarView(
                children: <Widget>[
                  ViewGeneral(),
                  ViewPrecio(),
                  ViewHorario(),
                  ViewComentario(),
                  // ViewGeneral(localVet: localVet),
                  // ViewPrecio(localVet: localVet),
                  // ViewHorario(localVet: localVet),
                  // ViewComentario(idVet: localVet.id),
                ],
              ),
            ),
          ],
        ),
      );
    });
  }
}

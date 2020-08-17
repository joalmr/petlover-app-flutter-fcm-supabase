import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:proypet/src2/app/styles/styles.dart';
import 'package:proypet/src2/app/views/components/appbar_menu.dart';
import 'package:proypet/src2/app/views/components/form_control/button_primary.dart';
import 'package:proypet/src2/app/views/components/transition/fadeViewSafeArea.dart';
import 'package:proypet/src2/controllers/home_controller/detalle_reserva_controller.dart';

class DetalleReservado extends StatelessWidget {
  // const DetalleReservado({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<DetalleRservadoController>(
      init: DetalleRservadoController(),
      builder: (_) {
        return Scaffold(
          appBar: appbar(null, 'Detalle de reserva', null),
          body: FadeViewSafeArea(
            child: SingleChildScrollView(
              child: Stack(
                children: <Widget>[
                  Container(
                    child: Image(
                      image: CachedNetworkImageProvider(_.argumentos.petPicture),
                      height: 320,
                      width: double.infinity,
                      fit: BoxFit.cover,
                    ),
                  ),
                  Card(
                    margin: EdgeInsets.only(top: 280.0, bottom: 7.5, left: 5.0, right: 5.0),
                    child: SingleChildScrollView(
                      physics: BouncingScrollPhysics(),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: <Widget>[
                          Container(
                            padding: EdgeInsets.symmetric(horizontal: 20.0, vertical: 10.0),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: <Widget>[
                                Text(_.argumentos.petName, style: Get.textTheme.headline5.apply(fontWeightDelta: 2)),
                                SizedBox(height: 20.0),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  children: <Widget>[
                                    Column(
                                      mainAxisAlignment: MainAxisAlignment.start,
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      children: <Widget>[
                                        Text("Estado de la reserva", style: Get.textTheme.subtitle2.apply(fontWeightDelta: 2)),
                                        (!_.vencido)
                                            ? Text(_.argumentos.status,
                                                style: (_.argumentos.statusId == 3 || _.argumentos.statusId == 6)
                                                    ? Get.textTheme.subtitle1.apply(fontWeightDelta: 2, color: colorMain)
                                                    : Get.textTheme.subtitle1.apply(fontWeightDelta: 2))
                                            : Text('${_.argumentos.status} - Vencido',
                                                style: Get.textTheme.subtitle1.apply(fontWeightDelta: 2, color: colorRed))
                                      ],
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.only(right: 15.0),
                                      child: FloatingActionButton(
                                        mini: true,
                                        child: Icon(Icons.phone),
                                        onPressed: () => _.llamar,
                                      ),
                                    )
                                  ],
                                ),
                                SizedBox(height: 10.0),
                                Text("Veterinaria", style: Get.textTheme.subtitle2.apply(fontWeightDelta: 2)),
                                Text(_.argumentos.establishmentName, style: Get.textTheme.subtitle1),
                                SizedBox(height: 10.0),
                                Text("Dirección de veterinaria", style: Get.textTheme.subtitle2.apply(fontWeightDelta: 2)),
                                Text(_.argumentos.address),
                                SizedBox(height: 10.0),
                                Text("Fecha y hora", style: Get.textTheme.subtitle2.apply(fontWeightDelta: 2)),
                                Text('${_.argumentos.date}  ${_.argumentos.time}'),
                                SizedBox(height: 20.0),
                                buttonPri("Ver en mapa", () => _.abreMaps()),
                                SizedBox(height: 20.0),
                                Center(
                                  child: buttonOutLine("Eliminar reserva", () => _.alertaEliminar(), colorRed),
                                ),
                                SizedBox(height: 10.0),
                              ],
                            ),
                          )
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}

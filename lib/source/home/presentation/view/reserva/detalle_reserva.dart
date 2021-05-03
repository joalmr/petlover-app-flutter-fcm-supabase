import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:proypet/components/appbar_menu.dart';
import 'package:proypet/components/form_control/buttons/btn_secondary.dart';
import 'package:proypet/components/transition/fadeView.dart';
import 'package:proypet/design/styles/styles.dart';
import 'package:proypet/source/home/domain/controller/detalle_reserva_controller.dart';
import 'package:proypet/utils/datetime.dart';

class DetalleReservado extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GetBuilder<DetalleRservadoController>(
      init: DetalleRservadoController(),
      builder: (_) {
        return Scaffold(
          appBar: appbar(null, 'Detalle de reserva', null),
          body: FadeView(
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Container(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                          height: 150,
                          padding: EdgeInsets.symmetric(horizontal: 5),
                          child: AspectRatio(
                            aspectRatio: 1,
                            child: ClipRRect(
                              borderRadius: borderRadius,
                              child: Image(
                                image: CachedNetworkImageProvider(
                                    _.argumentos.petPicture),
                                fit: BoxFit.cover,
                              ),
                            ),
                          ),
                        ),
                        Container(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: <Widget>[
                              Text(_.argumentos.petName,
                                  style: Get.textTheme.subtitle1
                                      .copyWith(fontWeight: FontWeight.w900)),
                              SizedBox(height: 5.0),
                              Text("Estado de la reserva",
                                  style: Get.textTheme.subtitle2
                                      .apply(fontWeightDelta: 2)),
                              (!_.argumentos.pastDate)
                                  ? Text(_.argumentos.bookingStatus,
                                      style: (_.argumentos.bookingStatusId ==
                                                  3 ||
                                              _.argumentos.bookingStatusId == 6)
                                          ? Get.textTheme.subtitle2.apply(
                                              fontWeightDelta: 2,
                                              color: colorMain)
                                          : Get.textTheme.subtitle1
                                              .apply(fontWeightDelta: 2))
                                  : Text(
                                      '${_.argumentos.bookingStatus} - Vencido',
                                      style: Get.textTheme.subtitle2.apply(
                                          fontWeightDelta: 2, color: colorRed),
                                    ),
                              Padding(
                                padding: EdgeInsets.only(top: 10, left: 0),
                                child: FloatingActionButton(
                                  mini: true,
                                  child: Icon(Icons.phone),
                                  onPressed: _.llamar,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(height: 5.0),
                  Container(
                    padding: EdgeInsets.symmetric(horizontal: 10),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text("Veterinaria",
                            style: Get.textTheme.subtitle2
                                .apply(fontWeightDelta: 2)),
                        Text(_.argumentos.establishmentName,
                            style: Get.textTheme.subtitle1),
                        SizedBox(height: 10.0),
                        Text("Dirección de veterinaria",
                            style: Get.textTheme.subtitle2
                                .apply(fontWeightDelta: 2)),
                        Text(_.argumentos.establishmentAddress, maxLines: 3),
                        SizedBox(height: 10.0),
                        Text("Fecha",
                            style: Get.textTheme.subtitle2
                                .apply(fontWeightDelta: 2)),
                        Text('${formatDate(_.argumentos.bookingDatetime)}'),
                        SizedBox(height: 10.0),
                        Text("Hora",
                            style: Get.textTheme.subtitle2
                                .apply(fontWeightDelta: 2)),
                        Text('${formatTime(_.argumentos.bookingDatetime)}'),
                        SizedBox(height: 10.0),
                        Text("Servicios",
                            style: Get.textTheme.subtitle2
                                .apply(fontWeightDelta: 2)),
                        Wrap(
                          children: _.argumentos.bookingServices
                              .map((item) => Text(
                                  '$item${_.argumentos.bookingServices.length > 0 ? ', ' : ''}'))
                              .toList()
                              .cast<Widget>(),
                        ),
                        SizedBox(height: 30.0),
                        // btnPrimary(
                        //   text: "Ver en mapa",
                        //   onPressed: () => _.abreMaps(),
                        // ),
                        // SizedBox(height: 20.0),
                        Center(
                          child: btnSecondary(
                            text: "Eliminar reserva",
                            onPressed: () => _.alertaEliminar(),
                            color: colorRed,
                          ),
                        ),
                      ],
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

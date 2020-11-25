import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:proypet/src/app/views/pages/_nav_view/veterinarias/reserva/data/dataDelivery.dart';
import 'package:proypet/src/app/styles/styles.dart';
import 'package:proypet/src/app/views/components/appbar_menu.dart';
import 'package:proypet/src/app/views/components/form_control/button_primary.dart';
import 'package:proypet/src/app/views/components/form_control/ddl_control.dart';
import 'package:proypet/src/app/views/components/transition/fadeViewSafeArea.dart';
import 'package:proypet/src/app/views/pages/_nav_view/veterinarias/reserva/components/direccion_reserva.dart';
import 'package:proypet/src/controllers/veterinaria_controller/components/reserva/fecha.dart';
import 'package:proypet/src/controllers/veterinaria_controller/reserva_vet_controller.dart';

import 'components/mapa_reserva.dart';

class DataReserva extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GetX<ReservaVetController>(
        init: ReservaVetController(),
        builder: (_) {
          return Scaffold(
              appBar: appbar(null, 'Reservar servicio', null),
              body: FadeViewSafeArea(
                child: SingleChildScrollView(
                  child: Padding(
                    padding: const EdgeInsets.all(20.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: [
                        Text(_.vet.name,
                            style: TextStyle(
                                fontSize: 18.0, fontWeight: FontWeight.bold)),
                        SizedBox(height: 20.0),
                        Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            Text('Mascota'),
                            SizedBox(height: 7.5),
                            ddlFutureImg(context, _.mascotaId, _.misMascotas,
                                (opt) {
                              _.mascotaId = opt.toString();
                            })
                          ],
                        ),
                        SizedBox(height: 20.0),
                        Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            Text('Servicio'),
                            SizedBox(height: 7.5),
                            TextField(
                              enableInteractiveSelection: false,
                              controller: _.inputServController,
                              onTap: () => _.servicios(context),
                              cursorColor: colorMain,
                              decoration: InputDecoration(
                                suffixIcon: Padding(
                                  padding: const EdgeInsets.only(right: 10),
                                  child: Icon(Icons.keyboard_arrow_down,
                                      color: colorMain),
                                ),
                              ),
                            ),
                          ],
                        ),
                        SizedBox(height: 20.0),
                        Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            Text('Fecha'),
                            SizedBox(height: 7.5),
                            crearFecha(context),
                          ],
                        ),
                        SizedBox(height: 20.0),
                        Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            Text('Hora'),
                            SizedBox(height: 7.5),
                            TextField(
                              enableInteractiveSelection: false,
                              controller: _.inputHoraController,
                              onTap: () => _.pickTime(context),
                              cursorColor: colorMain,
                              decoration: InputDecoration(
                                hintText: 'Hora de atención',
                                prefixIcon:
                                    Icon(Icons.access_time, color: colorMain),
                              ),
                            ),
                          ],
                        ),
                        _.hasDelivery
                            ? SizedBox(height: 20.0)
                            : SizedBox(height: 0.0),
                        _.hasDelivery
                            ? Padding(
                                padding: const EdgeInsets.only(bottom: 7.5),
                                child: Text('Movilidad'),
                              )
                            : SizedBox(height: 0.0),
                        _.hasDelivery
                            ? ddlMain(context, _.deliveryId, deliveryList,
                                (opt) {
                                _.deliveryId = opt.toString();
                              })
                            : SizedBox(height: 0.0),
                        (_.hasDelivery && _.deliveryId != "1")
                            ? Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: <Widget>[
                                  SizedBox(height: 5.0),
                                  autoDireccion(),
                                  SizedBox(height: 5.0),
                                  Container(
                                    height: 250.0,
                                    width: double.infinity,
                                    child: MapaReserva(),
                                  )
                                ],
                              )
                            : SizedBox(height: 0.0),
                        SizedBox(height: 20.0),
                        Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            Text('Observación'),
                            SizedBox(height: 7.5),
                            TextField(
                              enableInteractiveSelection: false,
                              controller: _.inputObservacioController,
                              textCapitalization: TextCapitalization.sentences,
                              // maxLength: 250,
                              keyboardType: TextInputType.multiline,
                              cursorColor: colorMain,
                              decoration: InputDecoration(
                                  hintText: 'Ingrese observación (opcional)'),
                              onChanged: (value) => _.observacion = value,
                            ),
                            Text.rich(
                              TextSpan(
                                text: '*Si seleccionó ', // default text style
                                children: <TextSpan>[
                                  TextSpan(
                                    text: 'Otro servicio',
                                    style:
                                        TextStyle(fontWeight: FontWeight.bold),
                                  ),
                                  TextSpan(
                                      text: ', especifíquelo en observaciones',
                                      style: TextStyle()),
                                ],
                              ),
                              style: TextStyle(fontSize: sizeSmallx1),
                            ),
                          ],
                        ),
                        SizedBox(height: 30.0),
                        _.servicioReservaLista.length > 0
                            ? buttonPri('Confirmar reserva',
                                _.actBtn.value ? _.reservarAtencion : null)
                            : buttonPri('Confirmar reserva', () {},
                                cargando: true),
                        SizedBox(height: 7.5),
                        buttonFlat("Cancelar", () => Get.back(), colorRed),
                      ],
                    ),
                  ),
                ),
              ));
        });
  }
}

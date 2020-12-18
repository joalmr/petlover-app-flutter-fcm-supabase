import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:proypet/src/app/views/pages/_nav_view/veterinarias/reserva/data/dataDelivery.dart';
import 'package:proypet/src/app/styles/styles.dart';
import 'package:proypet/src/app/views/components/appbar_menu.dart';
import 'package:proypet/src/app/views/components/form_control/button_primary.dart';
import 'package:proypet/src/app/views/components/form_control/ddl_control.dart';
import 'package:proypet/src/app/views/pages/_nav_view/veterinarias/reserva/components/direccion_reserva.dart';
import 'package:proypet/src/controllers/veterinaria_controller/components/reserva/fecha.dart';
import 'package:proypet/src/controllers/veterinaria_controller/components/reserva/servicio_dato.dart';
import 'package:proypet/src/controllers/veterinaria_controller/reserva_vet_controller.dart';
import 'package:proypet/src/data/models/model/servicio_reserva.dart';
import 'components/mapa_reserva.dart';

class DataReserva extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GetX<ReservaVetController>(
        init: ReservaVetController(),
        builder: (_) {
          return Scaffold(
            appBar: appbar(null, 'Reservar servicio', null),
            body: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.only(left: 20, right: 20),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        _.vet.name,
                        style: TextStyle(
                          fontSize: 18.0,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      SizedBox(height: 2.5),
                      Text('Mascota'),
                      SizedBox(height: .5),
                      ddlFutureImg(context, _.mascotaId, _.misMascotas, (opt) {
                        _.mascotaId = opt.toString();
                      })
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 20, right: 0),
                  child: Text(
                    'Servicio: ${_.textoServicios}',
                    style: TextStyle(fontSize: 11),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 20, right: 0),
                  child: Text(
                    'Fecha: ${_.fechaTimeAt.substring(0, 16)}',
                    style: TextStyle(fontSize: 11),
                  ),
                ),
                SizedBox(height: 0),
                Expanded(
                  child: Form(
                    child: Stepper(
                      currentStep: _.stepVal,
                      steps: [
                        Step(
                          isActive: _.stepVal > 0 ? true : false,
                          state: _.stepVal > 0
                              ? StepState.complete
                              : StepState.disabled,
                          title: Text('Seleccione servicio'),
                          content: Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              FutureBuilder(
                                future: _.getData(),
                                builder: (BuildContext context,
                                    AsyncSnapshot<List<ServicioReserva>>
                                        snapshot) {
                                  if (snapshot.data == null) {
                                    return Text("Espere...");
                                  } else {
                                    return Wrap(
                                      children: snapshot.data
                                          .map((item) =>
                                              MisServicioReserva(item))
                                          .toList()
                                          .cast<Widget>(),
                                    );
                                  }
                                },
                              ),
                            ],
                          ),
                        ),
                        Step(
                          isActive: _.stepVal > 1 ? true : false,
                          state: _.stepVal > 1
                              ? StepState.complete
                              : StepState.disabled,
                          title: Text('Seleccione fecha'),
                          content: Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text('Fecha'),
                              SizedBox(height: .5),
                              crearFecha(context),
                              SizedBox(height: 10.0),
                              Text('Hora'),
                              SizedBox(height: .5),
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
                        ),
                        Step(
                          title: Text('Finalizar'),
                          content: Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              _.hasDelivery
                                  ? Padding(
                                      padding: EdgeInsets.only(bottom: .5),
                                      child: Text('Movilidad'),
                                    )
                                  : SizedBox(height: 0.0),
                              _.hasDelivery
                                  ? ddlMain(
                                      context,
                                      _.deliveryId,
                                      deliveryList,
                                      (opt) {
                                        _.deliveryId = opt.toString();
                                      },
                                    )
                                  : SizedBox(height: 0.0),
                              (_.hasDelivery && _.deliveryId != "1")
                                  ? Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      mainAxisAlignment:
                                          MainAxisAlignment.start,
                                      children: <Widget>[
                                        SizedBox(height: 5.0),
                                        autoDireccion(),
                                        SizedBox(height: 5.0),
                                        Container(
                                          height: 150.0,
                                          width: double.infinity,
                                          child: MapaReserva(),
                                        ),
                                        SizedBox(height: 10.0),
                                      ],
                                    )
                                  : SizedBox(height: 0.0),
                              Column(
                                mainAxisAlignment: MainAxisAlignment.start,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: <Widget>[
                                  Text('Observación'),
                                  SizedBox(height: .5),
                                  TextField(
                                    enableInteractiveSelection: false,
                                    controller: _.inputObservacioController,
                                    textCapitalization:
                                        TextCapitalization.sentences,
                                    // maxLength: 250,
                                    keyboardType: TextInputType.multiline,
                                    cursorColor: colorMain,
                                    decoration: InputDecoration(
                                        hintText:
                                            'Ingrese observación (opcional)'),
                                    onChanged: (value) => _.observacion = value,
                                  ),
                                  Text.rich(
                                    TextSpan(
                                      text:
                                          '*Si seleccionó ', // default text style
                                      children: <TextSpan>[
                                        TextSpan(
                                          text: 'Otro servicio',
                                          style: TextStyle(
                                              fontWeight: FontWeight.bold),
                                        ),
                                        TextSpan(
                                            text:
                                                ', especifíquelo en observaciones',
                                            style: TextStyle()),
                                      ],
                                    ),
                                    style: TextStyle(fontSize: sizeSmallx1),
                                  ),
                                  SizedBox(height: 30.0),
                                  _.servicioReservaLista.length > 0
                                      ? buttonPri(
                                          'Confirmar reserva',
                                          _.actBtn.value
                                              ? _.reservarAtencion
                                              : null)
                                      : buttonPri('Confirmar reserva', () {},
                                          cargando: true),
                                  // buttonFlat(
                                  //     "Cancelar", () => Get.back(), colorRed),
                                ],
                              ),
                            ],
                          ),
                        ),
                      ],
                      onStepContinue: () {
                        if (_.stepVal + 1 >= 3) return;
                        _.stepVal++;
                      },
                      onStepCancel: () {
                        if (_.stepVal - 1 < 0) return;
                        _.stepVal--;
                      },
                      controlsBuilder: (BuildContext context,
                          {VoidCallback onStepContinue,
                          VoidCallback onStepCancel}) {
                        _.stepContinue = onStepContinue;
                        _.stepCancel = onStepCancel;
                        return SizedBox.shrink();
                      },
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(bottom: 10),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      buttonFlat(
                        'Atras',
                        _.stepVal == 0 ? null : () => _.stepCancel(),
                        _.stepVal == 0 ? colorGray3 : colorMain,
                      ),
                      buttonFlat(
                        'Siguiente',
                        _.stepVal == 2 ? null : () => _.stepContinue(),
                        _.stepVal == 2 ? colorGray3 : colorMain,
                      ),
                    ],
                  ),
                ),
              ],
            ),
            // FadeViewSafeArea(
            //   child: SingleChildScrollView(
            //     child: Padding(
            //       padding: const EdgeInsets.all(20.0),
            //       child: Column(
            //         crossAxisAlignment: CrossAxisAlignment.stretch,
            //         children: [
            //           Text(_.vet.name,
            //               style: TextStyle(
            //                   fontSize: 18.0, fontWeight: FontWeight.bold)),
            //           SizedBox(height: 20.0),
            //           Column(
            //             mainAxisAlignment: MainAxisAlignment.start,
            //             crossAxisAlignment: CrossAxisAlignment.start,
            //             children: <Widget>[
            //               Text('Mascota'),
            //               SizedBox(height: 7.5),
            //               ddlFutureImg(context, _.mascotaId, _.misMascotas,
            //                   (opt) {
            //                 _.mascotaId = opt.toString();
            //               })
            //             ],
            //           ),
            //           SizedBox(height: 20.0),
            //           Column(
            //             mainAxisAlignment: MainAxisAlignment.start,
            //             crossAxisAlignment: CrossAxisAlignment.start,
            //             children: <Widget>[
            //               Text('Servicio'),
            //               SizedBox(height: 7.5),
            //               TextField(
            //                 enableInteractiveSelection: false,
            //                 controller: _.inputServController,
            //                 onTap: () => _.servicios(context),
            //                 cursorColor: colorMain,
            //                 decoration: InputDecoration(
            //                   suffixIcon: Padding(
            //                     padding: const EdgeInsets.only(right: 10),
            //                     child: Icon(Icons.keyboard_arrow_down,
            //                         color: colorMain),
            //                   ),
            //                 ),
            //               ),
            //             ],
            //           ),
            //           SizedBox(height: 20.0),
            //           Column(
            //             mainAxisAlignment: MainAxisAlignment.start,
            //             crossAxisAlignment: CrossAxisAlignment.start,
            //             children: <Widget>[
            //               Text('Fecha'),
            //               SizedBox(height: 7.5),
            //               crearFecha(context),
            //             ],
            //           ),
            //           SizedBox(height: 20.0),
            //           Column(
            //             mainAxisAlignment: MainAxisAlignment.start,
            //             crossAxisAlignment: CrossAxisAlignment.start,
            //             children: <Widget>[
            //               Text('Hora'),
            //               SizedBox(height: 7.5),
            //               TextField(
            //                 enableInteractiveSelection: false,
            //                 controller: _.inputHoraController,
            //                 onTap: () => _.pickTime(context),
            //                 cursorColor: colorMain,
            //                 decoration: InputDecoration(
            //                   hintText: 'Hora de atención',
            //                   prefixIcon:
            //                       Icon(Icons.access_time, color: colorMain),
            //                 ),
            //               ),
            //             ],
            //           ),
            //           _.hasDelivery
            //               ? SizedBox(height: 20.0)
            //               : SizedBox(height: 0.0),
            //           _.hasDelivery
            //               ? Padding(
            //                   padding: const EdgeInsets.only(bottom: 7.5),
            //                   child: Text('Movilidad'),
            //                 )
            //               : SizedBox(height: 0.0),
            //           _.hasDelivery
            //               ? ddlMain(context, _.deliveryId, deliveryList, (opt) {
            //                   _.deliveryId = opt.toString();
            //                 })
            //               : SizedBox(height: 0.0),
            //           (_.hasDelivery && _.deliveryId != "1")
            //               ? Column(
            //                   crossAxisAlignment: CrossAxisAlignment.start,
            //                   mainAxisAlignment: MainAxisAlignment.start,
            //                   children: <Widget>[
            //                     SizedBox(height: 5.0),
            //                     autoDireccion(),
            //                     SizedBox(height: 5.0),
            //                     Container(
            //                       height: 250.0,
            //                       width: double.infinity,
            //                       child: MapaReserva(),
            //                     )
            //                   ],
            //                 )
            //               : SizedBox(height: 0.0),
            //           SizedBox(height: 20.0),
            //           Column(
            //             mainAxisAlignment: MainAxisAlignment.start,
            //             crossAxisAlignment: CrossAxisAlignment.start,
            //             children: <Widget>[
            //               Text('Observación'),
            //               SizedBox(height: 7.5),
            //               TextField(
            //                 enableInteractiveSelection: false,
            //                 controller: _.inputObservacioController,
            //                 textCapitalization: TextCapitalization.sentences,
            //                 // maxLength: 250,
            //                 keyboardType: TextInputType.multiline,
            //                 cursorColor: colorMain,
            //                 decoration: InputDecoration(
            //                     hintText: 'Ingrese observación (opcional)'),
            //                 onChanged: (value) => _.observacion = value,
            //               ),
            //               Text.rich(
            //                 TextSpan(
            //                   text: '*Si seleccionó ', // default text style
            //                   children: <TextSpan>[
            //                     TextSpan(
            //                       text: 'Otro servicio',
            //                       style: TextStyle(fontWeight: FontWeight.bold),
            //                     ),
            //                     TextSpan(
            //                         text: ', especifíquelo en observaciones',
            //                         style: TextStyle()),
            //                   ],
            //                 ),
            //                 style: TextStyle(fontSize: sizeSmallx1),
            //               ),
            //             ],
            //           ),
            //           SizedBox(height: 30.0),
            //           _.servicioReservaLista.length > 0
            //               ? buttonPri('Confirmar reserva',
            //                   _.actBtn.value ? _.reservarAtencion : null)
            //               : buttonPri('Confirmar reserva', () {},
            //                   cargando: true),
            //           SizedBox(height: 7.5),
            //           buttonFlat("Cancelar", () => Get.back(), colorRed),
            //         ],
            //       ),
            //     ),
            //   ),
            // ),
          );
        });
  }
}

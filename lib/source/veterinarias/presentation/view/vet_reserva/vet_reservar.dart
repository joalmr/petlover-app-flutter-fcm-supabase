import 'package:day_night_time_picker/day_night_time_picker.dart';
import 'package:day_night_time_picker/lib/constants.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:proypet/components/form_control/buttons/btn_alternative.dart';
import 'package:proypet/components/form_control/buttons/btn_primary.dart';
import 'package:proypet/components/form_control/ddl_control.dart';
import 'package:proypet/components/navegadores/appbar.dart';
import 'package:proypet/design/styles/styles.dart';
import 'package:proypet/source/veterinarias/domain/controller/reserva_vet_controller.dart';
import 'components/direccion_reserva.dart';
import 'components/fecha.dart';
import 'components/mapa_reserva.dart';
import 'components/servicio_dato.dart';
import 'data/dataDelivery.dart';

class DataReserva extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GetX<ReservaVetController>(
      init: ReservaVetController(),
      builder: (_) {
        return Scaffold(
          appBar: appBar(texto: 'Reservar servicio', acc: null),
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
                        content: Container(
                          width: double.maxFinite,
                          child: Column(
                            children: [
                              Wrap(
                                children: _.servicioReservaLista
                                    .map((item) => MisServicioReserva(item))
                                    .toList()
                                    .cast<Widget>(),
                              ),
                              SizedBox(height: 5.0),
                              Column(
                                mainAxisAlignment: MainAxisAlignment.start,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: <Widget>[
                                  Text('Observación'),
                                  SizedBox(height: .5),
                                  TextField(
                                    enableInteractiveSelection: false,
                                    controller: _.inputObservacioController,
                                    textCapitalization: TextCapitalization.sentences,
                                    keyboardType: TextInputType.multiline,
                                    decoration: InputDecoration(hintText:'(Opcional)'),
                                    cursorColor: colorMain,
                                    onChanged: (value) => _.observacion = value,
                                  ),
                                  Text.rich(
                                    TextSpan(
                                      text: '*Indique algo que deba saber la veterinaria o si seleccionó ', // default text style
                                      children: <TextSpan>[
                                        TextSpan(
                                          text: 'Otro servicio',
                                          style: TextStyle(fontWeight: FontWeight.bold),
                                        ),
                                        TextSpan(
                                          text: ' detallelo',
                                        ),
                                      ],
                                    ),
                                    style: TextStyle(fontSize: font12),
                                  ),
                                ],
                              ),
                            ],
                          ),
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
                              readOnly: true,
                              onTap: () {
                                final format = DateFormat("HH:mm");
                                Navigator.of(context).push(
                                  showPicker(
                                      context: context,
                                      value: _.pickedTime,
                                      onChange: _.onTimeChanged,
                                      is24HrFormat: true,
                                      minuteInterval: MinuteInterval.TEN,
                                      maxMinute: 50,
                                      barrierDismissible: false,
                                      iosStylePicker: true,
                                      hourLabel: "horas",
                                      minuteLabel: "minutos",
                                      okText: 'Aceptar',
                                      cancelText: 'Cancelar',
                                      onChangeDateTime: (DateTime dateTime) {
                                        _.hora = format.format(dateTime);
                                        _.inputHoraController.text =
                                            format.format(dateTime);
                                      }),
                                );
                              },
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
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: <Widget>[
                                    SizedBox(height: 5.0),
                                    autoDireccion(),
                                    SizedBox(height: 5.0),
                                    Container(
                                      height: 150.0,
                                      width: double.infinity,
                                      child: MapaReserva(),
                                    ),
                                  ],
                                )
                              : SizedBox(height: 0.0),
                            SizedBox(height: 15.0),
                            Container(
                              padding: EdgeInsets.symmetric(horizontal: 10,vertical: 20),
                              width: double.maxFinite,
                              decoration: BoxDecoration(
                                color: colorGray1,
                                borderRadius: BorderRadius.circular(10),
                              ),
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.start,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text('Resumen reserva', 
                                    style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 14,
                                    ),
                                  ),
                                  Text(
                                    'Servicio: ${_.textoServicios}',
                                    style: TextStyle(fontSize: 12),
                                  ),
                                  Text(
                                    'Fecha: ${_.fechaTimeAt.substring(0, 16).split(' ')[0]}',
                                    style: TextStyle(fontSize: 12),
                                  ),
                                  Text(
                                    'Hora: ${_.fechaTimeAt.substring(0, 16).split(' ')[1]}',
                                    style: TextStyle(fontSize: 12),
                                  ),
                                ],
                              ),
                            ),
                            SizedBox(height: 15.0),
                              _.servicioReservaLista.length > 0
                                ? btnPrimary(
                                    text: 'Reservar',
                                    onPressed: _.actBtn.value
                                        ? _.reservarAtencion
                                        : null,
                                  )
                                : btnPrimary(
                                    text: 'Reservar',
                                    onPressed: () {},
                                    cargando: true,
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
                    Container(
                      width: Get.width / 2,
                      child: Center(
                        child: _.stepVal == 0
                          ? SizedBox(height: 0)
                          : btnAltern(
                              text: 'Atras',
                              onPressed: _.stepCancel,
                              color: colorMain, //observado
                            ),
                      ),
                    ),
                    Container(
                      width: Get.width / 2,
                      child: Center(
                        child: _.stepVal == 2
                          ? SizedBox(height: 0)
                          : btnAltern(
                              text: 'Siguiente',
                              onPressed: _.stepContinue,
                              color: colorMain, //observado
                            ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}

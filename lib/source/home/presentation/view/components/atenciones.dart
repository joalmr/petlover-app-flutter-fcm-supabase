import 'package:animate_do/animate_do.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:proypet/components/form_control/buttons/btn_alternative.dart';
import 'package:proypet/components/form_control/buttons/btn_secondary.dart';
import 'package:proypet/design/styles/styles.dart';
import 'package:proypet/source/home/domain/controller/atencion_home_controller.dart';
import 'package:proypet/source/home/domain/controller/home_controller.dart';
import 'package:proypet/utils/datetime.dart';

class Atenciones extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final _home = Get.find<HomeController>();
    return GetX<BookingHomeController>(
      init: BookingHomeController(),
      builder: (_) {
        return _home.atenciones.length == 0
                ? FadeIn(
                    duration: Duration(milliseconds: 500),
                    child: Container(
                      padding: EdgeInsets.symmetric(vertical: 30.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          (_home.mascotas.length > 0)
                              ? InkWell(
                                  borderRadius: borderRadius,
                                  child: Padding(
                                    padding: const EdgeInsets.only(top: 2, bottom: 2),
                                    child: Image(
                                      image: AssetImage('images/reserva-gana.png'),
                                      fit: BoxFit.cover,
                                      height: 220,
                                    ),
                                  ),
                                )
                              : Padding(
                                  padding: const EdgeInsets.only(bottom: 10),
                                  child: Text(
                                    'Agrega a tu mascota y se parte de la comunidad responsable',
                                    textAlign: TextAlign.center,
                                  ),
                                ),
                          _home.loading.value
                              ? Container()
                              : (_home.mascotas.length > 0)
                                  ? SizedBox(height: 0)
                                  : btnSecondary(
                                      text: 'Agregar mascota',
                                      onPressed: _.agregarMascota,
                                      color: colorMain,
                                    ),
                        ],
                      ),
                    ),
                  )
                : FadeIn(
                    duration: Duration(milliseconds: 500),
                    child: ListView.separated(
                      itemCount: _home.atenciones.length,
                      physics: NeverScrollableScrollPhysics(),
                      shrinkWrap: true,
                      separatorBuilder: (BuildContext context, int index) {
                        return Divider();
                      },
                      itemBuilder: (BuildContext context, int index) {
                        final atencion = _home.atenciones[index];
                        return Dismissible(
                          key: UniqueKey(),
                          background: Container(color: colorRed),
                          direction: DismissDirection.endToStart,
                          confirmDismiss: (fn) => showDialog(
                            context: context,
                            builder: (BuildContext context) => FadeIn(
                              child: AlertDialog(
                                title: Text('Eliminar'),
                                content: Text(
                                    'Seguro que desea eliminar esta reserva?'),
                                actions: <Widget>[
                                  btnAltern(
                                    text: 'Cancelar',
                                    onPressed: _.volver,
                                    color: Get.textTheme.subtitle2.color,
                                  ),
                                  btnAltern(
                                    text: 'Sí, eliminar',
                                    onPressed: () => _.eliminaAtencion(atencion.bookingId),
                                    color: colorRed,
                                  ),
                                ],
                              ),
                            ),
                          ),
                          child: TextButton(
                            onPressed: () => _.detalleReservado(atencion),
                            child: ListTile(
                              leading: CircleAvatar(
                                backgroundColor: Colors.transparent,
                                backgroundImage: CachedNetworkImageProvider(atencion.petPicture),
                                radius: 25.0,
                              ),
                              title: Text(atencion.establishmentName),
                              subtitle: Text(
                                (!atencion.pastDate)
                                    ? atencion.bookingStatus
                                    : '${atencion.bookingStatus} - Vencido',
                                style: (!atencion.pastDate)
                                    ? (atencion.bookingStatusId == 3 || atencion.bookingStatusId == 6)
                                        ? TextStyle(
                                            fontWeight: FontWeight.bold,
                                            color: colorMain)
                                        : TextStyle(
                                            fontWeight: FontWeight.bold,
                                            color:Get.textTheme.subtitle2.color)
                                    : TextStyle(
                                        fontWeight: FontWeight.bold,
                                        color: colorRed),
                              ),
                              trailing: Column(
                                children: <Widget>[
                                  Text(
                                    formatDate(atencion.bookingDatetime),
                                    style: Get.textTheme.subtitle2
                                        .copyWith(fontSize: 12.0)
                                        .apply(fontWeightDelta: 2),
                                  ),
                                  Text(
                                    formatTime(atencion.bookingDatetime),
                                    style: Get.textTheme.subtitle2
                                      .apply(fontWeightDelta: 2, color: colorMain),
                                    textAlign: TextAlign.center,
                                  ),
                                ],
                              ),
                              contentPadding: EdgeInsets.symmetric(horizontal: 0, vertical: 0),
                            ),
                          ),
                        );
                      },
                    ),
                  );
      },
    );
  }
}

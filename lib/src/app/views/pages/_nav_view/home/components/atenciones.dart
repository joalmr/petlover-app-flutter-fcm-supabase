import 'package:animate_do/animate_do.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:proypet/src/app/styles/styles.dart';
import 'package:proypet/src/app/views/components/form_control/button_primary.dart';
import 'package:proypet/src/controllers/home_controller/atencion_home_controller.dart';
import 'package:proypet/src/controllers/home_controller/home_controller.dart';

class Atenciones extends StatelessWidget {
  // const Atenciones({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final _home = Get.find<HomeController>();
    return GetX<BookingHomeController>(
        init: BookingHomeController(),
        builder: (_) {
          return _home.loading.value
              ? Container(
                  width: double.infinity,
                  height: 100,
                  child: Center(child: CupertinoActivityIndicator()),
                )
              : _home.sinAtenciones
                  ? FadeIn(
                      // delay: Duration(milliseconds: 500),
                      duration: Duration(milliseconds: 500),
                      child: Container(
                        padding: EdgeInsets.symmetric(vertical: 30.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            Text(
                              (_home.mascotas.length > 0)
                                  ? 'Haz una reserva en la veterinaria de tu agrado'
                                  : 'Vamos, agrega a tu mascota y se parte de la comunidad responsable',
                              textAlign: TextAlign.center,
                            ),
                            SizedBox(
                              height: 10.0,
                            ),
                            _home.loading.value
                                ? Container()
                                : (_home.mascotas.length > 0)
                                    ? buttonOutLine('Reservar', _.reserva, colorMain)
                                    : buttonOutLine('Agregar mascota', _.agregarMascota, colorMain),
                          ],
                        ),
                      ),
                    )
                  : FadeIn(
                      // delay: Duration(milliseconds: 500),
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
                                  content: Text('Seguro que desea eliminar esta reserva?'),
                                  actions: <Widget>[
                                    buttonModal('Cancelar', _.volver, Get.textTheme.subtitle2.color),
                                    buttonModal('Eliminar', () => _.eliminaAtencion(atencion.id), colorRed),
                                  ],
                                ),
                              ),
                            ),
                            child: FlatButton(
                              onPressed: () => _.detalleReservado(atencion), //_detalleReservado(_home.atenciones[index]),
                              child: ListTile(
                                leading: CircleAvatar(
                                  backgroundColor: colorMain,
                                  backgroundImage: CachedNetworkImageProvider(atencion.petPicture),
                                  radius: 25.0,
                                ),
                                title: Text(atencion.establishmentName), //(!vencido) ?
                                subtitle: Text(
                                  (!atencion.vencido) ? atencion.status : '${atencion.status} - Vencido',
                                  style: (!atencion.vencido)
                                      ? (atencion.statusId == 3 || atencion.statusId == 6)
                                          ? TextStyle(fontWeight: FontWeight.bold, color: colorMain)
                                          : TextStyle(fontWeight: FontWeight.bold, color: Get.textTheme.subtitle2.color)
                                      : TextStyle(fontWeight: FontWeight.bold, color: colorRed),
                                ),
                                trailing: Column(
                                  children: <Widget>[
                                    Text(atencion.date, style: Get.textTheme.subtitle2.copyWith(fontSize: 12.0).apply(fontWeightDelta: 2)),
                                    Text(
                                      atencion.time,
                                      style: Get.textTheme.subtitle2.apply(fontWeightDelta: 2, color: colorMain),
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
        });
  }
}

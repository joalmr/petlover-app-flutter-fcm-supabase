import 'package:animate_do/animate_do.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:proypet/src/provider/home_store.dart';
import 'package:proypet/src2/app/styles/styles.dart';
import 'package:proypet/src2/app/views/components/form_control/button_primary.dart';

class Atenciones extends StatefulWidget {
  // const Atenciones({Key key}) : super(key: key);
  @override
  _AtencionesState createState() => _AtencionesState();
}

class _AtencionesState extends State<Atenciones> {
  HomeStore homeStore;
  // BookingStore bookingStore;

  @override
  void initState() {
    super.initState();
    homeStore = GetIt.I.get<HomeStore>();
    // bookingStore = GetIt.I.get<BookingStore>();
  }

  @override
  void dispose() {
    super.dispose();
  }

  _reservar() => homeStore.reservarGo();
  _agregarMascota() => homeStore.agregarMascota();
  _deleteBooking(id) => homeStore.eliminaAtencion(id);
  _detalleReservado(atencion) => homeStore.detalleReservado(atencion);
  _volver() => homeStore.volver();

  @override
  Widget build(BuildContext context) {
    return homeStore.loading
        ? Container(
            width: double.infinity,
            child: Center(child: CircularProgressIndicator()),
          )
        : homeStore.sinAtenciones
            ? FadeIn(
                delay: Duration(milliseconds: 500),
                duration: Duration(milliseconds: 500),
                child: Container(
                  padding: EdgeInsets.symmetric(vertical: 30.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Text(
                        (homeStore.mascotas.length > 0)
                            ? 'Haz una reserva en la veterinaria de tu agrado'
                            : 'Vamos, agrega a tu mascota y se parte de la comunidad responsable',
                        textAlign: TextAlign.center,
                      ),
                      SizedBox(
                        height: 10.0,
                      ),
                      homeStore.loading
                          ? Container()
                          : (homeStore.mascotas.length > 0)
                              ? buttonOutLine('Reservar', _reservar, colorMain)
                              : buttonOutLine('Agregar mascota', _agregarMascota, colorMain)
                    ],
                  ),
                ),
              )
            : FadeIn(
                delay: Duration(milliseconds: 500),
                duration: Duration(milliseconds: 500),
                child: ListView.separated(
                  itemCount: homeStore.atenciones.length,
                  physics: NeverScrollableScrollPhysics(),
                  shrinkWrap: true,
                  separatorBuilder: (BuildContext context, int index) {
                    return Divider();
                  },
                  itemBuilder: (BuildContext context, int index) {
                    final atencion = homeStore.atenciones[index];
                    // return Observer(builder: (_) {
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
                              buttonModal('Cancelar', _volver, Theme.of(context).textTheme.subtitle2.color),
                              buttonModal('Eliminar', () => _deleteBooking(atencion.id), colorRed),
                            ],
                          ),
                        ),
                      ),
                      child: FlatButton(
                        onPressed: () => _detalleReservado(homeStore.atenciones[index]),
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
                                    : TextStyle(fontWeight: FontWeight.bold, color: Theme.of(context).textTheme.subtitle2.color)
                                : TextStyle(fontWeight: FontWeight.bold, color: colorRed),
                          ),
                          trailing: Column(
                            children: <Widget>[
                              Text(atencion.date, style: Theme.of(context).textTheme.subtitle2.copyWith(fontSize: 12.0).apply(fontWeightDelta: 2)),
                              Text(
                                atencion.time,
                                style: Theme.of(context).textTheme.subtitle2.apply(fontWeightDelta: 2, color: colorMain),
                                textAlign: TextAlign.center,
                              ),
                            ],
                          ),
                          contentPadding: EdgeInsets.symmetric(horizontal: 0, vertical: 0),
                        ),
                      ),
                    );
                    // });
                  },
                ),
              );
  }
}

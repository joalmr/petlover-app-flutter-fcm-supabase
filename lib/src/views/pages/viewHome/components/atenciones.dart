import 'package:animate_do/animate_do.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:provider/provider.dart';
import 'package:proypet/src/provider/home_store.dart';
import 'package:proypet/src/styles/styles.dart';
import 'package:proypet/src/views/components/form_control/button_primary.dart';

class Atenciones extends StatefulWidget {
  // const Atenciones({Key key}) : super(key: key);
  @override
  _AtencionesState createState() => _AtencionesState();
}

class _AtencionesState extends State<Atenciones> {
  HomeStore homeStore;

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    homeStore ??= Provider.of<HomeStore>(context);
  }

  _deleteBooking(String id) => homeStore.eliminaAtencion(context, id);

  @override
  Widget build(BuildContext context) {
    return Observer(
      builder: (_) => homeStore.sinAtenciones
          ? Container(
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
                          ? buttonOutLine('Reservar',
                              () => homeStore.reservar(context), colorMain)
                          : buttonOutLine(
                              'Agregar mascota',
                              () => homeStore.agregarMascota(context),
                              colorMain)
                ],
              ),
            )
          : ListView.builder(
              padding: EdgeInsets.only(top: 5.0),
              physics: NeverScrollableScrollPhysics(),
              shrinkWrap: true,
              itemCount: homeStore.atenciones.length,
              itemBuilder: (BuildContext context, int index) {
                var dismissible = Dismissible(
                  key: UniqueKey(),
                  background: Container(
                    color: colorRed,
                  ),
                  direction: DismissDirection.endToStart,
                  confirmDismiss: (fn) => showDialog(
                      context: context,
                      builder: (BuildContext context) {
                        return FadeIn(
                          child: AlertDialog(
                            title: Text('Eliminar'),
                            content:
                                Text('Seguro que desea eliminar esta reserva?'),
                            actions: <Widget>[
                              buttonModal(
                                  'Cancelar',
                                  () => homeStore.volver(context),
                                  Theme.of(context).textTheme.subtitle2.color),
                              buttonModal(
                                  'Eliminar',
                                  () => _deleteBooking(
                                      homeStore.atenciones[index].id),
                                  colorRed),
                            ],
                          ),
                        );
                      }),
                  child: FlatButton(
                    onPressed: () => Navigator.pushNamed(
                        context, 'detallereservado',
                        arguments: homeStore.atenciones[index]),
                    child: Column(
                      children: <Widget>[
                        ListTile(
                          leading: CircleAvatar(
                            backgroundColor: colorMain,
                            backgroundImage: CachedNetworkImageProvider(
                                homeStore.atenciones[index].petPicture),
                            radius: 25.0,
                          ),
                          title: Text(homeStore.atenciones[index]
                              .establishmentName), //(!vencido) ?
                          subtitle: Text(
                            (!homeStore.atenciones[index].vencido)
                                ? homeStore.atenciones[index].status
                                : '${homeStore.atenciones[index].status} - Vencido',
                            style: (!homeStore.atenciones[index].vencido)
                                ? (homeStore.atenciones[index].statusId == 3 ||
                                        homeStore.atenciones[index].statusId ==
                                            6)
                                    ? TextStyle(
                                        fontWeight: FontWeight.bold,
                                        color: colorMain)
                                    : TextStyle(
                                        fontWeight: FontWeight.bold,
                                        color: Theme.of(context)
                                            .textTheme
                                            .subtitle2
                                            .color)
                                : TextStyle(
                                    fontWeight: FontWeight.bold,
                                    color: colorRed),
                          ),
                          trailing: Column(
                            children: <Widget>[
                              Text(homeStore.atenciones[index].date,
                                  style: Theme.of(context)
                                      .textTheme
                                      .subtitle2
                                      .copyWith(fontSize: 12.0)
                                      .apply(fontWeightDelta: 2)),
                              Text(
                                homeStore.atenciones[index].time,
                                style: Theme.of(context)
                                    .textTheme
                                    .subtitle2
                                    .apply(
                                        fontWeightDelta: 2, color: colorMain),
                                textAlign: TextAlign.center,
                              ),
                            ],
                          ),
                          contentPadding:
                              EdgeInsets.symmetric(horizontal: 0, vertical: 0),
                        ),
                        Divider(),
                      ],
                    ),
                  ),
                );
                return dismissible;
              },
            ),
    );
  }
}

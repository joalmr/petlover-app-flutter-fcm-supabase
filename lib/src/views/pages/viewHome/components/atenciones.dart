import 'package:animate_do/animate_do.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:provider/provider.dart';
import 'package:proypet/src/models/booking/booking_home.dart';
import 'package:proypet/src/provider/home_store.dart';
import 'package:proypet/src/styles/styles.dart';
import 'package:proypet/src/views/components/form_control/button_primary.dart';
import 'package:proypet/src/views/pages/_navigation_pages/navigation_bar.dart';

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

  _deleteBooking(String id) {
    homeStore.eliminaAtencion(id);
    Navigator.pop(context);
  }

  @override
  Widget build(BuildContext context) {
    // List<BookingHome> atenciones = homeStore.atenciones;
    // int petLength = homeStore.mascotas.length;
    if (homeStore.atenciones.length > 0)
      return Observer(
        builder: (_) => ListView.builder(
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
                          buttonModal('Cancelar', () => Navigator.pop(context),
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
                      title: Text(homeStore
                          .atenciones[index].establishmentName), //(!vencido) ?
                      // : Text(homeStore.atenciones[index].establishmentName, style: TextStyle(color: colorRed),),
                      subtitle: Text(
                        (!homeStore.atenciones[index].vencido)
                            ? homeStore.atenciones[index].status
                            : '${homeStore.atenciones[index].status} - Vencido',
                        style: (!homeStore.atenciones[index].vencido)
                            ? (homeStore.atenciones[index].statusId == 3 ||
                                    homeStore.atenciones[index].statusId == 6)
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
                                fontWeight: FontWeight.bold, color: colorRed),
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
                                .apply(fontWeightDelta: 2, color: colorMain),
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
    else if (homeStore.mascotas.length > 0)
      return Container(
        padding: EdgeInsets.symmetric(vertical: 30.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              'Haz una reserva en la veterinaria de tu agrado',
              textAlign: TextAlign.center,
            ),
            SizedBox(
              height: 10.0,
            ),
            buttonOutLine(
                'Reservar',
                () => Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (_) => NavigationBar(currentTabIndex: 2))),
                colorMain)
          ],
        ),
      );
    else
      return Container(
        padding: EdgeInsets.symmetric(vertical: 30.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              'Vamos, agrega a tu mascota y se parte de la comunidad responsable',
              textAlign: TextAlign.center,
            ),
            SizedBox(
              height: 10.0,
            ),
            buttonOutLine(
                'Agregar mascota',
                () => Navigator.pushNamed(context, 'agregarmascota'),
                colorMain),
          ],
        ),
      );
  }
}

import 'package:animate_do/animate_do.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:proypet/src/models/booking/booking_home.dart';
import 'package:proypet/src/models/mascota/mascota_model.dart';
import 'package:proypet/src/providers/booking_provider.dart';
import 'package:proypet/src/styles/styles.dart';
import 'package:proypet/src/views/components/form_control/button_primary.dart';
import 'package:proypet/src/views/components/snackbar.dart';
import 'package:proypet/src/views/pages/_navigation_pages/navigation_bar.dart';

Widget atenciones(List<BookingHome> atenciones, List<MascotaModel> pets,
    BuildContext context, GlobalKey<ScaffoldState> _scaffoldKey) {
  int petLength = pets.length;
  if (atenciones.length > 0)
    return ListView.builder(
      padding: EdgeInsets.only(top: 5.0),
      physics: NeverScrollableScrollPhysics(),
      shrinkWrap: true,
      itemCount: atenciones.length,
      itemBuilder: (BuildContext context, int index) {
        DateTime now = DateTime.now();
        var fechaAt = atenciones[index].date.split('-');
        bool vencido = false;
        if (int.parse(fechaAt[0]) < now.day &&
            int.parse(fechaAt[1]) == now.month &&
            int.parse(fechaAt[2]) == now.year) {
          vencido = true;
        }

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
                    // shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10.0)),
                    title: Text('Eliminar'),
                    content: Text('Seguro que desea eliminar esta reserva?'),
                    actions: <Widget>[
                      buttonModal('Cancelar', () => Navigator.pop(context),
                          Theme.of(context).textTheme.subtitle2.color),
                      buttonModal(
                          'Eliminar',
                          () => _deleteBooking(
                                atenciones[index].id,
                                context,
                                _scaffoldKey,
                              ),
                          colorRed),
                    ],
                  ),
                );
              }),
          child: FlatButton(
            onPressed: () => Navigator.pushNamed(context, 'detallereservado',
                arguments: atenciones[index]),
            child: Column(
              children: <Widget>[
                ListTile(
                  leading: CircleAvatar(
                    backgroundColor: colorMain,
                    backgroundImage: CachedNetworkImageProvider(
                        atenciones[index].petPicture),
                    radius: 25.0,
                  ),
                  title:
                      Text(atenciones[index].establishmentName), //(!vencido) ?
                  // : Text(atenciones[index].establishmentName, style: TextStyle(color: colorRed),),
                  subtitle: Text(
                    (!vencido)
                        ? atenciones[index].status
                        : '${atenciones[index].status} - Vencido',
                    style: (!vencido)
                        ? (atenciones[index].statusId == 3 ||
                                atenciones[index].statusId == 6)
                            ? TextStyle(
                                fontWeight: FontWeight.bold, color: colorMain)
                            : TextStyle(
                                fontWeight: FontWeight.bold,
                                color:
                                    Theme.of(context).textTheme.subtitle2.color)
                        : TextStyle(
                            fontWeight: FontWeight.bold,
                            color: colorRed), //vencido
                  ),
                  trailing: Column(
                    children: <Widget>[
                      Text(atenciones[index].date, //" Mañana",
                          style: Theme.of(context)
                              .textTheme
                              .subtitle2
                              .copyWith(fontSize: 12.0)
                              .apply(fontWeightDelta: 2)),
                      Text(
                        atenciones[index].time, //"17:00",
                        style: Theme.of(context)
                            .textTheme
                            .subtitle2
                            .apply(fontWeightDelta: 2, color: colorMain),
                        // TextStyle(color: colorMain,fontSize: sizeH4,fontWeight: FontWeight.w600),
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
    );
  else if (petLength > 0)
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
          buttonOutLine('Agregar mascota',
              () => Navigator.pushNamed(context, 'agregarmascota'), colorMain),
        ],
      ),
    );
}

final bookingProvider = BookingProvider();

_deleteBooking(String id, BuildContext context,
    GlobalKey<ScaffoldState> _scaffoldKey) async {
  bool resp = await bookingProvider.deleteBooking(id);
  Navigator.pop(context);
  if (resp) {
    mostrarSnackbar("Atención eliminada", colorMain, _scaffoldKey);
    Navigator.of(context)
        .pushNamedAndRemoveUntil('/nav', ModalRoute.withName('/nav')); //
  } else {
    mostrarSnackbar("No se eliminó la atención", colorRed, _scaffoldKey);
  }
}

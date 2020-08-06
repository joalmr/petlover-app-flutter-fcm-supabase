import 'package:animate_do/animate_do.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:map_launcher/map_launcher.dart';
import 'package:proypet/src/models/booking/booking_home.dart';
import 'package:proypet/src/services/booking_provider.dart';
import 'package:proypet/src/views/components/appbar_menu.dart';
import 'package:proypet/src/views/components/form_control/button_primary.dart';
import 'package:proypet/src/views/components/snackbar.dart';
import 'package:proypet/src/views/components/transicion/fadeViewSafeArea.dart';

import 'package:proypet/src/styles/styles.dart';
import 'package:url_launcher/url_launcher.dart';

class DetalleReservado extends StatefulWidget {
  @override
  _DetalleReservadoState createState() => _DetalleReservadoState();
}

class _DetalleReservadoState extends State<DetalleReservado> {
  final GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey<ScaffoldState>();

  final bookingProvider = BookingProvider();

  @override
  Widget build(BuildContext context) {
    final BookingHome arg = ModalRoute.of(context).settings.arguments;

    return Scaffold(
      key: _scaffoldKey,
      appBar: appbar(null, 'Detalle de reserva', null),
      body: FadeViewSafeArea(
        child: SingleChildScrollView(
          child: Stack(
            children: <Widget>[
              Container(
                child: Image(
                  image: CachedNetworkImageProvider(arg.petPicture),
                  height: 320,
                  width: double.infinity,
                  fit: BoxFit.cover,
                ),
              ),
              Card(
                margin: EdgeInsets.only(
                    top: 280.0, bottom: 7.5, left: 5.0, right: 5.0),
                child: _listaDatos(arg, context),
              ),
            ],
          ),
        ),
      ),
    );
  }

  _listaDatos(BookingHome arg, context) {
    DateTime now = DateTime.now();
    var fechaAt = arg.date.split('-');
    bool vencido = false;
    if (int.parse(fechaAt[0]) < now.day &&
        int.parse(fechaAt[1]) == now.month &&
        int.parse(fechaAt[2]) == now.year) {
      vencido = true;
    }

    return SingleChildScrollView(
      physics: BouncingScrollPhysics(),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.start,
        children: <Widget>[
          Container(
            padding: EdgeInsets.symmetric(horizontal: 20.0, vertical: 10.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.start,
              children: <Widget>[
                Text(
                  arg.petName,
                  style: Theme.of(context)
                      .textTheme
                      .headline5
                      .apply(fontWeightDelta: 2),
                ),
                SizedBox(
                  height: 20.0,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Text(
                          "Estado de la reserva",
                          style: Theme.of(context)
                              .textTheme
                              .subtitle2
                              .apply(fontWeightDelta: 2),
                        ),
                        (!vencido)
                            ? Text(arg.status,
                                style: (arg.statusId == 3 || arg.statusId == 6)
                                    ? Theme.of(context)
                                        .textTheme
                                        .subtitle1
                                        .apply(
                                            fontWeightDelta: 2,
                                            color: colorMain)
                                    : Theme.of(context)
                                        .textTheme
                                        .subtitle1
                                        .apply(fontWeightDelta: 2))
                            : Text('${arg.status} - Vencido',
                                style: Theme.of(context)
                                    .textTheme
                                    .subtitle1
                                    .apply(fontWeightDelta: 2, color: colorRed))
                      ],
                    ),
                    Padding(
                      padding: const EdgeInsets.only(right: 15.0),
                      child: FloatingActionButton(
                        mini: true,
                        child: Icon(
                          Icons.phone,
                        ),
                        onPressed: () => _launchPhone(arg.establishmentPhone),
                      ),
                    )
                  ],
                ),
                SizedBox(
                  height: 10.0,
                ),
                Text(
                  "Veterinaria",
                  style: Theme.of(context)
                      .textTheme
                      .subtitle2
                      .apply(fontWeightDelta: 2),
                ),
                Text(arg.establishmentName,
                    style: Theme.of(context).textTheme.subtitle1),
                SizedBox(
                  height: 10.0,
                ),
                Text(
                  "Dirección de veterinaria",
                  style: Theme.of(context)
                      .textTheme
                      .subtitle2
                      .apply(fontWeightDelta: 2),
                ),
                Text(arg.address),
                SizedBox(
                  height: 10.0,
                ),
                Text(
                  "Fecha y hora",
                  style: Theme.of(context)
                      .textTheme
                      .subtitle2
                      .apply(fontWeightDelta: 2),
                ),
                Text('${arg.date} ${arg.time}'),
                SizedBox(
                  height: 20.0,
                ),
                buttonPri(
                    "Ver en mapa",
                    () => _openMapsSheet(
                        context,
                        arg.establishmentName,
                        arg.address,
                        arg.establishmentLat,
                        arg.establishmentLng)),
                SizedBox(
                  height: 20.0,
                ),
                Center(
                    child: buttonOutLine("Eliminar reserva",
                        () => _alertaEliminar(arg.id, context), colorRed)),
                SizedBox(
                  height: 10.0,
                ),
              ],
            ),
          )
        ],
      ),
    );
  }

  _alertaEliminar(id, context) {
    return showDialog(
        context: context,
        builder: (BuildContext context) {
          return FadeIn(
            child: AlertDialog(
              title: Text('Eliminar'),
              content: Text('Seguro que desea eliminar esta reserva?'),
              actions: <Widget>[
                buttonModal(
                  'Cancelar',
                  () => Navigator.pop(context),
                  Theme.of(context).textTheme.subtitle2.color,
                ),
                buttonModal(
                  'Sí, eliminar',
                  () => _deleteBooking(id, context),
                  colorRed,
                ),
              ],
            ),
          );
        });
  }

  _deleteBooking(String id, context) async {
    bool resp = await bookingProvider.deleteBooking(id);
    Navigator.pop(context);
    if (resp) {
      Navigator.of(context)
          .pushNamedAndRemoveUntil('/nav', ModalRoute.withName('/nav')); //
    } else {
      mostrarSnackbar("No se eliminó la atención", colorRed, _scaffoldKey);
    }
  }

  _launchPhone(String phone) async {
    var url = 'tel:$phone';
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      throw 'No se pudo llamar $url';
    }
  }

  _openMapsSheet(context, vet, direccion, lat, lng) async {
    try {
      final title = vet;
      final description = direccion;
      final coords = Coords(lat, lng);
      final availableMaps = await MapLauncher.installedMaps;

      showModalBottomSheet(
        context: context,
        builder: (BuildContext context) {
          return SafeArea(
            child: SingleChildScrollView(
              child: Container(
                color: Theme.of(context).backgroundColor,
                child: Wrap(
                  children: <Widget>[
                    for (var map in availableMaps)
                      ListTile(
                        onTap: () => map.showMarker(
                          coords: coords,
                          title: title,
                          description: description,
                        ),
                        title: Text(map.mapName),
                        leading: Image(
                          image: map.icon,
                          height: 30.0,
                          width: 30.0,
                        ),
                      ),
                  ],
                ),
              ),
            ),
          );
        },
      );
    } catch (e) {
      print(e);
    }
  }
}

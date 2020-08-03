import 'dart:async';
import 'package:flutter/material.dart';
import 'package:proypet/src/models/home_model.dart';
import 'package:proypet/src/providers/user_provider.dart';
import 'package:proypet/src/views/components/enddrawer/config_drawer.dart';
import 'package:proypet/src/views/components/transicion/fadeViewSafeArea.dart';

import 'package:proypet/src/utils/error_internet.dart';

import 'components/atenciones.dart';
import 'components/frecuentes.dart';
import 'components/mascota.dart';
import 'components/usuario.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> with TickerProviderStateMixin {
  final GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey<ScaffoldState>();
  final loginProvider = UserProvider();
  // final bookingProvider = BookingProvider();
  var refreshKey = GlobalKey<RefreshIndicatorState>();
  var stream;

  Future<HomeModel> newFuture() => loginProvider.getUserSummary();

  Future<Null> _onRefresh() async {
    refreshKey.currentState?.show();
    await Future.delayed(Duration(milliseconds: 2));

    setState(() {
      stream = newFuture();
    });
    return null;
  }

  @override
  void initState() {
    _onRefresh();

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        key: _scaffoldKey, endDrawer: ConfigDrawer(), body: inUser());
  }

  Widget inUser() {
    return RefreshIndicator(
      key: refreshKey,
      onRefresh: _onRefresh,
      child: FutureBuilder(
        future: stream,
        builder: (BuildContext context, AsyncSnapshot<HomeModel> snapshot) {
          final mydata = snapshot.data;
          if (snapshot.connectionState != ConnectionState.done) {
            return LinearProgressIndicator();
          } else {
            if (snapshot.hasError) {
              return errorInternet();
            }
            return FadeViewSafeArea(
              child: Stack(
                children: <Widget>[
                  ListView(
                    padding: EdgeInsets.only(top: 95, left: 20, right: 20),
                    children: <Widget>[
                      SizedBox(
                        height: 25.0,
                      ),
                      mascotas(mydata.pets, context),
                      Container(
                        margin: EdgeInsets.symmetric(vertical: 25.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: <Widget>[
                            Text(
                              ' Servicios frecuentes',
                              style: Theme.of(context)
                                  .textTheme
                                  .headline6
                                  .apply(fontWeightDelta: 2),
                            ),
                            SizedBox(height: 15.0),
                            SingleChildScrollView(
                              physics: BouncingScrollPhysics(),
                              scrollDirection: Axis.horizontal,
                              child: Row(
                                children: <Widget>[
                                  emergencia(context),
                                  SizedBox(width: 15.0),
                                  banio(context),
                                  SizedBox(width: 15.0),
                                  vacuna(context),
                                  SizedBox(width: 15.0),
                                  desparasita(context),
                                  SizedBox(width: 15.0),
                                  consulta(context),
                                ],
                              ),
                            )
                          ],
                        ),
                      ),
                      SizedBox(height: 10.0),
                      Row(
                        children: <Widget>[
                          Expanded(
                            child: Text(
                              "Mis Reservas",
                              style:
                                  Theme.of(context).textTheme.headline6.apply(
                                        fontWeightDelta: 2,
                                      ),
                            ),
                          ),
                          Icon(Icons.timelapse,
                              color:
                                  Theme.of(context).textTheme.subtitle2.color),
                        ],
                      ),
                      atenciones(
                        mydata.bookings,
                        mydata.pets,
                        context,
                        _scaffoldKey,
                      )
                    ],
                  ),
                  Container(
                    height: 95,
                    color: Theme.of(context).scaffoldBackgroundColor,
                    padding: EdgeInsets.symmetric(horizontal: 20),
                    child: Column(
                      children: <Widget>[
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: <Widget>[
                            Text(
                              "Hola,",
                              style: Theme.of(context)
                                  .textTheme
                                  .headline4
                                  .copyWith(fontWeight: FontWeight.normal),
                            ),
                            IconButton(
                                icon: Icon(
                                  Icons.settings,
                                  color: Theme.of(context)
                                      .textTheme
                                      .subtitle2
                                      .color,
                                ),
                                onPressed: () =>
                                    _scaffoldKey.currentState.openEndDrawer())
                          ],
                        ),
                        usuario(mydata.user, context),
                      ],
                    ),
                  )
                ],
              ),
            );
          }
        },
      ),
    );
  }

  // Widget _atenciones(List<BookingHome> atenciones, List<MascotaModel> pets) {
  //   int petLength = pets.length;
  //   if (atenciones.length > 0)
  //     return ListView.builder(
  //       padding: EdgeInsets.only(top: 5.0),
  //       physics: NeverScrollableScrollPhysics(),
  //       shrinkWrap: true,
  //       itemCount: atenciones.length,
  //       itemBuilder: (BuildContext context, int index) {
  //         DateTime now = DateTime.now();
  //         var fechaAt = atenciones[index].date.split('-');
  //         bool vencido = false;
  //         if (int.parse(fechaAt[0]) < now.day &&
  //             int.parse(fechaAt[1]) == now.month &&
  //             int.parse(fechaAt[2]) == now.year) {
  //           vencido = true;
  //         }

  //         var dismissible = Dismissible(
  //           key: UniqueKey(),
  //           background: Container(
  //             color: colorRed,
  //           ),
  //           direction: DismissDirection.endToStart,
  //           confirmDismiss: (fn) => showDialog(
  //               context: context,
  //               builder: (BuildContext context) {
  //                 return FadeIn(
  //                   child: AlertDialog(
  //                     // shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10.0)),
  //                     title: Text('Eliminar'),
  //                     content: Text('Seguro que desea eliminar esta reserva?'),
  //                     actions: <Widget>[
  //                       buttonModal('Cancelar', () => Navigator.pop(context),
  //                           Theme.of(context).textTheme.subtitle2.color),
  //                       buttonModal(
  //                           'Eliminar',
  //                           () => _deleteBooking(atenciones[index].id),
  //                           colorRed),
  //                     ],
  //                   ),
  //                 );
  //               }),
  //           child: FlatButton(
  //             onPressed: () => Navigator.pushNamed(context, 'detallereservado',
  //                 arguments: atenciones[index]),
  //             child: Column(
  //               children: <Widget>[
  //                 ListTile(
  //                   leading: CircleAvatar(
  //                     backgroundColor: colorMain,
  //                     backgroundImage: CachedNetworkImageProvider(
  //                         atenciones[index].petPicture),
  //                     radius: 25.0,
  //                   ),
  //                   title: Text(
  //                       atenciones[index].establishmentName), //(!vencido) ?
  //                   // : Text(atenciones[index].establishmentName, style: TextStyle(color: colorRed),),
  //                   subtitle: Text(
  //                     (!vencido)
  //                         ? atenciones[index].status
  //                         : '${atenciones[index].status} - Vencido',
  //                     style: (!vencido)
  //                         ? (atenciones[index].statusId == 3 ||
  //                                 atenciones[index].statusId == 6)
  //                             ? TextStyle(
  //                                 fontWeight: FontWeight.bold, color: colorMain)
  //                             : TextStyle(
  //                                 fontWeight: FontWeight.bold,
  //                                 color: Theme.of(context)
  //                                     .textTheme
  //                                     .subtitle2
  //                                     .color)
  //                         : TextStyle(
  //                             fontWeight: FontWeight.bold,
  //                             color: colorRed), //vencido
  //                   ),
  //                   trailing: Column(
  //                     children: <Widget>[
  //                       Text(atenciones[index].date, //" Mañana",
  //                           style: Theme.of(context)
  //                               .textTheme
  //                               .subtitle2
  //                               .copyWith(fontSize: 12.0)
  //                               .apply(fontWeightDelta: 2)),
  //                       Text(
  //                         atenciones[index].time, //"17:00",
  //                         style: Theme.of(context)
  //                             .textTheme
  //                             .subtitle2
  //                             .apply(fontWeightDelta: 2, color: colorMain),
  //                         // TextStyle(color: colorMain,fontSize: sizeH4,fontWeight: FontWeight.w600),
  //                         textAlign: TextAlign.center,
  //                       ),
  //                     ],
  //                   ),
  //                   contentPadding:
  //                       EdgeInsets.symmetric(horizontal: 0, vertical: 0),
  //                 ),
  //                 Divider(),
  //               ],
  //             ),
  //           ),
  //         );
  //         return dismissible;
  //       },
  //     );
  //   else if (petLength > 0)
  //     return Container(
  //       padding: EdgeInsets.symmetric(vertical: 30.0),
  //       child: Column(
  //         crossAxisAlignment: CrossAxisAlignment.center,
  //         mainAxisAlignment: MainAxisAlignment.center,
  //         children: <Widget>[
  //           Text(
  //             'Haz una reserva en la veterinaria de tu agrado',
  //             textAlign: TextAlign.center,
  //           ),
  //           SizedBox(
  //             height: 10.0,
  //           ),
  //           buttonOutLine(
  //               'Reservar',
  //               () => Navigator.push(
  //                   context,
  //                   MaterialPageRoute(
  //                       builder: (_) => NavigationBar(currentTabIndex: 2))),
  //               colorMain)
  //         ],
  //       ),
  //     );
  //   else
  //     return Container(
  //       padding: EdgeInsets.symmetric(vertical: 30.0),
  //       child: Column(
  //         crossAxisAlignment: CrossAxisAlignment.center,
  //         mainAxisAlignment: MainAxisAlignment.center,
  //         children: <Widget>[
  //           Text(
  //             'Vamos, agrega a tu mascota y se parte de la comunidad responsable',
  //             textAlign: TextAlign.center,
  //           ),
  //           SizedBox(
  //             height: 10.0,
  //           ),
  //           buttonOutLine(
  //               'Agregar mascota',
  //               () => Navigator.pushNamed(context, 'agregarmascota'),
  //               colorMain),
  //         ],
  //       ),
  //     );
  // }

  // deleteBooking(String id) async {
  //   bool resp = await bookingProvider.deleteBooking(id);
  //   Navigator.pop(context);
  //   if (resp) {
  //     mostrarSnackbar("Atención eliminada", colorMain, _scaffoldKey);
  //     Navigator.of(context)
  //         .pushNamedAndRemoveUntil('/nav', ModalRoute.withName('/nav')); //
  //   } else {
  //     mostrarSnackbar("No se eliminó la atención", colorRed, _scaffoldKey);
  //   }
  // }
}

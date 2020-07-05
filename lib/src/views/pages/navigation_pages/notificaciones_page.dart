import 'dart:async';
import 'package:animate_do/animate_do.dart';
// import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_swiper/flutter_swiper.dart';
import 'package:proypet/src/models/notificacion/notificacion_model.dart';
import 'package:proypet/src/models/notificacion/tip_model.dart';
import 'package:proypet/src/views/pages/notificaciones/buildNoti.dart';
import 'package:proypet/src/views/pages/notificaciones/buildTip.dart';
import 'package:proypet/src/views/pages/reserva/vet_detalle_page.dart';
import 'package:proypet/src/providers/establecimiento_provider.dart';
import 'package:proypet/src/providers/notificacion_provider.dart';
import 'package:proypet/src/components/appbar_menu.dart';
import 'package:proypet/src/components/transicion/pagina_app.dart';
import 'package:proypet/src/styles/styles.dart';
import 'package:proypet/src/utils/error_internet.dart';
import 'package:proypet/src/utils/icons_map.dart';

final List imagen = ['images/elegante1.jpg', 'images/royal1.jpg'];
final List imagen2 = ['images/royal1.jpg', 'images/elegante1.jpg'];

class NotificacionesPage extends StatefulWidget {
  @override
  _NotificacionesPageState createState() => _NotificacionesPageState();
}

class _NotificacionesPageState extends State<NotificacionesPage> {
  NotificacionProvider notificacionProvider = NotificacionProvider();
  var refreshKey = GlobalKey<RefreshIndicatorState>();
  var stream;

  Future<NotificacionModel> newFuture() =>
      notificacionProvider.getNotificacion();

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
    //implement initState
    super.initState();
    _onRefresh();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appbar(leadingH, 'Notificaciones', null),
      body: FadeView(
        child: Container(
          child: RefreshIndicator(
            onRefresh: _onRefresh,
            child: ListView(
              children: <Widget>[
                _onFuture(),
              ],
            ),
          ),
        ),
      ),
    );
  }

  _onFuture() {
    return FutureBuilder(
      future: stream, //notificacionProvider.getNotificacion(),
      builder:
          (BuildContext context, AsyncSnapshot<NotificacionModel> snapshot) {
        if (snapshot.connectionState != ConnectionState.done) {
          return LinearProgressIndicator();
        } else {
          if (snapshot.hasError) {
            return errorInternet();
          }

          List<Notificacion> notification = snapshot.data.notifications;
          return Column(
            children: <Widget>[
              Container(
                height: 355,
                child: (notification.length < 1)
                    ? Container(
                        margin: EdgeInsets.symmetric(
                            vertical: 10.0, horizontal: 20.0),
                        child: Card(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: <Widget>[
                              ClipRRect(
                                borderRadius:
                                    BorderRadius.all(Radius.circular(10)),
                                child: Image(
                                  image: AssetImage('images/noti-img.png'),
                                  height: 220,
                                  fit: BoxFit.cover,
                                ),
                              ),
                              Expanded(
                                  child: Padding(
                                padding: const EdgeInsets.all(10.0),
                                child: Text("No tienes notificaciones"),
                              ))
                            ],
                          ),
                        ),
                      )
                    : Swiper(
                        itemCount: notification.length,
                        itemBuilder: (BuildContext context, int index) {
                          return _notificacionCase(notification[index]);
                          //buildNoti(notification[index]);
                        },
                        viewportFraction: 1,
                        scale: 1,
                        loop: false,
                        physics: BouncingScrollPhysics(),
                        pagination: new SwiperPagination(
                            margin: new EdgeInsets.only(top: 15.0),
                            builder: new DotSwiperPaginationBuilder(
                                activeColor: colorMain,
                                color: Theme.of(context).backgroundColor,
                                activeSize: 8.0,
                                size: 6.0)),
                      ),
              ),
              Container(
                height: 320,
                child: Swiper(
                  itemCount: tipList.length,
                  itemBuilder: (BuildContext context, int index) {
                    return buildTip(context, tipList[index]);
                  },
                  viewportFraction: 1,
                  scale: 1,
                  loop: false,
                  physics: BouncingScrollPhysics(),
                  pagination: new SwiperPagination(
                      margin: new EdgeInsets.only(top: 15.0),
                      builder: new DotSwiperPaginationBuilder(
                          activeColor: colorMain,
                          color: Theme.of(context).backgroundColor,
                          activeSize: 8.0,
                          size: 6.0)),
                ),
              ),
            ],
          );
        }
      },
    );
  }

  _notificacionCase(Notificacion notificacion) {
    switch (notificacion.type) {
      case "ComingBooking":
        return _comingBooking(notificacion);
        break;
      case "NextDate":
        return _nextDate(notificacion);
        break;
      case "Recordatory":
        return _recordatory(notificacion);
        break;
      default:
        return SizedBox(
          height: 0.0,
        );
        break;
    }
  }

  //reserva cercana
  _comingBooking(Notificacion notification) {
    return buildNoti(notification, () {});
  }

  //proxima cita
  _nextDate(Notificacion notification) {
    return buildNoti(notification,
        () => _fnEstablecimiento(notification.options["establishment_id"]));
  }

  //vacuna, desparasitacion
  _recordatory(Notificacion notification) {
    return buildNoti(
        notification, () => _fnRecordatorio(notification.options["slug"]));
  }

  _fnEstablecimiento(id) async {
    final establecimientoProvider = EstablecimientoProvider();
    Map veterinaria = await establecimientoProvider.getVet(id);
    if (veterinaria['status'] == 200) {
      Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) =>
                VetDetallePage(vet: veterinaria['establishment']),
          ));
    } else {
      showDialog(
          context: context,
          builder: (BuildContext context) {
            return FadeIn(
              child: SimpleDialog(
                contentPadding: EdgeInsets.all(20.0),
                // shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10.0)),
                children: <Widget>[
                  SizedBox(height: 10.0),
                  Text(
                      'Lo sentimos, esta veterinaria ya no forma parte de proypet'),
                  Center(
                    child: Image(
                        height: 200,
                        width: 200,
                        image: AssetImage("images/gato-error.png")),
                  ),
                ],
              ),
            );
          });
    }
  }

  _fnRecordatorio(String slug) {
    Navigator.pushNamed(context, 'navLista', arguments: {
      "filtros": [slugNum[slug]]
    });
  }
}

import 'dart:async';
import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:flutter_swiper/flutter_swiper.dart';
import 'package:get/get.dart';
import 'package:proypet/src/models/notificacion/notificacion_model.dart';
import 'package:proypet/src/models/notificacion/tip_model.dart';
import 'package:proypet/src2/app/views/components/appbar_menu.dart';
import 'package:proypet/src2/app/views/components/transition/fadeViewSafeArea.dart';
import 'package:proypet/src2/data/services/establecimiento_service.dart';
import 'package:proypet/src2/data/services/notificacion_servicio.dart';
import 'package:proypet/src2/utils/error_internet.dart';
import 'package:proypet/src2/utils/icons_map.dart';

import 'package:proypet/src2/app/styles/styles.dart';
import 'package:proypet/src/views/pages/viewVeterinarias/detalleView/vet_detalle_page.dart';

import 'notificaciones/buildNoti.dart';
import 'notificaciones/buildTip.dart';

final List imagen = ['images/elegante1.jpg', 'images/royal1.jpg'];
final List imagen2 = ['images/royal1.jpg', 'images/elegante1.jpg'];

class NotificacionesPage extends StatefulWidget {
  @override
  _NotificacionesPageState createState() => _NotificacionesPageState();
}

class _NotificacionesPageState extends State<NotificacionesPage> {
  NotificacionService notificacionProvider = NotificacionService();
  var refreshKey = GlobalKey<RefreshIndicatorState>();
  var stream;

  Future<NotificacionModel> newFuture() => notificacionProvider.getNotificacion();

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
    super.initState();
    _onRefresh();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appbar(leadingH, 'Notificaciones', null),
      body: FadeViewSafeArea(
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
      future: stream,
      builder: (BuildContext context, AsyncSnapshot<NotificacionModel> snapshot) {
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
                        margin: EdgeInsets.symmetric(vertical: 10.0, horizontal: 20.0),
                        child: Card(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: <Widget>[
                              ClipRRect(
                                borderRadius: BorderRadius.all(Radius.circular(10)),
                                child: Image(image: AssetImage('images/noti-img.png'), height: 220, fit: BoxFit.cover),
                              ),
                              Expanded(child: Padding(padding: const EdgeInsets.all(10.0), child: Text("No tienes notificaciones")))
                            ],
                          ),
                        ),
                      )
                    : Swiper(
                        itemCount: notification.length,
                        itemBuilder: (BuildContext context, int index) {
                          return _notificacionCase(notification[index]);
                        },
                        loop: false,
                        itemWidth: double.maxFinite,
                        itemHeight: double.maxFinite,
                        physics: BouncingScrollPhysics(),
                        // control: SwiperControl(
                        //   size: 20,
                        //   color: colorMain,
                        //   padding: EdgeInsets.symmetric(horizontal: 0),
                        // ),
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
                      builder: new DotSwiperPaginationBuilder(activeColor: colorMain, color: Theme.of(context).backgroundColor, activeSize: 8.0, size: 6.0)),
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
    return buildNoti(notification, () => _fnEstablecimiento(notification.options["establishment_id"]));
  }

  //vacuna, desparasitacion
  _recordatory(Notificacion notification) {
    return buildNoti(notification, () => _fnRecordatorio(notification.options["slug"]));
  }

  _fnEstablecimiento(id) async {
    final establecimientoProvider = EstablecimientoService();
    Map veterinaria = await establecimientoProvider.getVet(id);
    if (veterinaria['status'] == 200) {
      await Get.to(VetDetallePage(vet: veterinaria['establishment']));
    } else {
      showDialog(
          context: context,
          builder: (BuildContext context) {
            return FadeIn(
              child: SimpleDialog(
                contentPadding: EdgeInsets.all(20.0),
                children: <Widget>[
                  SizedBox(height: 10.0),
                  Text('Lo sentimos, esta veterinaria ya no forma parte de proypet'),
                  Center(child: Image(height: 200, width: 200, image: AssetImage("images/gato-error.png"))),
                ],
              ),
            );
          });
    }
  }

  _fnRecordatorio(String slug) {
    Get.toNamed('navLista', arguments: {
      "filtros": [slugNum[slug]]
    });
  }
}

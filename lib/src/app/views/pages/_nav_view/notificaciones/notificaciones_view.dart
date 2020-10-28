import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:proypet/src/app/views/components/navegadores/appbar.dart';
import 'package:proypet/src/app/views/components/transition/fadeViewSafeArea.dart';
import 'package:proypet/src/controllers/notificacion_controller/notificacion_controller.dart';

import 'notificacion/case_noti.dart';

class NotificacionesPage extends StatelessWidget {
  final refreshKey = GlobalKey<RefreshIndicatorState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appBar(
        texto: 'Notificaciones',
        acc: null,
      ), //mediaAncho < 600 ? appbar(leadingH, 'Notificaciones', null) : appbarSec('Notificaciones', null),
      body: GetX<NotificacionController>(
        init: NotificacionController(),
        builder: (_) {
          return RefreshIndicator(
            key: refreshKey,
            onRefresh: _.refresh,
            child: _.loading.value
                ? FadeViewSafeArea(
                    child: Container(
                    child: Center(
                      child: CupertinoActivityIndicator(),
                    ),
                  ))
                : FadeViewSafeArea(
                    child: (_.notifications.length < 1)
                        ? Container(
                            margin: EdgeInsets.symmetric(vertical: 10.0, horizontal: 20.0),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: <Widget>[
                                ClipRRect(
                                  borderRadius: BorderRadius.all(Radius.circular(10)),
                                  child: AspectRatio(
                                    aspectRatio: 2,
                                    child: Image(image: AssetImage('images/noti-img.png'), height: 220, fit: BoxFit.cover),
                                  ),
                                ),
                                Padding(padding: const EdgeInsets.all(10.0), child: Text("No tienes notificaciones"))
                              ],
                            ),
                          )
                        : ListView.builder(
                            itemCount: _.notifications.length,
                            itemBuilder: (BuildContext context, int index) {
                              return notificacionCase(_.notifications[index]);
                            },
                          ),
                  ),
          );
        },
      ),
    );
  }
}

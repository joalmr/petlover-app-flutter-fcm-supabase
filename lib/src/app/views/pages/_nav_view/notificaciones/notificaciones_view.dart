import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_swiper/flutter_swiper.dart';
import 'package:get/get.dart';
import 'package:proypet/src/app/styles/styles.dart';
import 'package:proypet/src/app/views/components/appbar_menu.dart';
import 'package:proypet/src/app/views/components/transition/fadeViewSafeArea.dart';
import 'package:proypet/src/controllers/notificacion_controller/notificacion_controller.dart';
import 'package:proypet/src/data/models/model/notificacion/tip_model.dart';

import 'notificacion/build_tip.dart';
import 'notificacion/case_noti.dart';

class NotificacionesPage extends StatelessWidget {
  final refreshKey = GlobalKey<RefreshIndicatorState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appbar(leadingH, 'Notificaciones', null),
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
                    child: ListView(
                      children: [
                        Container(
                          child: AspectRatio(
                            aspectRatio: 1.07,
                            child: (_.notifications.length < 1)
                                ? Container(
                                    margin: EdgeInsets.symmetric(vertical: 10.0, horizontal: 20.0),
                                    child: Card(
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
                                          Expanded(child: Padding(padding: const EdgeInsets.all(10.0), child: Text("No tienes notificaciones")))
                                        ],
                                      ),
                                    ),
                                  )
                                : Swiper(
                                    itemCount: _.notifications.length,
                                    itemBuilder: (BuildContext context, int index) {
                                      return notificacionCase(_.notifications[index]);
                                    },
                                    loop: false,
                                    itemWidth: double.maxFinite,
                                    itemHeight: double.maxFinite,
                                    physics: BouncingScrollPhysics(),
                                    pagination: new SwiperPagination(
                                      margin: new EdgeInsets.only(top: 15.0),
                                      builder: new DotSwiperPaginationBuilder(
                                        activeColor: colorMain,
                                        color: Theme.of(context).backgroundColor,
                                        activeSize: 8.0,
                                        size: 6.0,
                                      ),
                                    ),
                                  ),
                          ),
                        ),
                        Container(
                          child: AspectRatio(
                            aspectRatio: 1.3,
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
                                  size: 6.0,
                                ),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
          );
        },
      ),
    );
  }
}

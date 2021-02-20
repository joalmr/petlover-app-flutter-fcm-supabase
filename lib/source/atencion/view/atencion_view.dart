import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:proypet/components/appbar_menu.dart';
import 'package:proypet/components/transition/fadeViewSafeArea.dart';
import 'package:proypet/design/styles/lottie.dart';
import 'package:proypet/design/styles/styles.dart';
import 'package:proypet/source/atencion/controller/atencion_controller.dart';
import 'package:proypet/source/atencion/model/atencion_model.dart';
import 'package:proypet/utils/datetime.dart';

class AtencionesPage extends StatelessWidget {
  final refreshKey = GlobalKey<RefreshIndicatorState>();

  @override
  Widget build(BuildContext context) {
    return GetX<AtencionController>(
        init: AtencionController(),
        builder: (_) {
          return Scaffold(
            appBar: appbar(null, 'Calificar Atenciones', null),
            body: RefreshIndicator(
              key: refreshKey,
              onRefresh: _.refresh,
              child: _.loading.value
                  ? FadeViewSafeArea(
                      child: Container(
                        child: Center(
                          child: lottieLoading,
                        ),
                      ),
                    )
                  : _.atenciones.length < 1
                      ? Center(
                          child: Padding(
                            padding: const EdgeInsets.symmetric(vertical: 10.0),
                            child: Text("No tiene veterinarias a calificar"),
                          ),
                        )
                      : FadeViewSafeArea(
                          child: ListView.builder(
                            itemCount: _.atenciones.length,
                            itemBuilder: (BuildContext context, int index) {
                              AtencionModel _atencion = _.atenciones[index];
                              return Padding(
                                padding: const EdgeInsets.symmetric(
                                    horizontal: 20.0),
                                child: Column(
                                  children: <Widget>[
                                    ListTile(
                                      leading: CircleAvatar(
                                        backgroundColor: colorMain,
                                        backgroundImage:
                                            CachedNetworkImageProvider(_atencion
                                                .establishmentLogo), //AssetImage('images/greco.png'),//
                                        radius: 25.0,
                                      ),
                                      title: Text(_atencion.establishmentName),
                                      subtitle: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        mainAxisAlignment:
                                            MainAxisAlignment.start,
                                        children: <Widget>[
                                          Text(_atencion.pet,
                                              style: Get.textTheme.subtitle2),
                                          Text(
                                            formatDateTime(_atencion.createdAt),
                                            style: TextStyle(
                                              color: colorMain,
                                              fontSize: sizeSmallx1,
                                              fontWeight: FontWeight.w600,
                                            ),
                                          ),
                                        ],
                                      ),
                                      trailing: IconButton(
                                        icon: Icon(
                                          Icons.star_border,
                                          color: Get.textTheme.subtitle2.color,
                                        ),
                                        onPressed: () => _.votar(_atencion),
                                      ),
                                      contentPadding: EdgeInsets.symmetric(
                                          horizontal: 0, vertical: 0),
                                    ),
                                    Divider(),
                                  ],
                                ),
                              );
                            },
                          ),
                        ),
            ),
          );
        });
  }
}

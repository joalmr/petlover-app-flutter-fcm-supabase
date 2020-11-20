import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:proypet/src/app/styles/styles.dart';
import 'package:proypet/src/app/views/components/appbar_menu.dart';
import 'package:proypet/src/app/views/components/transition/fadeViewSafeArea.dart';
import 'package:proypet/src/controllers/atencion_controller/atencion_controller.dart';
import 'package:proypet/src/data/models/model/antecion/atencion_model.dart';

import 'calificar.dart';

class AtencionesPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appbar(null, 'Calificar Atenciones', null),
      body: GetX<AtencionController>(
        init: AtencionController(),
        builder: (_) {
          return _.loading.value
              ? FadeViewSafeArea(
                  child: Container(
                    child: Center(
                      child: CupertinoActivityIndicator(),
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
                      child: SingleChildScrollView(
                        child: ListView.builder(
                          physics: NeverScrollableScrollPhysics(),
                          shrinkWrap: true,
                          itemCount: _.atenciones.length,
                          itemBuilder: (BuildContext context, int index) {
                            AtencionModel _atencion = _.atenciones[index];
                            return Padding(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 20.0),
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
                                          _atencion.createdAt,
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
                    );
        },
      ),
    );
  }
}

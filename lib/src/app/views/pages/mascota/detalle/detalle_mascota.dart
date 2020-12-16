import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:proypet/config/global_variables.dart';
import 'package:proypet/src/app/styles/lottie.dart';
import 'package:proypet/src/app/styles/styles.dart';
import 'package:proypet/src/app/views/components/enddrawer/mascota_drawer.dart';
import 'package:proypet/src/app/views/components/transition/fadeView.dart';
import 'package:proypet/src/controllers/mascota_controller/detalle_mascota_controller.dart';

import 'components/cartilla_vacuna.dart';
import 'components/dato_mascota.dart';
import 'components/lista_historia.dart';

class MascotaDetallePage extends StatelessWidget {
  final GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey<ScaffoldState>();
  //
  @override
  Widget build(BuildContext context) {
    return GetX<MascotaDetalleController>(
      init: MascotaDetalleController(),
      builder: (_) {
        return Scaffold(
          key: _scaffoldKey,
          endDrawer: MascotaDrawer(),
          body: FadeView(
            child: Stack(
              children: <Widget>[
                Container(
                  child: _.loading.value
                      ? Container(
                          width: double.infinity,
                          height: double.infinity,
                          child: Center(
                            child: lottieLoading,
                          ),
                        )
                      : SingleChildScrollView(
                          child: Stack(
                            children: <Widget>[
                              Container(
                                child: AspectRatio(
                                  aspectRatio: (mediaAncho < 600) ? 1 : 12 / 8,
                                  child: Image(
                                    image: CachedNetworkImageProvider(
                                        _.pet.picture),
                                    // height: 350,
                                    // width: double.infinity,
                                    fit: BoxFit.cover,
                                  ),
                                ),
                              ),
                              Container(
                                margin: EdgeInsets.only(
                                    top: context.height * 0.4,
                                    bottom: 7.5,
                                    left: 5.0,
                                    right: 5.0),
                                height: context.height - context.height * 0.4,
                                decoration: BoxDecoration(
                                  borderRadius: borderRadius,
                                  color:
                                      Theme.of(context).scaffoldBackgroundColor,
                                ),
                                child: DefaultTabController(
                                  length: 2,
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    children: [
                                      datoMascota(_.pet),
                                      TabBar(
                                        indicatorColor: colorMain,
                                        labelStyle: TextStyle(
                                            fontWeight: FontWeight.bold),
                                        labelColor: colorMain,
                                        unselectedLabelColor:
                                            Get.textTheme.subtitle2.color,
                                        unselectedLabelStyle: TextStyle(
                                            fontWeight: FontWeight.normal),
                                        // isScrollable: true,
                                        tabs: [
                                          Tab(text: "Atenciones"),
                                          Tab(text: "Vacunas"),
                                        ],
                                      ),
                                      Expanded(
                                        child: TabBarView(
                                          children: <Widget>[
                                            listaHistorial(context, _.history),
                                            cartillaDigital(),
                                          ],
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                ),
                Positioned(
                  top: 0,
                  left: 0,
                  right: 0,
                  child: AppBar(
                    backgroundColor: Colors.transparent,
                    elevation: 0,
                    centerTitle: true,
                    title: Text("",
                        style:
                            Get.textTheme.subtitle1.apply(fontWeightDelta: 2)),
                    actions: <Widget>[
                      Container(
                        decoration: BoxDecoration(
                          boxShadow: [
                            BoxShadow(
                                color: Colors.black.withOpacity(0.05),
                                blurRadius: 10.0,
                                spreadRadius: -10.0),
                          ],
                        ),
                        child: IconButton(
                            icon: Icon(Icons.settings),
                            onPressed: () =>
                                _scaffoldKey.currentState.openEndDrawer()),
                      )
                      // IconButton(icon: Icon(Icons.settings), onPressed: () => _scaffoldKey.currentState.openEndDrawer()),
                    ],
                  ),
                )
              ],
            ),
          ),
        );
      },
    );
  }
}

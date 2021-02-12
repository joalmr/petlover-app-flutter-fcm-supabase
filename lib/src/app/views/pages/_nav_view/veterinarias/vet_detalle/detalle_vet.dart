import 'dart:io';
import 'package:animate_do/animate_do.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';
import 'package:proypet/config/global_variables.dart';
import 'package:proypet/config/path_variables.dart';
import 'package:proypet/src/app/styles/lottie.dart';
import 'package:proypet/src/app/styles/styles.dart';
import 'package:proypet/src/app/components/form_control/button_primary.dart';
import 'package:proypet/src/app/components/transition/fadeView.dart';
import 'package:proypet/src/controllers/veterinaria_controller/detalle_vet_controller.dart';
import 'components/data_vet.dart';
import 'components/swiper_vet.dart';

class VetDetallePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GetX<VetDetalleController>(
      init: VetDetalleController(),
      builder: (_) {
        return DefaultTabController(
          length: 5,
          child: _.cargando.value
              ? Scaffold(
                  body: Center(
                    child: lottieLoading,
                  ),
                )
              : Scaffold(
                  appBar: AppBar(
                    elevation: 0,
                    toolbarHeight: context.height * 0.245,
                    automaticallyImplyLeading: false,
                    flexibleSpace: FadeIn(
                      duration: Duration(milliseconds: 500),
                      child: Stack(
                        children: <Widget>[
                          Container(
                            height: double.maxFinite,
                            width: double.maxFinite,
                            child: (_.vet.slides.length > 0)
                                ? swiperVets(_.vet.slides, true)
                                : swiperVets(["images/vet_prueba.jpg"], false),
                          ),
                          Positioned(
                            top: 30,
                            left: 5,
                            child: IconButton(
                              icon: Icon(
                                Platform.isIOS
                                    ? Icons.arrow_back_ios
                                    : Icons.arrow_back,
                              ),
                              onPressed: () => Get.back(),
                            ),
                          ),
                          // appPruebas
                          //     ? Positioned(
                          //         top: 30,
                          //         right: 5,
                          //         child: InkWell(
                          //           onTap: _.setFavorite,
                          //           child: Container(
                          //             height: 45,
                          //             width: 45,
                          //             decoration: BoxDecoration(
                          //               borderRadius:
                          //                   BorderRadius.circular(100.0),
                          //               color: colorGray1,
                          //             ),
                          //             child: Center(
                          //               child: _.favorite.value
                          //                   ? Lottie.asset(
                          //                       pathLottie('favorite'),
                          //                       fit: BoxFit.cover,
                          //                       height: 45,
                          //                       width: 45,
                          //                       repeat: false,
                          //                     )
                          //                   : BounceInDown(
                          //                       from: 5,
                          //                       child: Icon(Icons.favorite)),
                          //             ),
                          //           ),
                          //         ),
                          //       )
                          //     : SizedBox(height: 0),
                          Positioned(
                            right: 7.5,
                            bottom: 9.5,
                            child: Container(
                              height: 55.0,
                              width: 55.0,
                              decoration: BoxDecoration(
                                color: colorGray1,
                                borderRadius: BorderRadius.circular(100.0),
                                image: DecorationImage(
                                  image: CachedNetworkImageProvider(_.vet.logo),
                                  fit: BoxFit.cover,
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  body: FadeView(
                    child: FadeIn(
                      duration: Duration(milliseconds: 500),
                      child: Stack(
                        children: <Widget>[
                          Container(
                            padding: EdgeInsets.only(bottom: 60.0),
                            child: DataVet(),
                          ),
                          Positioned(
                            bottom: 0,
                            child: Container(
                              height: 60,
                              width: MediaQuery.of(context).size.width,
                              padding: EdgeInsets.symmetric(vertical: 5.0),
                              child: Row(
                                children: <Widget>[
                                  SizedBox(
                                      width: MediaQuery.of(context).size.width *
                                          0.025),
                                  SizedBox(
                                    width:
                                        MediaQuery.of(context).size.width * 0.2,
                                    child: FloatingActionButton(
                                      backgroundColor:
                                          Theme.of(context).backgroundColor,
                                      child:
                                          Icon(Icons.phone, color: colorMain),
                                      onPressed: _.llamar,
                                    ),
                                  ),
                                  SizedBox(
                                    width: MediaQuery.of(context).size.width *
                                        0.725,
                                    child: buttonPri(
                                        'Reservar servicio',
                                        _.reservaClic.value
                                            ? _.reservar
                                            : null),
                                  ),
                                  SizedBox(
                                      width: MediaQuery.of(context).size.width *
                                          0.05),
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
        );
      },
    );
  }
}

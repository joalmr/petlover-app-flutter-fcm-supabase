import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:proypet/src/app/styles/styles.dart';
import 'package:proypet/src/app/views/components/form_control/button_primary.dart';
import 'package:proypet/src/app/views/components/transition/fadeView.dart';
import 'package:proypet/src/controllers/veterinaria_controller/detalle_vet_controller.dart';

import 'components/data_vet.dart';
import 'components/swiper_vet.dart';

class VetDetallePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GetX<VetDetalleController>(
        init: VetDetalleController(),
        builder: (_) {
          return Scaffold(
            body: FadeView(
              child: Stack(
                children: <Widget>[
                  Container(
                    height: MediaQuery.of(context).size.height,
                  ),
                  Stack(
                    children: <Widget>[
                      Container(
                        height: 260.0,
                        width: double.infinity,
                        child: (_.vet.slides.length > 0) ? swiperVets(_.vet.slides, true) : swiperVets(["images/vet_prueba.jpg"], false),
                      ),
                      Positioned(
                        right: 7.5,
                        bottom: 9.5,
                        child: Container(
                          height: 55.0,
                          width: 55.0,
                          decoration: BoxDecoration(
                            color: colorGray1,
                            borderRadius: BorderRadius.circular(100.0),
                            image: DecorationImage(image: CachedNetworkImageProvider(_.vet.logo), fit: BoxFit.cover),
                          ),
                        ),
                      )
                    ],
                  ),
                  Container(
                    padding: EdgeInsets.only(top: 260.0, bottom: 60.0),
                    child: DataVet(), //_onDetail(vet),
                  ),
                  Positioned(
                    bottom: 0,
                    child: Container(
                      height: 60,
                      width: MediaQuery.of(context).size.width,
                      padding: EdgeInsets.symmetric(vertical: 5.0),
                      child: Row(
                        children: <Widget>[
                          SizedBox(width: MediaQuery.of(context).size.width * 0.025),
                          SizedBox(
                            width: MediaQuery.of(context).size.width * 0.2,
                            child: FloatingActionButton(
                              backgroundColor: Theme.of(context).backgroundColor,
                              child: Icon(Icons.phone, color: colorMain),
                              onPressed: _.llamar,
                            ),
                          ),
                          SizedBox(
                            width: MediaQuery.of(context).size.width * 0.725,
                            child: buttonPri('Reservar servicio', _.reservaClic.value ? _.reservar : null),
                          ),
                          SizedBox(width: MediaQuery.of(context).size.width * 0.05),
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
                      title: Text("", style: Get.textTheme.subtitle1),
                    ),
                  ),
                ],
              ),
            ),
          );
        });
  }
}

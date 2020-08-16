import 'package:animate_do/animate_do.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:proypet/src/models/establecimiento/establecimiento_model.dart';
import 'package:proypet/src2/app/views/components/card_swiper.dart';
import 'package:proypet/src2/app/styles/styles.dart';
import 'package:proypet/src/views/pages/viewVeterinarias/detalleView/vet_detalle_page.dart';

Widget buildVets(BuildContext context, EstablecimientoModel vetLocales) {
  var vet = vetLocales;

  return FadeIn(
    child: Container(
      margin: EdgeInsets.symmetric(vertical: 10.0, horizontal: 20.0),
      child: InkWell(
          onTap: () => Get.to(VetDetallePage(vet: vet)),
          child: Card(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Stack(
                  children: <Widget>[
                    (vet.slides.length > 0) ? _swiperVets(vet.slides, true) : _swiperVets(["images/vet_prueba.jpg"], false),
                    Positioned(
                      //logo
                      bottom: 5.0,
                      right: 5.0,
                      child: Container(
                        padding: EdgeInsets.all(8.0),
                        child: CircleAvatar(
                          backgroundColor: colorGray1.withOpacity(0.25),
                          backgroundImage: CachedNetworkImageProvider(vet.logo),
                          radius: 25.0,
                        ),
                      ),
                    ),
                  ],
                ),
                Container(
                  padding: EdgeInsets.symmetric(horizontal: 5.0, vertical: 5.0),
                  // color: Colors.white,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: <Widget>[
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: <Widget>[
                          Text(
                            '${vet.distance}km de distancia',
                            maxLines: 1,
                            style: TextStyle(fontSize: sizeSmallx1, color: colorGray3, fontWeight: FontWeight.w400),
                          ),
                          Row(
                            children: <Widget>[
                              Icon(Icons.star, color: colorYellow, size: 12.0),
                              SizedBox(width: 0.5),
                              Text(vet.stars.toString() + ' (' + vet.attentions.toString() + ')', style: Get.textTheme.subtitle2)
                            ],
                          ),
                        ],
                      ),
                      Text(
                        vet.name,
                        style: Get.textTheme.subtitle2.apply(fontWeightDelta: 2),
                        maxLines: 1,
                      ),
                    ],
                  ),
                )
              ],
            ),
          )),
    ),
  );
}

Widget _swiperVets(imagen, bool url) {
  return CardSwiper(
    imagenes: imagen,
    urlBool: url,
    radius: 10.0,
    height: 175.0,
    scale: 0.9,
  );
}

import 'package:animate_do/animate_do.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:get/get.dart';
import 'package:proypet/icons/icon_proypet_icons.dart';
import 'package:proypet/src/app/styles/styles.dart';
import 'package:proypet/src/data/models/model/establecimiento/establecimiento_model.dart';

import 'swiper_vet.dart';

Widget buildVets(EstablecimientoModel vet) {
  return FadeIn(
    child: Container(
      margin: EdgeInsets.symmetric(vertical: 5.0, horizontal: 10.0),
      child: InkWell(
        borderRadius: borderRadius,
        onTap: () => Get.toNamed('vetdetalle', arguments: vet),
        child: Card(
          child: Row(
            children: [
              Container(
                height: 100,
                child: (vet.slides.length > 0)
                    ? _swiperVets(vet.slides, true)
                    : _swiperVets(["images/vet_prueba.jpg"], false),
              ),
              Expanded(
                child: Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Text(
                        vet.name,
                        style:
                            Get.textTheme.subtitle2.apply(fontWeightDelta: 2),
                        maxLines: 2,
                      ),
                      Row(
                        children: [
                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                Text(
                                  '${vet.distance}km de distancia',
                                  maxLines: 1,
                                  style: TextStyle(
                                      fontSize: sizeSmallx1,
                                      color: colorGray3,
                                      fontWeight: FontWeight.w400),
                                ),
                                Row(
                                  children: [
                                    RatingBarIndicator(
                                      rating: double.parse(vet.stars),
                                      itemBuilder: (context, index) => Icon(
                                        Icons.star,
                                        color: colorYellow,
                                      ),
                                      itemCount: 5,
                                      itemSize: 18,
                                      direction: Axis.horizontal,
                                    ),
                                    SizedBox(width: 2.5),
                                    Text(
                                      vet.stars == '0.0' ? '0' : vet.stars,
                                      style: Get.textTheme.subtitle2,
                                    )
                                  ],
                                ),
                                Row(
                                  children: [
                                    Icon(
                                      IconProypet.consulta,
                                      size: 12,
                                    ),
                                    SizedBox(width: 5),
                                    Text(
                                      '${vet.attentions} atenciones',
                                      style: TextStyle(fontSize: 12),
                                    )
                                  ],
                                ),
                              ],
                            ),
                          ),
                          CircleAvatar(
                            child: Padding(
                              padding: const EdgeInsets.all(1),
                              child: ClipRRect(
                                borderRadius:
                                    BorderRadius.all(Radius.circular(100)),
                                child: Image(
                                  image: CachedNetworkImageProvider(vet.logo),
                                  fit: BoxFit.cover,
                                ),
                              ),
                            ),
                            backgroundColor: colorGray1,
                            radius: 27,
                          ),
                        ],
                      ),
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
}

Widget _swiperVets(imagen, bool url) {
  return SwiperVet(
    imagenes: imagen,
    urlBool: url,
    radius: 10.0,
    scale: 0.9,
  );
}

import 'package:flutter/material.dart';
import 'package:proypet/src/app/views/components/card_swiper.dart';

Widget swiperVets(imagen, bool urlBool) {
  return CardSwiper(
    imagenes: imagen,
    urlBool: urlBool,
    height: 145.0,
  );
}

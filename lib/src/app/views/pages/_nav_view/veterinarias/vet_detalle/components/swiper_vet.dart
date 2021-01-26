import 'package:flutter/material.dart';
import 'package:proypet/src/app/components/card_swiper.dart';

Widget swiperVets(imagen, bool urlBool) {
  return CardSwiper(
    imagenes: imagen,
    urlBool: urlBool,
  );
}

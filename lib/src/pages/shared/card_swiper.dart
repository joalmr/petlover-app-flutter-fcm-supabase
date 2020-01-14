import 'package:flutter/material.dart';
import 'package:flutter_swiper/flutter_swiper.dart';

class CardSwiper extends StatelessWidget {
  final List<dynamic> imagenes;

  CardSwiper({@required this.imagenes});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 145.0,
      width: double.infinity,
      child: Swiper(
        itemBuilder: (BuildContext context, int index){
          return Image.asset(
            imagenes[index],
            fit: BoxFit.cover,
          );
        },
        itemCount: imagenes.length,
        pagination: new SwiperPagination(),
      ),
    );
  }

  getImagen(){

  }
}
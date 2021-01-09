import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_swiper/flutter_swiper.dart';
import 'package:proypet/src/app/styles/styles.dart';

class SwiperVet extends StatelessWidget {
  final dynamic imagenes;
  final bool urlBool;
  final double radius;
  final double scale;

  SwiperVet(
      {@required this.imagenes,
      @required this.urlBool,
      this.radius = 0.0,
      this.scale = 1.0});

  @override
  Widget build(BuildContext context) {
    return AspectRatio(
      aspectRatio: 9 / 10,
      child: Container(
        child: Swiper(
          itemBuilder: (BuildContext context, int index) {
            return ClipRRect(
                borderRadius: BorderRadius.circular(radius),
                child: Image(
                  image: urlBool
                      ? CachedNetworkImageProvider(imagenes[index])
                      : AssetImage(imagenes[index]),
                  fit: BoxFit.cover,
                ));
          },
          scale: scale,
          itemCount: imagenes.length,
          pagination: new SwiperPagination(
              builder: new DotSwiperPaginationBuilder(
            activeColor: colorMain,
          )),
        ),
      ),
    );
  }
}

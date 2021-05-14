import 'package:animate_do/animate_do.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_swiper/flutter_swiper.dart';
import 'package:get/get.dart';
import 'package:proypet/source/home/domain/controller/home_controller.dart';
import 'package:proypet/source/home/domain/controller/mascota_home_controller.dart';
import 'package:proypet/utils/calcula_edad.dart';

import 'stories.dart';

class Mascotas extends StatelessWidget {
  const Mascotas({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final _home = Get.find<HomeController>();

    return GetX<PetHomeController>(
      init: PetHomeController(),
      builder: (_) {
        return FadeIn(
          duration: Duration(milliseconds: 500),
          child: Container(
            child: Stack(
              children: <Widget>[
                AspectRatio(
                  aspectRatio: (Get.width < 600) ? 1.5 : 12 / 8,
                  child: Swiper(
                    physics: BouncingScrollPhysics(),
                    itemCount: _home.mascotas.length,
                    itemBuilder: (BuildContext context, int index) {
                      final mascota = _home.mascotas[index];
                      return ClipRRect(
                        borderRadius: BorderRadius.circular(15.0),
                        child: InkWell(
                          onTap: () => _.detalleMascota(mascota.id),
                          child: Stack(
                            children: <Widget>[
                              Container(
                                height: double.maxFinite,
                                width: double.maxFinite,
                                foregroundDecoration:BoxDecoration(
                                  color: Colors.black.withOpacity(0.15),
                                ),
                                child: Image(
                                  image: CachedNetworkImageProvider(mascota.picture),
                                  fit: BoxFit.cover,
                                ),
                              ),
                              Positioned(
                                top: 15.0,
                                left: 10.0,
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: <Widget>[
                                    Text(mascota.name,
                                      style: Get.textTheme.headline6
                                        .apply(
                                          color: Colors.white,
                                          fontWeightDelta:2,
                                        ),
                                    ),
                                    Text(mascota.breedName,
                                      style: Get.textTheme.subtitle2
                                          .apply(color: Colors.white),
                                    ),
                                  ],
                                ),
                              ),
                              Positioned(
                                bottom: 10.0,
                                left: 10.0,
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: <Widget>[
                                    RichText(
                                      text: TextSpan(
                                        children: [
                                          TextSpan(
                                            text: mascota.weight == '0'
                                                ? '-' : mascota.weight.toString(),
                                            style: Get.textTheme.headline4
                                                .apply(
                                                  color: Colors.white,
                                                  fontWeightDelta: 2,
                                                ),
                                          ),
                                          TextSpan(text: " kg.")
                                        ],
                                      ),
                                    ),
                                    Row(
                                      children: <Widget>[
                                        (mascota.status == 0)
                                            ? Icon(Icons.bookmark, color: Colors.white)
                                            : Icon(Icons.cake, color: Colors.white),
                                        SizedBox(width: 5.0),
                                        (mascota.status == 0)
                                            ? Text("Fallecido", style: TextStyle(color: Colors.white))
                                            : Text(
                                              calculateAge(DateTime.parse(mascota.birthdate)),
                                              style: Get.textTheme.subtitle2.apply(color: Colors.white),
                                            )
                                      ],
                                    ),
                                  ],
                                ),
                              ),
                              Positioned(
                                bottom: 10.0,
                                right: 10.0,
                                child: ClipRRect(
                                  child: CircleAvatar(
                                    backgroundColor: Colors.white,
                                    radius: 32.5,
                                    child: Padding(
                                        padding: EdgeInsets.all(0),
                                        child: StoriesPet(
                                          petImgId: mascota.picture,
                                          specieId: mascota.specieId,
                                        ),
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      );
                    },
                    viewportFraction: 0.79,
                    scale: 0.77,
                    loop: false,
                  ),
                ),
                Positioned(
                  top: 0.0,
                  right: 0.0,
                  child: FloatingActionButton(
                    onPressed: _.agregarMascota,
                    child: Icon(Icons.playlist_add),
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}


// _home.mascotas.length == 0
// ? FadeIn(
//     duration: Duration(milliseconds: 500),
//     child: Container(
//       height: 250.0,
//       width: double.infinity,
//       child: Column(
//         crossAxisAlignment: CrossAxisAlignment.center,
//         mainAxisAlignment: MainAxisAlignment.center,
//         children: <Widget>[
//           Text('Se parte de la comunidad responsable',
//             textAlign: TextAlign.center),
//           SizedBox(height: 10.0),
//           btnSecondary(
//             text: 'Agregar mascota',
//             onPressed: _.agregarMascota,
//             color: colorMain,
//           ),
//         ],
//       ),
//     ),
//   )
// : 
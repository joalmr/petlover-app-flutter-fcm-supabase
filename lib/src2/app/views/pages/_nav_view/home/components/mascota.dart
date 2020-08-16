import 'package:animate_do/animate_do.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_swiper/flutter_swiper.dart';
import 'package:get/get.dart';
import 'package:proypet/src2/app/styles/styles.dart';
import 'package:proypet/src2/app/views/components/form_control/button_primary.dart';
import 'package:proypet/src2/controllers/home_controller/home_controller.dart';
import 'package:proypet/src2/controllers/home_controller/mascota_home_controller.dart';
import 'package:proypet/src2/utils/calcula_edad.dart';

class Mascotas extends StatelessWidget {
  const Mascotas({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final _home = Get.find<HomeController>();
    return GetX<PetHomeController>(
        init: PetHomeController(),
        builder: (_) {
          return _home.loading.value
              ? Container(
                  height: 250.0,
                  width: double.infinity,
                  child: Center(
                    child: CircularProgressIndicator(),
                  ),
                )
              : _home.sinMascotas
                  ? FadeIn(
                      // delay: Duration(milliseconds: 500),
                      duration: Duration(milliseconds: 500),
                      child: Container(
                        height: 250.0,
                        width: double.infinity,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            Text('Se parte de la comunidad responsable', textAlign: TextAlign.center),
                            SizedBox(height: 10.0),
                            buttonOutLine('Agregar mascota', _.agregarMascota, colorMain),
                          ],
                        ),
                      ),
                    )
                  : FadeIn(
                      delay: Duration(milliseconds: 500),
                      duration: Duration(milliseconds: 500),
                      child: Container(
                        height: 250.0,
                        width: double.infinity,
                        child: Stack(
                          children: <Widget>[
                            Swiper(
                              physics: BouncingScrollPhysics(),
                              itemCount: _home.mascotas.length, //mascotaList.length,
                              itemBuilder: (BuildContext context, int index) {
                                final mascota = _home.mascotas[index];
                                // return Observer(builder: (_) {
                                return ClipRRect(
                                  borderRadius: BorderRadius.circular(15.0),
                                  child: Stack(
                                    children: <Widget>[
                                      Container(
                                        height: 250.0,
                                        width: double.infinity,
                                        foregroundDecoration: BoxDecoration(
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
                                            Text(mascota.name, style: Theme.of(context).textTheme.headline6.apply(color: Colors.white, fontWeightDelta: 2)),
                                            Text(mascota.breedName, style: Theme.of(context).textTheme.subtitle2.apply(color: Colors.white)),
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
                                                    text: mascota.weight.toString(),
                                                    style: Theme.of(context).textTheme.headline4.apply(color: Colors.white, fontWeightDelta: 2),
                                                  ),
                                                  TextSpan(text: " kg.")
                                                ],
                                              ),
                                            ),
                                            Row(
                                              children: <Widget>[
                                                (mascota.status == 0) ? Icon(Icons.bookmark, color: Colors.white) : Icon(Icons.cake, color: Colors.white),
                                                SizedBox(width: 5.0),
                                                (mascota.status == 0)
                                                    ? Text(
                                                        "Fallecido",
                                                        style: TextStyle(
                                                          color: Colors.white,
                                                        ),
                                                      )
                                                    : Text(
                                                        calculateAge(DateTime.parse(mascota.birthdate)),
                                                        style: Theme.of(context).textTheme.subtitle2.apply(color: Colors.white),
                                                      )
                                              ],
                                            ),
                                          ],
                                        ),
                                      ),
                                      Positioned(
                                        bottom: 10.0,
                                        right: 10.0,
                                        child: buttonOutLine('Ver más', () => _.detalleMascota(mascota.id), colorGray1),
                                      ),
                                    ],
                                  ),
                                );
                                // });
                              },
                              viewportFraction: 0.79,
                              scale: 0.77,
                              loop: false,
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
        });
  }
}

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_swiper/flutter_swiper.dart';
import 'package:provider/provider.dart';
import 'package:proypet/src/provider/home_store.dart';
import 'package:proypet/src/styles/styles.dart';
import 'package:proypet/src/utils/calcula_edad.dart';
import 'package:proypet/src/views/components/form_control/button_primary.dart';

class Mascotas extends StatefulWidget {
  // const Mascotas({Key key}) : super(key: key);
  @override
  _MascotasState createState() => _MascotasState();
}

class _MascotasState extends State<Mascotas> {
  HomeStore homeStore;

  @override
  void dispose() {
    super.dispose();
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    homeStore ??= Provider.of<HomeStore>(context);
  }

  _agregarMascota() => homeStore.agregarMascota(context);
  _detalleMascota(id) => homeStore.detalleMascota(context, id);

  @override
  Widget build(BuildContext context) {
    return Observer(
      builder: (_) => homeStore.sinMascotas
          ? Container(
              height: 250.0,
              width: double.infinity,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Text(
                    'Se parte de la comunidad responsable',
                    textAlign: TextAlign.center,
                  ),
                  SizedBox(height: 10.0),
                  buttonOutLine('Agregar mascota', _agregarMascota, colorMain),
                ],
              ),
            )
          : Container(
              height: 250.0,
              width: double.infinity,
              child: Stack(
                children: <Widget>[
                  Swiper(
                    physics: BouncingScrollPhysics(),
                    itemCount: homeStore.mascotas.length, //mascotaList.length,
                    itemBuilder: (BuildContext context, int index) {
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
                                image: CachedNetworkImageProvider(
                                    homeStore.mascotas[index].picture),
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
                                  Text(homeStore.mascotas[index].name,
                                      style: Theme.of(context)
                                          .textTheme
                                          .headline6
                                          .apply(
                                              color: Colors.white,
                                              fontWeightDelta: 2)),
                                  Text(homeStore.mascotas[index].breedName,
                                      style: Theme.of(context)
                                          .textTheme
                                          .subtitle2
                                          .apply(color: Colors.white)),
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
                                          text: homeStore.mascotas[index].weight
                                              .toString(),
                                          style: Theme.of(context)
                                              .textTheme
                                              .headline4
                                              .apply(
                                                  color: Colors.white,
                                                  fontWeightDelta: 2),
                                        ),
                                        TextSpan(text: " kg.")
                                      ],
                                    ),
                                  ),
                                  Row(
                                    children: <Widget>[
                                      (homeStore.mascotas[index].status == 0)
                                          ? Icon(Icons.bookmark,
                                              color: Colors.white)
                                          : Icon(Icons.cake,
                                              color: Colors.white),
                                      SizedBox(width: 5.0),
                                      (homeStore.mascotas[index].status == 0)
                                          ? Text(
                                              "Fallecido",
                                              style: TextStyle(
                                                color: Colors.white,
                                              ),
                                            )
                                          : Text(
                                              calculateAge(DateTime.parse(
                                                  homeStore.mascotas[index]
                                                      .birthdate)),
                                              style: Theme.of(context)
                                                  .textTheme
                                                  .subtitle2
                                                  .apply(color: Colors.white),
                                            )
                                    ],
                                  ),
                                ],
                              ),
                            ),
                            Positioned(
                              bottom: 10.0,
                              right: 10.0,
                              child: buttonOutLine(
                                  'Ver más',
                                  () => _detalleMascota(
                                      homeStore.mascotas[index].id),
                                  colorGray1),
                            ),
                          ],
                        ),
                      );
                    },
                    viewportFraction: 0.79,
                    scale: 0.77,
                    loop: false,
                  ),
                  Positioned(
                    top: 0.0,
                    right: 0.0,
                    child: FloatingActionButton(
                      onPressed: _agregarMascota,
                      child: Icon(Icons.playlist_add),
                    ),
                  ),
                ],
              ),
            ),
    );
  }
}

import 'package:animate_do/animate_do.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:proypet/design/styles/styles.dart';
import 'package:proypet/source/veterinarias/domain/controller/lista_vets_controller.dart';
import '../components/swiper_vet.dart';
import '../tabs_detalle/general_tab/components/servicios.dart';

class FavoriteDetalleVet extends StatelessWidget {

// _.cargando.value
// ? Scaffold(body: Center(child: lottieLoading))
// :
  @override
  Widget build(BuildContext context) {
    return GetX<VeterinariasController>(
      builder: (_){
        return Scaffold(
            appBar: AppBar(
              elevation: 0,
              toolbarHeight: context.height * 0.245,
              automaticallyImplyLeading: false,
              flexibleSpace: FadeIn(
                duration: Duration(milliseconds: 500),
                child: Stack(
                  children: <Widget>[
                    Container(
                      height: double.maxFinite,
                      width: double.maxFinite,
                      child: (_.vet.slides.length > 0)
                          ? swiperVets(_.vet.slides, true)
                          : swiperVets(["images/vet_prueba.jpg"], false),
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
                          image: DecorationImage(
                            image: CachedNetworkImageProvider(_.vet.logo),
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            floatingActionButton: FloatingActionButton(
              child: Icon(Icons.playlist_add),
              onPressed: (){
                Get.toNamed('vet', arguments: _.vet.id);
              },
            ),
            body: FadeIn(
                duration: Duration(milliseconds: 500),
                child: Column(
                  children: <Widget>[
                    Container(
                      padding: EdgeInsets.only(bottom: 60.0),
                      child: Column(
                        children: [
                          Padding(
                            padding: EdgeInsets.symmetric(horizontal: 0.0),
                            child: Container(
                              width: MediaQuery.of(context).size.width - 0.0,
                              child: ListTile(
                                title: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: <Widget>[
                                    Row(
                                      children: [
                                        Container(
                                          margin: EdgeInsets.zero,
                                          decoration: BoxDecoration(
                                            borderRadius: borderRadius,
                                            color: _.vet.typeId == 1 ? colorMain : colorBlue,
                                          ),
                                          padding: EdgeInsets.symmetric(
                                            vertical: 1.5,
                                            horizontal: 5,
                                          ),
                                          child: Text(
                                            _.vet.type,
                                            style: TextStyle(
                                                fontWeight: FontWeight.bold,
                                                fontSize: 8,
                                                color: Colors.white),
                                          ),
                                        ),
                                        SizedBox(width: 5),
                                        Text(
                                          '${_.vet.distance}km de distancia',
                                          style: TextStyle(fontSize: font10),
                                        ),
                                      ],
                                    ),
                                    Text(_.vet.name,
                                        maxLines: 2,
                                        style: Get.textTheme.subtitle1
                                            .apply(fontWeightDelta: 2)),
                                  ],
                                ),
                                subtitle: Text('${_.vet.address} ',
                                  style: TextStyle(fontSize: font12),
                                ),
                                trailing: Stack(
                                  children: <Widget>[
                                    Container(height: 56.0, width: 60.0),
                                    Container(
                                      height: 50.0,
                                      width: 50.0,
                                      padding: EdgeInsets.symmetric(horizontal: 5.0),
                                      decoration: BoxDecoration(
                                          borderRadius: BorderRadius.circular(100.0),
                                          color: colorYellow),
                                      child: Center(
                                        child: Row(
                                          mainAxisAlignment: MainAxisAlignment.center,
                                          children: <Widget>[
                                            Icon(Icons.star, color: Colors.white, size: 12.0),
                                            Text(
                                              _.vet.stars.toString(),
                                              style: TextStyle(
                                                fontSize: 14.0,
                                                fontWeight: FontWeight.bold,
                                                color: Colors.white,
                                              ),
                                            )
                                          ],
                                        ),
                                      ),
                                    ),
                                    Positioned(
                                      bottom: 0.0,
                                      right: 0.0,
                                      child: Tooltip(
                                        message: 'Atenciones',
                                        child: Container(
                                          height: 25.0,
                                          width: 25.0,
                                          decoration: BoxDecoration(
                                            borderRadius: BorderRadius.circular(20.0),
                                            color: colorMain,
                                            // color: _.vet.typeId == 1 ? colorMain : colorBlue,
                                          ),
                                          child: Center(
                                            child: Text(
                                              _.vet.attentions.toString(),
                                              style: TextStyle(
                                                  fontSize: 10, color: Colors.white),
                                            ),
                                          ),
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ),
                          SizedBox(height: 10.0),
                          Container(
                            width: double.infinity,
                            padding: EdgeInsets.only(left: 20.0, right: 20.0, bottom: 5.0),
                            child: Text("Servicios",
                                style: Get.textTheme.subtitle2.apply(fontWeightDelta: 2)),
                          ),
                          Container(
                            padding: EdgeInsets.symmetric(horizontal: 10.0),
                            child: servicios(_.vet.services),
                          ),
                          Container(
                            padding: EdgeInsets.only(left: 20.0, right: 20.0, top: 10.0, bottom: 10.0),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: <Widget>[
                                Text('Descripción',
                                    style: Get.textTheme.subtitle2.apply(fontWeightDelta: 2)),
                                SizedBox(height: 5.0),
                                Text(
                                  _.vet.description,
                                  textAlign: TextAlign.justify,
                                ),
                                SizedBox(width: double.infinity),
                              ],
                            ),
                          ),
                        ],
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
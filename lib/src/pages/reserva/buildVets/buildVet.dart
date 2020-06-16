import 'package:animate_do/animate_do.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:proypet/src/model/establecimiento/establecimiento_model.dart';
import 'package:proypet/src/pages/reserva/vet_detalle_page.dart';
import 'package:proypet/src/shared/card_swiper.dart';
import 'package:proypet/src/styles/styles.dart';

  Widget buildVets(BuildContext context, EstablecimientoModel vetLocales){
    var vet = vetLocales;

      return FadeIn(
        child: Container(
          margin: EdgeInsets.symmetric(vertical: 10.0,horizontal: 20.0),
          child: InkWell(
            onTap: ()=>Navigator.push(context, MaterialPageRoute(
              builder: (_)=>VetDetallePage(vet: vet,),
            )),
            child: Card(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Stack(
                    children: <Widget>[
                      (vet.slides.length>0) ? _swiperVets(vet.slides, true) : _swiperVets(["images/vet_prueba.jpg"], false),
                      Positioned(//logo
                        bottom: 5.0,
                        right: 5.0,
                        child: Container(
                          padding: EdgeInsets.all(8.0),
                          child: CircleAvatar(
                            backgroundColor: colorGray1.withOpacity(0.25) ,//Colors.grey.withOpacity(0.24),
                            backgroundImage: CachedNetworkImageProvider(vet.logo),
                            radius: 25.0,
                          ),
                        ),
                      ),
                    ],
                  ),
                  Container(
                    padding: EdgeInsets.symmetric(horizontal: 5.0,vertical: 5.0),
                    // color: Colors.white,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: <Widget>[
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: <Widget>[
                            Text('${vet.distance}km de distancia',maxLines: 1,style: TextStyle(fontSize: sizeSmall,color: colorGray3,fontWeight: FontWeight.w400),),
                            Row(
                              children: <Widget>[
                                Icon(Icons.star, color: colorYellow, size: 12.0),
                                SizedBox(width: 0.5),
                                Text(vet.stars.toString() + ' ('+vet.attentions.toString()+')',style: Theme.of(context).textTheme.subtitle2 )
                              ],
                            ),
                          ],
                        ),
                        Text(vet.name ,style: 
                          Theme.of(context).textTheme.subtitle2.apply(fontWeightDelta: 2),
                          maxLines: 1,
                        ),
                      ],
                    ),
                  )
                ],
              ),
            )
            // Material(
            //   color: Theme.of(context).backgroundColor,
            //   shape: shape10,
            //   child: ,
            // ),
          ),
        ),
      );
    
  }

  Widget _swiperVets(imagen, bool url){
    return CardSwiper(imagenes : imagen,urlBool: url,radius: 10.0,height: 175.0,scale: 0.9,);    
  }
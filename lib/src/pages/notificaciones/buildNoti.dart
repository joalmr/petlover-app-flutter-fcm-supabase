import 'package:animate_do/animate_do.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:proypet/src/model/notificacion/notificacion_model.dart';
import 'package:proypet/src/shared/card_swiper.dart';
import 'package:proypet/src/styles/styles.dart';

  Widget buildNoti(Notificacion noti){

      return Container(
          margin: EdgeInsets.symmetric(vertical: 10.0,horizontal: 20.0),
          child: InkWell(
            onTap: (){},
            child: Card(
              child:
              Column(
                children: <Widget>[
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      ClipRRect(
                        borderRadius: BorderRadius.only(topLeft: Radius.circular(10)),
                        child: Image(
                          image: CachedNetworkImageProvider(noti.petPicture),
                          height: 100,
                          fit: BoxFit.cover,
                        ),
                      ),
                      Expanded(
                        child: Padding(
                          padding: const EdgeInsets.all(10.0),
                          child: Text(noti.message),
                        )
                      )
                    ],
                  ),
                  Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: ClipRRect(
                      borderRadius: BorderRadius.all(Radius.circular(10)),
                      child: Image(
                        image: CachedNetworkImageProvider(noti.petPicture),
                        height: 130,
                        width: double.infinity,
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                ],
              ),
            )
          ),
        );
    
  }

  // Widget _swiperVets(imagen, bool url){
  //   return CardSwiper(imagenes : imagen,urlBool: url,radius: 10.0,height: 175.0,scale: 0.9,);    
  // }
  
import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:proypet/src/model/establecimiento/establecimiento_model.dart';
import 'package:proypet/src/pages/reserva/reserva_detalle_page.dart';
import 'package:proypet/src/pages/shared/card_swiper.dart';
import 'package:proypet/src/pages/shared/styles/styles.dart';

  Widget buildVets(BuildContext context, int index, List<EstablecimientoModel> vetLocales){
    var vet = vetLocales[index % vetLocales.length];

      return FadeIn(
        child: Container(
          margin: EdgeInsets.symmetric(vertical: 10.0,horizontal: 20.0),
          child: InkWell(
            onTap: ()=>Navigator.push(context, MaterialPageRoute(
              builder: (_)=>ReservaDetallePage(vet: vet),
            )),
            child: Material(
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
                            backgroundColor: Colors.transparent,
                            backgroundImage: NetworkImage(vet.logo),
                            radius: 25.0,
                          ),
                        ),
                      ),
                    ],
                  ),
                  Container(
                    padding: EdgeInsets.symmetric(horizontal: 5.0,vertical: 5.0),
                    color: Colors.white.withOpacity(0.4),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: <Widget>[
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: <Widget>[
                            Text('${vet.distance}km de distancia',maxLines: 1,style: TextStyle(fontSize: 12.0,color: Colors.grey[400],fontWeight: FontWeight.w400),),
                            Row(
                              children: <Widget>[
                                Icon(Icons.star, color: colorMain, size: 12.0),
                                SizedBox(width: 0.5),
                                Text(vet.stars.toString() + ' ('+vet.votes.toString()+')',style: TextStyle(fontSize: 12.0,color: Colors.grey[600],fontWeight: FontWeight.w400))
                              ],
                            ),
                          ],
                        ),
                        Text(vet.name ,style: TextStyle(
                            fontSize: 18.0,
                            color: Colors.grey[700],
                            fontWeight: FontWeight.w400
                          ),
                          maxLines: 1,
                        ),
                      ],
                    ),
                  )
                ],
              ),
            ),
          ),
        ),
      );
    
  }

  Widget _swiperVets(imagen, bool url){
    return CardSwiper(imagenes : imagen,urlBool: url,radius: 10.0,height: 175.0,scale: 0.9,);    
  }
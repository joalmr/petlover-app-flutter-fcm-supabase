import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:proypet/src/model/vet_model.dart';
import 'package:proypet/src/pages/reserva/reserva_detalle_page.dart';
import 'package:proypet/src/pages/shared/card_swiper.dart';
import 'package:proypet/src/pages/shared/form_control/text_field_button.dart';
import 'package:proypet/src/pages/shared/styles/styles.dart';

class ReservaListaPage extends StatefulWidget {
  // final establecimientos;
  // ReservaListaPage({@required this.establecimientos});
  @override
  _ReservaListaPageState createState() => _ReservaListaPageState();
}

class _ReservaListaPageState extends State<ReservaListaPage> {
  // final vetLocales;
  // _ReservaListaPageState({@required this.vetLocales});
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: <Widget>[
        CustomScrollView(
          slivers: <Widget>[
            SliverToBoxAdapter(
              child: Column(
                children: <Widget>[
                  SizedBox(height: 20.0,),
                  //FormControl().textfieldBtn('Ingrese veterinaria..',Icon(Icons.search),(){}),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 22.0,vertical: 8.0),
                    child: textfieldBtn('Ingrese veterinaria..',Icon(Icons.search),(){}),
                  )
                ],
              ),
            ),
            SliverList(
              delegate: SliverChildBuilderDelegate(
                (BuildContext context, int index){
                  return _buildVets(context,index);
                },
                childCount: vetLocales.length
              ),
            ),
            SliverToBoxAdapter(
              child: SizedBox(height: 50.0),
            ),
          ],
        ),
      ],
    );
  }

  Widget _buildVets(BuildContext context, int index){
    var vet = vetLocales[index % vetLocales.length];
    return Container(
      margin: EdgeInsets.symmetric(vertical: 15.0,horizontal: 20.0),
      child: InkWell(
        onTap: ()=>Navigator.push(context, MaterialPageRoute(
          builder: (_)=>ReservaDetallePage(idvet: index),
        )),
        child: Material(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Stack(
                children: <Widget>[
                  _swiperVets(vet.imagen),
                  Positioned(//logo
                    bottom: 5.0,
                    right: 5.0,
                    child: Container(
                      padding: EdgeInsets.all(8.0),
                      child: CircleAvatar(
                        backgroundColor: Colors.transparent,
                        backgroundImage: CachedNetworkImageProvider(vet.logo),
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
                        Text(vet.distancia+' de distancia',maxLines: 1,style: TextStyle(fontSize: 12.0,color: Colors.grey[400],fontWeight: FontWeight.w400),),
                        Row(
                          //crossAxisAlignment: CrossAxisAlignment.end,
                          children: <Widget>[
                            Icon(Icons.star, color: colorMain, size: 12.0),
                            SizedBox(width: 0.5),
                            Text(vet.estrellas+' ('+vet.votantes+')',style: TextStyle(fontSize: 12.0,color: Colors.grey[600],fontWeight: FontWeight.w400))
                          ],
                        ),
                      ],
                    ),
                    Text(vet.nombre,style: TextStyle(
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
    );
  }

  Widget _swiperVets(imagen){
    return CardSwiper(imagenes : imagen,radius: 10.0,height1: 175.0);    
  }
}
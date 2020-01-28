import 'package:flutter/material.dart';
import 'package:proypet/src/pages/model/vet_model.dart';
import 'package:proypet/src/pages/reserva_detalle_page.dart';
import 'package:proypet/src/pages/shared/card_swiper.dart';
import 'package:proypet/src/pages/shared/filtros_mapa.dart';
import 'package:proypet/src/pages/shared/form_control.dart';
import '../../main.dart';

class ReservaPage extends StatelessWidget {
  final GlobalKey<ScaffoldState> _key = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _key,
      endDrawer: FiltrosMapa(),
      appBar: AppBar(
        backgroundColor: colorMain,
        title: Text('Establecimientos',
          style: TextStyle(
            fontSize: 16.0,
            fontWeight: FontWeight.normal
          ),
        ),
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.filter_list),
            onPressed: (){ _key.currentState.openEndDrawer(); },
          )
        ],
        elevation: 0,
      ),
      body: Stack(
        children: <Widget>[
          // Container(
          //   width: double.infinity,
          //   height: double.infinity,
          // ),
          // Positioned(
          //   top: -350.0,
          //   left: -120.0,
          //   child: Transform.rotate(
          //     angle: 15,
          //     child: Container(
          //       height: 500.0,
          //       width: 800.0,
          //       decoration: BoxDecoration(
          //         borderRadius: BorderRadius.circular(1200.0),
          //         color: colorMain,
          //       ),
          //     ),
          //   ),
          // ),
          CustomScrollView(
            slivers: <Widget>[
              SliverToBoxAdapter(
                child: Column(
                  children: <Widget>[
                    SizedBox(height: 20.0,),
                    FormControl().textfieldBtn('Ingrese veterinaria..',Icon(Icons.search),(){})
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
                child: SizedBox(height: 20.0),
              ),
            ],
          ),
          // Positioned(
          //   top: 0,
          //   left: 0,
          //   right: 0,
          //   child: AppBar(
          //     backgroundColor: colorMain.withOpacity(0.7),
          //     elevation: 0,
          //     centerTitle: true,
          //     title: Text("",style: TextStyle(
          //       fontSize: 16.0,
          //       fontWeight: FontWeight.normal
          //     ),),
          //     actions: <Widget>[
          //       IconButton(
          //         icon: Icon(Icons.filter_list),
          //         onPressed: (){ _key.currentState.openEndDrawer(); },
          //       )
          //     ],
          //   ),
          // ),
        ],
      ),
    );
  }

  Widget _buildVets(BuildContext context, int index){
    var vet = vetLocales[index % vetLocales.length];
    return Container(
      margin: EdgeInsets.symmetric(vertical: 15.0,horizontal: 20.0),
      child: InkWell(
        onTap: ()=>Navigator.push(context, MaterialPageRoute(
          builder: (_)=>ReservaDetallePage(),
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
                      //color: Colors.white,
                      decoration: BoxDecoration(
                        color: Colors.white.withOpacity(0.4),
                        borderRadius: BorderRadius.circular(50.0),
                      ),
                      child: CircleAvatar(
                        backgroundColor: Colors.transparent,
                        backgroundImage: NetworkImage(vet.logo),
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
    return CardSwiper(imagenes : imagen,autoplay1: false,radius: 5.0,height1: 175.0);    
  }
}
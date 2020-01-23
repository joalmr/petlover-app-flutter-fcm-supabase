import 'package:flutter/material.dart';
import 'package:proypet/src/pages/model/vet_model.dart';
import 'package:proypet/src/pages/reserva_detalle_page.dart';
import 'package:proypet/src/pages/reserva_mapa_page.dart';
import 'package:proypet/src/pages/shared/appbar_menu.dart';
import 'package:proypet/src/pages/shared/card_swiper.dart';
import 'package:proypet/src/pages/shared/form_control.dart';

import '../../main.dart';

// final List vets = [
//   {
//     'image':['images/vet_prueba.jpg','images/imagesvet.jpg'],
//     'title':'Pirulino pirulin, pirulin pimpom, la unica camisa y el unico pantalon',
//     'logo':'https://beta.proypet.com/Uploads/Imagenes/Logo/LOGO_2095.PNG'
//   },
//   {
//     'image':['images/imagesvet.jpg','images/vet_prueba.jpg'],
//     'title':'Vet prueba 2',
//     'logo':'https://beta.proypet.com/Uploads/Imagenes/Logo/LOGO_2095.PNG'
//   },
//   {
//     'image':['images/vet_prueba.jpg','images/imagesvet.jpg'],
//     'title':'Vet prueba 3',
//     'logo':'https://beta.proypet.com/Uploads/Imagenes/Logo/LOGO_2095.PNG'
//   },
// ];

//final _shape = BorderRadius.circular(100.0);

class ReservaPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: colorMain,
        leading: leadingH,
        title: titleH,
        actions: actionsH,
        elevation: 0,
      ),
      body: CustomScrollView(
        slivers: <Widget>[
          SliverToBoxAdapter(
            child: Column(
              children: <Widget>[
                SizedBox(height: 10.0,),
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
            child: SizedBox(height: 50.0),
          ),
        ],
      ),
      //bottomNavigationBar: NavigationBar(),
      floatingActionButton: FloatingActionButton(
        onPressed: ()=>Navigator.push(context, MaterialPageRoute(
          builder: (_)=>ReservaMapaPage(),
        )),
        child: Icon(Icons.location_on),
        backgroundColor: colorMain,
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.endFloat
    );
  }

  Widget _buildVets(BuildContext context, int index){
    var vet = vetLocales[index % vetLocales.length];
    return Container(
      margin: EdgeInsets.symmetric(vertical: 9.5,horizontal: 20.0),
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
                        color: Colors.white,
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

// Positioned(
//   top: -100.0,
//   right: -70.0,
//   height: 132.0,
//   width: 150.0,
//   child: Container(
//     decoration: BoxDecoration(
//       color: Colors.white.withOpacity(0.7),
//       borderRadius: BorderRadius.circular(100.0),
//     ),
//     child: Stack(
//       children: <Widget>[
//         Positioned(
//           bottom: 10.0,
//           left: 32.0,
//           child: Row(
//             crossAxisAlignment: CrossAxisAlignment.end,
//             children: <Widget>[
//               Icon(Icons.star, color: colorMain, size: 14.0),
//               SizedBox(width: 2.5),
//               Text('4.3',style: TextStyle(fontSize: 14.0,color: colorMain,fontWeight: FontWeight.bold))
//             ],
//           ),
//         ),
//       ],
//     ),
//   ),
// )
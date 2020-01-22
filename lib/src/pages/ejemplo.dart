// import 'package:flutter/material.dart';
// import 'package:proypet/src/pages/reserva_modal.dart';
// import 'package:proypet/src/pages/shared/card_swiper.dart';
// import 'package:proypet/src/pages/shared/modal_bottom.dart';
// import 'package:proypet/src/pages/shared/form_control.dart';
// import '../../main.dart';

// class ReservaDetallePage extends StatelessWidget {
//   //final String image = "images/vet_prueba.jpg";
//   final List vets = ['images/vet_prueba.jpg','images/imagesvet.jpg'];
//   @override
//   Widget build(BuildContext context) {
//     Modal modal = new Modal();
//     return Scaffold(
//       body: Stack(
//         children: <Widget>[
//             SingleChildScrollView(
//               //padding: const EdgeInsets.only(top: 0.0,bottom: 0.0),
//               child: Column(                
//                 crossAxisAlignment: CrossAxisAlignment.start,
//                 children: <Widget>[
//                   Container(
//                     height: 265,
//                     width: double.infinity,
//                     child: _swiperVets(vets)
//                   ),
//                   const SizedBox(height: 5),
//                   Padding(
//                     padding: const EdgeInsets.symmetric(horizontal: 22.0),
//                     child: Text('Veterinaria'.toUpperCase(),
//                       style: TextStyle(
//                         color: Colors.grey,
//                         fontSize: 10.0,
//                         fontWeight: FontWeight.bold,
                        
//                       ),
//                     ),
//                   ),
//                   Padding(
//                     padding: const EdgeInsets.symmetric(horizontal:22.0),
//                     child: Text(
//                       "Vet Prueba",
//                       style: TextStyle( fontSize: 26.0, fontWeight: FontWeight.bold),
//                     ),
//                   ),
//                   Container(
//                     padding: const EdgeInsets.symmetric(vertical: 0.0, horizontal: 22.0),
//                     //color: Colors.white,
//                     child: Column(
//                       crossAxisAlignment: CrossAxisAlignment.start,
//                       mainAxisSize: MainAxisSize.min,
//                       children: <Widget>[
//                         Row(
//                           children: <Widget>[
//                             Expanded(//estrellas
//                               child: Column(
//                                 crossAxisAlignment: CrossAxisAlignment.start,
//                                 children: <Widget>[
//                                   Row(//estrellas
//                                     children: <Widget>[
//                                       IconButton(
//                                         icon: Icon(Icons.star),
//                                         color: colorMain,
//                                         onPressed: ()=>Navigator.pushNamed(context,'ejemplo'),
//                                       ),
//                                       Icon(
//                                         Icons.star,
//                                         color: colorMain,
//                                       ),
//                                       Icon(
//                                         Icons.star,
//                                         color: colorMain,
//                                       ),
//                                       Icon(
//                                         Icons.star,
//                                         color: colorMain,
//                                       ),
//                                       Icon(
//                                         Icons.star_border,
//                                         color: colorMain,
//                                       ),
//                                     ],
//                                   ),
//                                   Text.rich(TextSpan(children: [
//                                     WidgetSpan(
//                                       child: Icon(Icons.location_on, size: 16.0, color: Colors.grey,)
//                                     ),
//                                     TextSpan(
//                                       text: "1 km de distancia"
//                                     ),
//                                   ]), style: TextStyle(color: Colors.grey, fontSize: 12.0),)
//                                 ],
//                               ),
//                             ),
//                             Column(
//                               children: <Widget>[//logo
//                                 CircleAvatar(
//                                   radius: 25.0,
//                                   // child: Padding(
//                                   //   padding: const EdgeInsets.all(7.0),
//                                   //   child: Image(
//                                   //     image: NetworkImage('https://beta.proypet.com/Uploads/Imagenes/Logo/LOGO_2095.PNG'),
//                                   //   ),
//                                   // ),
//                                   backgroundColor: Colors.grey[200],
//                                   backgroundImage: NetworkImage('https://beta.proypet.com/Uploads/Imagenes/Logo/LOGO_2095.PNG'),
//                                 ),
//                               ],
//                             )
//                           ],
//                         ),
//                         const SizedBox(height: 25.0),
//                         //scroll horizontal
//                         SingleChildScrollView(
//                           scrollDirection: Axis.horizontal,
//                           child: _servicios(),
//                         ),
//                         SizedBox(height: 25.0),
//                         Text("Descripción".toUpperCase(), style: TextStyle(
//                           fontWeight: FontWeight.w600,
//                           fontSize: 14.0
//                         ),),
//                         const SizedBox(height: 10.0),
//                         Text(
//                             "Lorem ipsum dolor sit, amet consectetur adipisicing elit. Ratione architecto autem quasi nisi iusto eius ex dolorum velit! Atque, veniam! Atque incidunt laudantium eveniet sint quod harum facere numquam molestias?", textAlign: TextAlign.justify, style: TextStyle(
//                               fontWeight: FontWeight.w300,
//                               fontSize: 14.0
//                             ),),
//                         const SizedBox(height: 10.0),
//                         Text(
//                             "Lorem ipsum dolor sit, amet consectetur adipisicing elit. Ratione architecto autem quasi nisi iusto eius ex dolorum velit! Atque, veniam! Atque incidunt laudantium eveniet sint quod harum facere numquam molestias?", textAlign: TextAlign.justify, style: TextStyle(
//                               fontWeight: FontWeight.w300,
//                               fontSize: 14.0
//                             ),),
//                         const SizedBox(height: 10.0),
//                         Text(
//                             "Lorem ipsum dolor sit, amet consectetur adipisicing elit. Ratione architecto autem quasi nisi iusto eius ex dolorum velit! Atque, veniam! Atque incidunt laudantium eveniet sint quod harum facere numquam molestias?", textAlign: TextAlign.justify, style: TextStyle(
//                               fontWeight: FontWeight.w300,
//                               fontSize: 14.0
//                             ),),
//                         const SizedBox(height: 10.0),
//                         Text(
//                             "Lorem ipsum dolor sit, amet consectetur adipisicing elit. Ratione architecto autem quasi nisi iusto eius ex dolorum velit! Atque, veniam! Atque incidunt laudantium eveniet sint quod harum facere numquam molestias?", textAlign: TextAlign.justify, style: TextStyle(
//                               fontWeight: FontWeight.w300,
//                               fontSize: 14.0
//                             ),),
//                       ],
//                     ),
//                   ),
//                 ],
//               ),
//             ),
//             Positioned(
//             top: 0,
//             left: 0,
//             right: 0,
//             child: AppBar(
//               backgroundColor: Colors.transparent,
//               elevation: 0,
//               centerTitle: true,
//               title: Text("",style: TextStyle(
//                 fontSize: 16.0,
//                 fontWeight: FontWeight.normal
//               ),),
//             ),
//           ),
//         ],
//       ),
//       bottomNavigationBar: BottomAppBar(
//         color: colorMain,
//         child: 
//         Padding(
//           padding: EdgeInsets.all(0.0),
//           child: Row(
//             children: <Widget>[
//               FlatButton(
//                 onPressed: ()=>modal.mainModal(context,ModalDataReserva()),
//                 child: Container(
//                   height: 70.0,
//                   width: MediaQuery.of(context).size.width-40.0,
//                   //padding: EdgeInsets.only(top: 0.0),
//                   child: Center(
//                     child: Row(
//                       mainAxisAlignment: MainAxisAlignment.center,
//                       children: <Widget>[
//                         Icon(Icons.arrow_forward_ios, color: Colors.white.withOpacity(0.3), size: 11.0),
//                         Icon(Icons.arrow_forward_ios, color: Colors.white.withOpacity(0.5), size: 12.0),
//                         Icon(Icons.arrow_forward_ios, color: Colors.white.withOpacity(0.7), size: 13.0),
//                         Icon(Icons.arrow_forward_ios, color: Colors.white.withOpacity(0.9), size: 14.0),
//                         Text('Reservar atención',style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold,fontSize: 15.0),),
//                       ],
//                     ),
//                   )
//                 ),
//               )
//               //FormControl().buttonSec('Reservar ahora', ()=>modal.mainModal(context,ModalDataReserva()) ),
//             ],
//           ),
//         ),
//       ),

//     );
//   }

//   Widget _servicios(){
//     return Row(
//       children: <Widget>[
//         _icoServicio('images/veterinaria2.png','Servicio 1'),
//         SizedBox(width: 10.0,),
//         _icoServicio('images/veterinaria2.png','Servicio 2'),
//         SizedBox(width: 10.0,),
//         _icoServicio('images/veterinaria2.png','Servicio 3'),
//         SizedBox(width: 10.0,),
//         _icoServicio('images/veterinaria2.png','Servicio 4'),
//         SizedBox(width: 10.0,),
//         _icoServicio('images/veterinaria2.png','Servicio 5'),
//         SizedBox(width: 10.0,),
//         _icoServicio('images/veterinaria2.png','Servicio 6'),
//         SizedBox(width: 10.0,),
//         _icoServicio('images/veterinaria2.png','Servicio 7'),
//         SizedBox(width: 10.0,),
//         _icoServicio('images/veterinaria2.png','Servicio 8'),
//         SizedBox(width: 10.0,),
//         _icoServicio('images/veterinaria2.png','Servicio 9'),
//         SizedBox(width: 10.0,),
//       ],
//     );
    
//   }

//   Widget _icoServicio(imagen,nombre){
//     return Column(
//       children: <Widget>[
//         Image(
//           image: AssetImage(imagen),
//           height: 30,
//           width: 30,
//         ),
//         Text(nombre,style: TextStyle(fontWeight: FontWeight.bold),)
//       ],
//     );
//   }

//   Widget _swiperVets(imagen){
//     return CardSwiper(imagenes : imagen,autoplay1: false,radius: 10.0);    
//   }
// }

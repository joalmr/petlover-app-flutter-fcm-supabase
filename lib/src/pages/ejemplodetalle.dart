


// import 'package:flutter/material.dart';
// import 'package:proypet/main.dart';
// import 'package:proypet/src/pages/reserva_detalle_page.dart';
// import 'package:proypet/src/pages/shared/card_swiper.dart';

// class DetailPage extends StatefulWidget {
//   @override
//   _DetailPageState createState() => _DetailPageState();
// }

// class _DetailPageState extends State<DetailPage> {
//   final List vets = ['images/vet_prueba.jpg','images/imagesvet.jpg'];
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
      
//       body: Stack(
//         children: [
//           Container(
//             height: MediaQuery.of(context).size.height,
//             color: colorMain,
//           ),
//           Positioned(
//             bottom: 0.0,
//             height: 100.0,
//             child: FlatButton(
//               onPressed: ()=>Navigator.push(
//                 context,MaterialPageRoute(
//                   builder: (context) => ReservaDetallePage()
//               )),
//               child: Container(
//                 width: MediaQuery.of(context).size.width,
//                 padding: EdgeInsets.only(top: 35.0),
//                 child: Center(
//                   child: Row(
//                     mainAxisAlignment: MainAxisAlignment.center,
//                     crossAxisAlignment: CrossAxisAlignment.center,
//                     children: <Widget>[
//                       Icon(Icons.arrow_forward_ios, color: Colors.white.withOpacity(0.3), size: 11.0),
//                       Icon(Icons.arrow_forward_ios, color: Colors.white.withOpacity(0.5), size: 12.0),
//                       Icon(Icons.arrow_forward_ios, color: Colors.white.withOpacity(0.7), size: 13.0),
//                       Icon(Icons.arrow_forward_ios, color: Colors.white.withOpacity(0.9), size: 14.0),
//                       Text('Reservar atención',style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold,fontSize: 15.0),),
//                     ],
//                   ),
//                 )
//               ),
//             ),
//           ),
//           Container(
//             height: MediaQuery.of(context).size.height - 65.0,
//             decoration: BoxDecoration(
//               borderRadius: BorderRadius.only(bottomLeft: Radius.circular(35.0), bottomRight: Radius.circular(35.0)),
//               color: Colors.white
//             ),
//             child: SingleChildScrollView(
//               child: Column(
//                 children: <Widget>[
//                   Container(
//                     height: 325.0,
//                     width: double.infinity,
//                     child: _swiperVets(vets)
//                   ),
//                   SizedBox(height: 5.0),
//                   Padding(
//                     padding: const EdgeInsets.symmetric(horizontal: 10.0),
//                     child: Container(
//                       width: MediaQuery.of(context).size.width - 0.0,
//                       child: Row(
//                         mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                         children: <Widget>[
//                           Column(
//                             crossAxisAlignment: CrossAxisAlignment.start,
//                             children: <Widget>[
//                               Row(
//                                 children: <Widget>[
//                                   Icon(Icons.location_on, size: 12.0, color: Colors.grey),
//                                   Text('1 km de distancia',
//                                   style: TextStyle(
//                                     fontSize: 12.0,
//                                     color: Colors.grey
//                                   ),
//                                   )
//                                 ],
//                               ),
//                               SizedBox(height: 2.0),
//                               Text('Abc home',
//                               style: TextStyle(
//                                 fontSize: 25.0,
//                                 fontWeight: FontWeight.w600
//                               )
//                               )
//                             ],
//                           ),
//                           Container(
//                             height: 45.0,
//                             width: 45.0,
//                             decoration: BoxDecoration(
//                               color: Colors.grey.withOpacity(0.1),
//                               borderRadius: BorderRadius.circular(100.0),
//                               image: DecorationImage(
//                                 image: AssetImage('images/veterinaria2.png'),
//                                 fit: BoxFit.cover
//                               )
//                             ),
//                           )
//                         ],
//                       ),
//                     ),
//                   ),
//                   Padding(
//                     padding: const EdgeInsets.only(left: 10.0),
//                     child: Row(
//                     children: <Widget>[
//                       Text('Recomendación',
//                           style: TextStyle(
//                               fontSize: 15.0,
//                               color: Color(0xFF6A6A6A),
//                               fontWeight: FontWeight.w600)),
//                       SizedBox(width: 15.0),
//                       Stack(
//                         children: <Widget>[
//                           Container(height: 40.0, width: 100.0),
//                           Positioned(
//                             left: 10.0,
//                             child: Container(
//                               height: 40.0,
//                               width: 40.0,
//                               decoration: BoxDecoration(
//                                 borderRadius: BorderRadius.circular(20.0),
//                                 color: colorMain //Color(0xFFFE7050)
//                               ),
//                               child: Center(
//                                 child: Text('+1.2k',
//                                   style: TextStyle(
//                                     fontSize: 12.0, color: Colors.white
//                                   )
//                                 ),
//                               ),
//                             ),
//                           ),
//                           Row(
//                       children: <Widget>[
//                         SizedBox(width: 55.0),
//                         Container(
//                           height: 40.0,
//                           padding: EdgeInsets.symmetric(horizontal: 10.0),
//                           decoration: BoxDecoration(
//                               borderRadius: BorderRadius.circular(20.0),
//                               color: Colors.black.withOpacity(0.2)),
//                           child: Center(
//                             child: Row(
//                               mainAxisAlignment: MainAxisAlignment.center,
//                               children: <Widget>[
//                                 Icon(Icons.star, color: Colors.white, size: 12.0),
//                                 SizedBox(width: 5.0),
//                                 Text('4.3',style: TextStyle(color: Colors.white))
//                               ],
//                             ),
//                           )
//                         )
//                     ],
//                   ),
//                         ],
//                       ),
//                     ],
//                 ),
//                   ),
                
//                   SizedBox(height: 20.0),
//                   Container(
//                     padding: EdgeInsets.symmetric(horizontal: 10.0, vertical: 5.0),
//                     //margin: EdgeInsets.symmetric(horizontal: 10.0),
//                     child: SingleChildScrollView(
//                       scrollDirection: Axis.horizontal,
//                       child: _servicios(),
//                     ),
//                   ),
                  
//                   Container(
//                     padding: EdgeInsets.symmetric(horizontal: 10.0, vertical: 15.0),
//                     child: Column(
//                       crossAxisAlignment: CrossAxisAlignment.start,
//                       mainAxisAlignment: MainAxisAlignment.start,
//                       children: <Widget>[  
//                         Text('Descripción',
//                           style: TextStyle(
//                               fontSize: 15.0,
//                               color: Color(0xFF6A6A6A),
//                               fontWeight: FontWeight.w600)),  
//                         SizedBox(height: 10.0,),
//                         // Text('Descripción',style: TextStyle(fontWeight: FontWeight.bold,),textAlign: TextAlign.left,),                    
//                         Text('Lorem ipsum dolor sit, amet consectetur adipisicing elit. Ratione architecto autem quasi nisi iusto eius ex dolorum velit! Atque, veniam! Atque incidunt laudantium eveniet sint quod harum facere numquam molestias?'),
//                         Text('Lorem ipsum dolor sit, amet consectetur adipisicing elit. Ratione architecto autem quasi nisi iusto eius ex dolorum velit! Atque, veniam! Atque incidunt laudantium eveniet sint quod harum facere numquam molestias?'),
//                         Text('Lorem ipsum dolor sit, amet consectetur adipisicing elit. Ratione architecto autem quasi nisi iusto eius ex dolorum velit! Atque, veniam! Atque incidunt laudantium eveniet sint quod harum facere numquam molestias?'),
//                         Text('Lorem ipsum dolor sit, amet consectetur adipisicing elit. Ratione architecto autem quasi nisi iusto eius ex dolorum velit! Atque, veniam! Atque incidunt laudantium eveniet sint quod harum facere numquam molestias?'),
//                         Text('Lorem ipsum dolor sit, amet consectetur adipisicing elit. Ratione architecto autem quasi nisi iusto eius ex dolorum velit! Atque, veniam! Atque incidunt laudantium eveniet sint quod harum facere numquam molestias?'),
//                         Text('Lorem ipsum dolor sit, amet consectetur adipisicing elit. Ratione architecto autem quasi nisi iusto eius ex dolorum velit! Atque, veniam! Atque incidunt laudantium eveniet sint quod harum facere numquam molestias?'),
//                         Text('Lorem ipsum dolor sit, amet consectetur adipisicing elit. Ratione architecto autem quasi nisi iusto eius ex dolorum velit! Atque, veniam! Atque incidunt laudantium eveniet sint quod harum facere numquam molestias?'),
//                         Text('Lorem ipsum dolor sit, amet consectetur adipisicing elit. Ratione architecto autem quasi nisi iusto eius ex dolorum velit! Atque, veniam! Atque incidunt laudantium eveniet sint quod harum facere numquam molestias?'),
//                       ],
//                     )
//                   ),
//                                   ],
//               ),
//             ),
//           ),
//           // Padding(
//           //   padding: EdgeInsets.only(top: 40.0, left: 15.0, right: 15.0),
//           //   child: Container(
//           //     width: MediaQuery.of(context).size.width - 15.0,
//           //     child: Row(
//           //       mainAxisAlignment: MainAxisAlignment.spaceBetween,
//           //       children: <Widget>[
//           //         // Row(
//           //         //     children: <Widget>[
//           //         //       SizedBox(width: 30.0),
//           //         //       Container(
//           //         //         height: 40.0,
//           //         //         padding: EdgeInsets.symmetric(horizontal: 10.0),
//           //         //         decoration: BoxDecoration(
//           //         //             borderRadius: BorderRadius.circular(20.0),
//           //         //             color: Colors.black.withOpacity(0.2)),
//           //         //         child: Center(
//           //         //           child: Row(
//           //         //             mainAxisAlignment: MainAxisAlignment.center,
//           //         //             children: <Widget>[
//           //         //               Icon(Icons.star, color: Colors.white, size: 12.0),
//           //         //               SizedBox(width: 5.0),
//           //         //               Text('4.3',style: TextStyle(color: Colors.white))
//           //         //             ],
//           //         //           ),
//           //         //         )
//           //         //       )
//           //         //   ],
//           //         // ),
//           //         Container(
//           //           padding: EdgeInsets.symmetric(horizontal: 10.0),
//           //           height: 40.0,
//           //           decoration: BoxDecoration(
//           //             borderRadius: BorderRadius.circular(20.0),
//           //             color: Colors.black.withOpacity(0.2)
//           //           ),
//           //           child: Center(
//           //             child: Text('Veterinaria'.toUpperCase(),style: TextStyle(fontWeight: FontWeight.bold,fontSize: 12.0,color: Colors.white)),
//           //           ),
//           //         ),
//           //       ],
//           //     ),
//           //   ),
//           // ),
          
          
//           // Container(
//           //   height: 350.0,
//           //   width: double.infinity,
//           //   child: _swiperVets(vets),
//           // ),
//           // Positioned(
//           //   top: 351.0,
//           //   child: Column(
//           //     crossAxisAlignment: CrossAxisAlignment.start,
//           //     children: <Widget>[
//           //       Padding(
//           //         padding: const EdgeInsets.only(left:15.0),
//           //         child: Container(
//           //           width: MediaQuery.of(context).size.width - 35.0,
//           //           child: Row(
//           //             mainAxisAlignment: MainAxisAlignment.spaceBetween,
//           //             children: <Widget>[
//           //               Column(
//           //                 crossAxisAlignment: CrossAxisAlignment.start,
//           //                 children: <Widget>[
//           //                   Row(
//           //                     children: <Widget>[
//           //                       Icon(Icons.location_on, size: 12.0, color: Colors.grey),
//           //                       Text('1 km de distancia',
//           //                       style: TextStyle(
//           //                         fontSize: 12.0,
//           //                         color: Colors.grey
//           //                       ),
//           //                       )
//           //                     ],
//           //                   ),
//           //                   SizedBox(height: 2.0),
//           //                   Text('Abc home',
//           //                   style: TextStyle(
//           //                     fontSize: 25.0,
//           //                     fontWeight: FontWeight.w600
//           //                   )
//           //                   )
//           //                 ],
//           //               ),
//           //               Container(
//           //                 height: 45.0,
//           //                 width: 45.0,
//           //                 decoration: BoxDecoration(
//           //                   color: Colors.grey.withOpacity(0.1),
//           //                   borderRadius: BorderRadius.circular(100.0),
//           //                   image: DecorationImage(
//           //                     image: AssetImage('images/veterinaria2.png'),
//           //                     fit: BoxFit.cover
//           //                   )
//           //                 ),
//           //               )
//           //             ],
//           //           ),
//           //         ),
//           //       ),
//           //       Padding(
//           //         padding: const EdgeInsets.only(left: 15.0, top: 5.0),
//           //         child: Row(
//           //         children: <Widget>[
//           //           Text('Recomendación',
//           //               style: TextStyle(
//           //                   fontSize: 15.0,
//           //                   color: Color(0xFF6A6A6A),
//           //                   fontWeight: FontWeight.w600)),
//           //           SizedBox(width: 15.0),
//           //           Stack(
//           //             children: <Widget>[
//           //               Container(height: 40.0, width: 100.0),
//           //               Positioned(
//           //                 left: 10.0,
//           //                 child: Container(
//           //                   height: 40.0,
//           //                   width: 40.0,
//           //                   decoration: BoxDecoration(
//           //                     borderRadius: BorderRadius.circular(20.0),
//           //                     color: colorMain //Color(0xFFFE7050)
//           //                   ),
//           //                   child: Center(
//           //                     child: Text('+1.2k',
//           //                       style: TextStyle(
//           //                         fontSize: 12.0, color: Colors.white
//           //                       )
//           //                     ),
//           //                   ),
//           //                 ),
//           //               )
//           //             ],
//           //           ),
//           //         ],
//           //     ),
//           //       ),
//           //       SizedBox(height: 10.0),
//           //       SingleChildScrollView(
//           //         scrollDirection: Axis.vertical,
//           //         padding: EdgeInsets.symmetric(horizontal: 15.0,vertical: 5.0),
//           //         child: Column(
//           //           children: <Widget>[
//           //             SingleChildScrollView(
//           //               scrollDirection: Axis.horizontal,
//           //               child: _servicios(),
//           //             ),
//           //             Container(
//           //               width: MediaQuery.of(context).size.width - 15.0,
//           //               child: Text('Officially the Republic of the Union of Myanmar and also known as Burma, is a country in Southeast Asia',
//           //                 style:
//           //                   TextStyle(color: Color(0xFF6A6A6A), fontWeight: FontWeight.w300)
//           //               ),
//           //             ),
//           //           ],
//           //         ),
//           //       ),
//           //       //SizedBox(height: 10.0),
                

//           //     ],
//           //   ),
//           // ),
//           // Padding(
//           //   padding: EdgeInsets.only(top: 40.0, left: 15.0, right: 15.0),
//           //   child: Container(
//           //     width: MediaQuery.of(context).size.width - 15.0,
//           //     child: Row(
//           //       mainAxisAlignment: MainAxisAlignment.spaceBetween,
//           //       children: <Widget>[
//           //         Row(
//           //             children: <Widget>[
//           //               SizedBox(width: 30.0),
//           //               Container(
//           //                 height: 40.0,
//           //                 padding: EdgeInsets.symmetric(horizontal: 10.0),
//           //                 decoration: BoxDecoration(
//           //                     borderRadius: BorderRadius.circular(20.0),
//           //                     color: Colors.black.withOpacity(0.2)),
//           //                 child: Center(
//           //                   child: Row(
//           //                     mainAxisAlignment: MainAxisAlignment.center,
//           //                     children: <Widget>[
//           //                       Icon(Icons.star, color: Colors.white, size: 12.0),
//           //                       SizedBox(width: 5.0),
//           //                       Text('4.3',style: TextStyle(color: Colors.white))
//           //                     ],
//           //                   ),
//           //                 )
//           //               )
//           //           ],
//           //         ),
//           //         Container(
//           //           padding: EdgeInsets.symmetric(horizontal: 10.0),
//           //           height: 40.0,
//           //           decoration: BoxDecoration(
//           //             borderRadius: BorderRadius.circular(20.0),
//           //             color: Colors.black.withOpacity(0.2)
//           //           ),
//           //           child: Center(
//           //             child: Text('Veterinaria'.toUpperCase(),style: TextStyle(fontWeight: FontWeight.bold,fontSize: 12.0,color: Colors.white)),
//           //           ),
//           //         ),
//           //       ],
//           //     ),
//           //   ),
//           // )



//         ]
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
//     return CardSwiper(imagenes : imagen,autoplay1: false,radius: 0.0,height1: 145.0,);    
//   }
// }
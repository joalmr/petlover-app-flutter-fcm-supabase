import 'package:flutter/material.dart';
import 'package:proypet/src/pages/reserva_modal.dart';
import 'package:proypet/src/pages/shared/navigation_bar.dart';
import '../../main.dart';

class ReservaDetallePage extends StatelessWidget {
  final String image = "images/vet_prueba.jpg";
  @override
  Widget build(BuildContext context) {
    Modal modal = new Modal();
    return Scaffold(
      body: Stack(
        children: <Widget>[
          Container(
            foregroundDecoration: BoxDecoration(
              color: Colors.black26
            ),
            height: 550,
            width: double.infinity,
            child: Image.asset(image, fit: BoxFit.cover)),
          SingleChildScrollView(
            padding: const EdgeInsets.only(top: 16.0,bottom: 20.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                const SizedBox(height: 450),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal:22.0),
                  child: Text(
                    "Vet Prueba",
                    style: TextStyle(color: Colors.white, fontSize: 26.0, fontWeight: FontWeight.bold),
                  ),
                ),
                Container(
                  padding: const EdgeInsets.symmetric(vertical: 7.5, horizontal: 22.0),
                  color: Colors.white,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisSize: MainAxisSize.min,
                    children: <Widget>[
                      Row(
                        children: <Widget>[
                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: <Widget>[
                                Row(
                                  children: <Widget>[
                                    Icon(
                                      Icons.star,
                                      color: colorMain,
                                    ),
                                    Icon(
                                      Icons.star,
                                      color: colorMain,
                                    ),
                                    Icon(
                                      Icons.star,
                                      color: colorMain,
                                    ),
                                    Icon(
                                      Icons.star,
                                      color: colorMain,
                                    ),
                                    Icon(
                                      Icons.star_border,
                                      color: colorMain,
                                    ),
                                  ],
                                ),
                                Text.rich(TextSpan(children: [
                                  WidgetSpan(
                                    child: Icon(Icons.location_on, size: 16.0, color: Colors.grey,)
                                  ),
                                  TextSpan(
                                    text: "1 km de distancia"
                                  )
                                ]), style: TextStyle(color: Colors.grey, fontSize: 12.0),)
                              ],
                            ),
                          ),
                          Column(
                            children: <Widget>[
                              CircleAvatar(
                                radius: 30.0,
                                child: Padding(
                                  padding: const EdgeInsets.all(4.5),
                                  child: Image(
                                    image: AssetImage('images/veterinaria.png'),
                                  ),
                                ),
                                backgroundColor: colorSec,
                              ),
                            ],
                          )
                        ],
                      ),
                      const SizedBox(height: 25.0),
                      //scroll horizontal
                      SingleChildScrollView(
                        scrollDirection: Axis.horizontal,
                        child: _servicios(),
                      ),
                      SizedBox(height: 25.0),
                      Text("Descripción".toUpperCase(), style: TextStyle(
                        fontWeight: FontWeight.w600,
                        fontSize: 14.0
                      ),),
                      const SizedBox(height: 10.0),
                      Text(
                          "Lorem ipsum dolor sit, amet consectetur adipisicing elit. Ratione architecto autem quasi nisi iusto eius ex dolorum velit! Atque, veniam! Atque incidunt laudantium eveniet sint quod harum facere numquam molestias?", textAlign: TextAlign.justify, style: TextStyle(
                            fontWeight: FontWeight.w300,
                            fontSize: 14.0
                          ),),
                      const SizedBox(height: 10.0),
                      Text(
                          "Lorem ipsum dolor sit, amet consectetur adipisicing elit. Ratione architecto autem quasi nisi iusto eius ex dolorum velit! Atque, veniam! Atque incidunt laudantium eveniet sint quod harum facere numquam molestias?", textAlign: TextAlign.justify, style: TextStyle(
                            fontWeight: FontWeight.w300,
                            fontSize: 14.0
                          ),),
                      const SizedBox(height: 10.0),
                      Text(
                          "Lorem ipsum dolor sit, amet consectetur adipisicing elit. Ratione architecto autem quasi nisi iusto eius ex dolorum velit! Atque, veniam! Atque incidunt laudantium eveniet sint quod harum facere numquam molestias?", textAlign: TextAlign.justify, style: TextStyle(
                            fontWeight: FontWeight.w300,
                            fontSize: 14.0
                          ),),
                      const SizedBox(height: 10.0),
                      Text(
                          "Lorem ipsum dolor sit, amet consectetur adipisicing elit. Ratione architecto autem quasi nisi iusto eius ex dolorum velit! Atque, veniam! Atque incidunt laudantium eveniet sint quod harum facere numquam molestias?", textAlign: TextAlign.justify, style: TextStyle(
                            fontWeight: FontWeight.w300,
                            fontSize: 14.0
                          ),),
                    ],
                  ),
                ),
              ],
            ),
          ),
          Positioned(
            top: 0,
            left: 0,
            right: 0,
            child: AppBar(
              backgroundColor: Colors.transparent,
              elevation: 0,
              centerTitle: true,
              title: Text("",style: TextStyle(
                fontSize: 16.0,
                fontWeight: FontWeight.normal
              ),),
            ),
          ),
        ],
      ),
      bottomNavigationBar: BottomAppBar(
        child: Padding(
          padding: EdgeInsets.all(20.0),
          child: Row(
            children: <Widget>[
              Stack(
                children: <Widget>[
                Container(
                  height:42.0,
                  child: Padding(
                    padding: const EdgeInsetsDirectional.fromSTEB(15.0, 0, 0, 0),
                    child: Center(
                      child: Column(
                        children: <Widget>[
                          Row(
                            children: <Widget>[
                              Text('4.18',
                                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 24.0, color: Colors.grey),
                              ),
                              Icon(Icons.star,color: Colors.grey,size: 24.0,),
                            ],
                          ),
                          Text('200 reviews',style: TextStyle(fontWeight: FontWeight.bold, fontSize: 12.0, color: colorSec),)
                        ],
                      ),
                    ),
                  ),
                ),
                ],
              ),
              Spacer(),
              RaisedButton(
                shape: shapeBtn,
                color: colorSec,
                textColor: Colors.white,
                child: Text('Reservar ahora',style: TextStyle(
                  fontWeight: FontWeight.normal
                ),),
                elevation: 15.0,
                padding: EdgeInsets.symmetric(vertical: 16.0,horizontal: 32.0),
                onPressed: (){
                  modal.mainBottomSheet(context);
                },
              )
            ],
          ),
        ),
        // child: Row(
        //   children: <Widget>[
        //     Text('Hola'),
        //     Spacer(),
        //     RaisedButton(
        //         shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(30.0)),
        //         color: colorSec,
        //         textColor: Colors.white,
        //         child: Text("Reservar", style: TextStyle(
        //           fontWeight: FontWeight.normal
        //         ),),
        //         padding: const EdgeInsets.symmetric(
        //           vertical: 16.0,
        //           horizontal: 32.0,
        //         ),
        //         onPressed: (){},
        //       )
        //   ],
        // ),

      ),
      // floatingActionButton: FloatingActionButton(
      //   onPressed: (){},
      //   child: Icon(Icons.add),
      //   backgroundColor: colorSec,
      // ),
      // floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,

    );
  }

  Widget _servicios(){
    return Row(
      children: <Widget>[
        _icoServicio('images/veterinaria2.png','Servicio 1'),
        SizedBox(width: 10.0,),
        _icoServicio('images/veterinaria2.png','Servicio 2'),
        SizedBox(width: 10.0,),
        _icoServicio('images/veterinaria2.png','Servicio 3'),
        SizedBox(width: 10.0,),
        _icoServicio('images/veterinaria2.png','Servicio 4'),
        SizedBox(width: 10.0,),
        _icoServicio('images/veterinaria2.png','Servicio 5'),
        SizedBox(width: 10.0,),
        _icoServicio('images/veterinaria2.png','Servicio 6'),
        SizedBox(width: 10.0,),
        _icoServicio('images/veterinaria2.png','Servicio 7'),
        SizedBox(width: 10.0,),
        _icoServicio('images/veterinaria2.png','Servicio 8'),
        SizedBox(width: 10.0,),
        _icoServicio('images/veterinaria2.png','Servicio 9'),
        SizedBox(width: 10.0,),
      ],
    );
    
  }

  Widget _icoServicio(imagen,nombre){
    return Column(
      children: <Widget>[
        CircleAvatar(
          backgroundColor: colorMain,
          backgroundImage: AssetImage(imagen),
        ),
        Text(nombre,style: TextStyle(fontWeight: FontWeight.bold),)
      ],
    );
  }


}

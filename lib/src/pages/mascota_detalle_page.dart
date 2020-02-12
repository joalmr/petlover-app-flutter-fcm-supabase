import 'package:flutter/material.dart';
import 'package:proypet/src/pages/model/mascota/historias_model.dart';
import 'package:proypet/src/pages/model/mascota/mascota_model.dart';
import 'package:proypet/src/pages/shared/styles/styles.dart';

class MascotaDetallePage extends StatelessWidget {
  final int idmascota;

  MascotaDetallePage({@required this.idmascota});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Container(
            height: MediaQuery.of(context).size.height,
            color: colorMain,
          ),
          Container(
            height: MediaQuery.of(context).size.height-65.0,
            child: SingleChildScrollView(
              child: Column(
                children: <Widget>[
                  Image(
                    image: AssetImage(mascotaList[idmascota].foto),
                    fit: BoxFit.cover,
                    width: double.infinity,
                    height: 300.0,                  
                  ),
                  // Container(
                  //   child: listaHistorial(context),
                  // )
                ],
              ),
              // children: <Widget>[
              //   Positioned(
              //     top: 0.0,
                  
              //   ),
                
                // Positioned(
                //   bottom: 0,
                //   left: 5.0,
                //   right: 5.0,
                //   child: Container(
                //     height: 180.0,
                //     width: MediaQuery.of(context).size.width,
                //     foregroundDecoration: BoxDecoration(
                //       color: colorMain,
                //       borderRadius: BorderRadius.circular(25.0),
                //     ),
                //   ),
                // ),
                // Positioned(
                //   bottom: 0,
                //   child: Container(
                //     height: 175.0,
                //     width: MediaQuery.of(context).size.width,
                //     padding: EdgeInsets.symmetric(vertical: 15.0),
                //     child: Column(
                //       crossAxisAlignment: CrossAxisAlignment.start,
                //       mainAxisAlignment: MainAxisAlignment.start,
                //       children: <Widget>[
                //         Padding(
                //           padding: const EdgeInsets.symmetric(horizontal: 25.0),
                //           child: Row(
                //             mainAxisAlignment: MainAxisAlignment.spaceBetween,
                //             children: <Widget>[
                //               Column(
                //                 crossAxisAlignment: CrossAxisAlignment.start,
                //                 mainAxisAlignment: MainAxisAlignment.start,
                //                 children: <Widget>[
                //                   Text(mascotaList[idmascota].nombre,
                //                     style: TextStyle(
                //                       fontSize: 20.0,
                //                       fontWeight: FontWeight.w600,
                //                       color: Colors.white
                //                     )
                //                   ),
                //                   Text(mascotaList[idmascota].raza,
                //                     style: TextStyle(
                //                       fontSize: 15.0,
                //                       fontWeight: FontWeight.w600,
                //                       color: Colors.white
                //                     )
                //                   )
                //                 ],
                //               ),
                //               Row(
                //                 crossAxisAlignment: CrossAxisAlignment.center,
                //                 mainAxisAlignment: MainAxisAlignment.start,
                //                 children: <Widget>[
                //                   Icon(Icons.cake,color: Colors.white,size: 28.0,),
                //                   splitEdad(mascotaList[idmascota].edad)                                  
                //                 ],
                //               )
                //             ],
                //           ),
                //         ),
                //         SizedBox(height: 15.0),
                //         Row(
                //           mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                //           children: <Widget>[
                //             Container(
                //               height: 70.0,
                //               width: 75.0,
                //               decoration: BoxDecoration(
                //                 color: Colors.black.withOpacity(0.15),
                //                 borderRadius: BorderRadius.circular(10.0),
                //                 border: Border.all(width: 2.0, color: Colors.white)
                //               ),
                //               //padding: EdgeInsets.all(0.0),
                //               child: FlatButton(
                //                 onPressed: (){},
                //                 child: Column(
                //                   mainAxisAlignment: MainAxisAlignment.center,
                //                   crossAxisAlignment: CrossAxisAlignment.center,
                //                   children: <Widget>[
                //                     Center(child: Text('12',style: TextStyle(color: Colors.white,fontSize: 18,fontWeight: FontWeight.bold))),
                //                     Center(child: Text('Consultas',style: TextStyle(color: Colors.white,fontSize: 8,fontWeight: FontWeight.w300)))
                //                   ],
                //                 ),
                //               )  ,
                //             ),
                //             Container(
                //               height: 70.0,
                //               width: 75.0,
                //               decoration: BoxDecoration(
                //                 color: Colors.black.withOpacity(0.15),
                //                 borderRadius: BorderRadius.circular(10.0),
                //                 border: Border.all(width: 2.0, color: Colors.white)
                //               ),
                //               //padding: EdgeInsets.all(0.0),
                //               child: FlatButton(
                //                 onPressed: (){},
                //                 child: Column(
                //                   mainAxisAlignment: MainAxisAlignment.center,
                //                   crossAxisAlignment: CrossAxisAlignment.center,
                //                   children: <Widget>[
                //                     Center(child: Text('6',style: TextStyle(color: Colors.white,fontSize: 18,fontWeight: FontWeight.bold))),
                //                     Center(child: Text('Vacunas',style: TextStyle(color: Colors.white,fontSize: 8,fontWeight: FontWeight.w300)))
                //                   ],
                //                 ),
                //               )  ,
                //             ),
                            
                //             Container(
                //               height: 70.0,
                //               width: 75.0,
                //               decoration: BoxDecoration(
                //                 color: Colors.black.withOpacity(0.15),
                //                 borderRadius: BorderRadius.circular(10.0),
                //                 border: Border.all(width: 2.0, color: Colors.white)
                //               ),
                //               //padding: EdgeInsets.all(0.0),
                //               child: FlatButton(
                //                 onPressed: (){},
                //                 child: Column(
                //                   mainAxisAlignment: MainAxisAlignment.center,
                //                   crossAxisAlignment: CrossAxisAlignment.center,
                //                   children: <Widget>[
                //                     Center(child: Text('32',style: TextStyle(color: Colors.white,fontSize: 18,fontWeight: FontWeight.bold))),
                //                     Center(child: Text('Baños',style: TextStyle(color: Colors.white,fontSize: 8,fontWeight: FontWeight.w300)))
                //                   ],
                //                 ),
                //               )  ,
                //             ),
                //             Container(
                //               height: 70.0,
                //               width: 75.0,
                //               decoration: BoxDecoration(
                //                 color: Colors.black.withOpacity(0.15),
                //                 borderRadius: BorderRadius.circular(10.0),
                //                 border: Border.all(width: 2.0, color: Colors.white)
                //               ),
                //               //padding: EdgeInsets.all(0.0),
                //               child: FlatButton(
                //                 onPressed: (){},
                //                 child: Column(
                //                   mainAxisAlignment: MainAxisAlignment.center,
                //                   crossAxisAlignment: CrossAxisAlignment.center,
                //                   children: <Widget>[
                //                     Center(child: Text('32',style: TextStyle(color: Colors.white,fontSize: 18,fontWeight: FontWeight.bold))),
                //                     Center(child: Text('Desparasitaciones',style: TextStyle(color: Colors.white,fontSize: 8,fontWeight: FontWeight.w300)))
                //                   ],
                //                 ),
                //               )  ,
                //             ),
                //           ],
                //         ),
                //       ],
                //     ),
                //   ),
                // ),
              //],
            ),
          ),

          // Positioned(
          //   bottom: 0,
          //   child: Container(
          //     height: 410.0,
          //     child: Padding(
          //       padding: const EdgeInsets.symmetric(horizontal: 20.0),
          //       child: Text('Historial',style: TextStyle(fontWeight: FontWeight.bold,fontSize: 22.0),),
          //     ),
          //   ),
          // ),
          // Positioned(
          //   bottom: 0,
          //   child: Container(
          //     height: 415,
          //     width: MediaQuery.of(context).size.width,
          //     child: listaHistorial(context),
          //   ),
          // ),
          // //
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
          )

        ]
      ),
    );
  }

  splitEdad(String textoEdad){
    if(textoEdad.split(' ').length==4){
      return Column(   
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.start,
        children: <Widget>[
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.start,
            children: <Widget>[
              Text(mascotaList[idmascota].edad.split(' ')[0],style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold,fontSize: 20.0)),
              Text(mascotaList[idmascota].edad.split(' ')[1] ,style: TextStyle(color: Colors.white)),
            ],
          ),
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.start,
            children: <Widget>[
              Text(mascotaList[idmascota].edad.split(' ')[2],style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold)),
              Text(mascotaList[idmascota].edad.split(' ')[3] ,style: TextStyle(color: Colors.white)),
            ],
          )
        ],
      );
    }
    else{
      return Column( 
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.start,     
        children: <Widget>[
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.start,
            children: <Widget>[
              Text(mascotaList[idmascota].edad.split(' ')[0],style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold,fontSize: 18.0)),
              Text(mascotaList[idmascota].edad.split(' ')[1] ,style: TextStyle(color: Colors.white)),
            ],
          )
        ],
      );
    }
  }

  listaHistorial(BuildContext context){
    return ListView.builder(
      itemCount: historialList.length,
      itemBuilder: (BuildContext context, int index){
        return FlatButton(
          onPressed: (){},          
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 10.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                Expanded(
                  child: Row(
                    children: <Widget>[
                      CircleAvatar(
                        backgroundImage: NetworkImage(historialList[index].logo),
                        radius: 25.0,
                      ),
                      SizedBox(width: 7.0),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Text(
                            historialList[index].nombreVet,
                            style: TextStyle(
                              color: Colors.black87,
                              fontSize: 17.0,
                              fontWeight: FontWeight.w600
                            ),
                          ),
                          Icon(Icons.local_hospital,size: 18.0,color: Colors.black.withOpacity(.5)),
                        ],
                      ),
                    ],
                  ),
                ),
                Column(
                  children: <Widget>[
                    Text(
                      historialList[index].fecha,
                      style: TextStyle(color: Colors.black.withOpacity(.71),fontSize: 12.0,fontWeight: FontWeight.w600),
                    ),
                    Text(
                      historialList[index].hora,
                      style: TextStyle(color: colorMain[700],fontSize: 16.0,fontWeight: FontWeight.w600),
                      textAlign: TextAlign.center,
                    ),
                  ],
                ),
              ],
            ),
          ),
        );
      } 
    );
  }
}
import 'package:flutter/material.dart';
import 'package:proypet/src/model/mascota/historias_model.dart';
import 'package:proypet/src/model/mascota/mascota1_model.dart';

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
          ),
          Container(
            child: Image(
              image: AssetImage(mascotaList[idmascota].foto),
              height: 300,
              width: double.infinity,
              fit: BoxFit.cover,
            ),            
          ),
          Container(
            height: MediaQuery.of(context).size.height,
            // foregroundDecoration: BoxDecoration(
            //   gradient: LinearGradient(
            //     colors: <Color>[
            //       Colors.transparent,
            //       Colors.green.withOpacity(0.75)
            //     ],
            //     begin: Alignment.topCenter,
            //     end: Alignment.bottomCenter
            //   )
            // ),
          ),
          Container(
            margin: EdgeInsets.only(top: 250.0,left: 5.0,right: 5.0),
            decoration: BoxDecoration(
              borderRadius: borderRadius,
              color: Colors.white,                            
            ),
            height: double.infinity,  
            width: double.infinity,
            child: Stack(
              children: <Widget>[
                Container(
                  padding: EdgeInsets.only(top: 5.0,left: 10.0,right: 10.0),
                  child: Column(
                    children: <Widget>[
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: <Widget>[
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: <Widget>[
                              Text(mascotaList[idmascota].nombre,style: TextStyle(fontSize: 22.0,fontWeight: FontWeight.w600),),
                              Text(mascotaList[idmascota].raza,style: TextStyle(fontSize: 12.0,fontWeight: FontWeight.w600),),
                              Text(mascotaList[idmascota].edad,style: TextStyle(fontSize: 12.0,fontWeight: FontWeight.w600, color: Colors.grey[500]),),
                            ],
                          ),
                          Row(
                            children: <Widget>[
                              Text('${mascotaList[idmascota].peso} kg.', style: TextStyle(fontWeight: FontWeight.w600,),),
                              IconButton(
                                icon: Icon(Icons.filter_list,), 
                                onPressed: ()=>showDialog(
                                  context: context,
                                  builder: (BuildContext context){
                                    return AlertDialog(
                                      title: Text('Filtros de historial'),
                                      actions: <Widget>[
                                        FlatButton(
                                          onPressed: ()=>Navigator.pop(context), 
                                          child: Text('Cerrar')
                                        ),
                                        FlatButton(
                                          onPressed: (){}, 
                                          child: Text('Buscar')
                                        )
                                      ],
                                    );
                                  }
                                )
                              )
                            ],
                          )                          
                        ],
                      ),
                      SizedBox(height: 10.0,),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: <Widget>[
                          Container(
                            height: 65.0,
                            width: 65.0,
                            decoration: BoxDecoration(
                              borderRadius: borderRadius,
                              border: Border.all(
                                color: colorMain,
                                width: 1,
                              ),
                            ),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: <Widget>[
                                Text('120',style: TextStyle(color: colorMain, fontSize: 18.0, fontWeight: FontWeight.bold),),
                                Text('Consultas',style: TextStyle(color: colorMain, fontSize: 7.5),),
                              ],
                            ),
                          ),
                          Container(
                            height: 65.0,
                            width: 65.0,
                            decoration: BoxDecoration(
                              borderRadius: borderRadius,
                              border: Border.all(
                                color: colorMain,
                                width: 1,
                              ),
                            ),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: <Widget>[
                                Text('20',style: TextStyle(color: colorMain, fontSize: 18.0, fontWeight: FontWeight.bold),),
                                Text('Vacunas',style: TextStyle(color: colorMain, fontSize: 7.5),),
                              ],
                            ),
                          ),
                          Container(
                            height: 65.0,
                            width: 65.0,
                            decoration: BoxDecoration(
                              borderRadius: borderRadius,
                              border: Border.all(
                                color: colorMain,
                                width: 1,
                              ),
                            ),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: <Widget>[
                                Text('80',style: TextStyle(color: colorMain, fontSize: 18.0, fontWeight: FontWeight.bold),),
                                Text('Baños',style: TextStyle(color: colorMain, fontSize: 7.5),),
                              ],
                            ),
                          ),
                          Container(
                            height: 65.0,
                            width: 65.0,
                            decoration: BoxDecoration(
                              borderRadius: borderRadius,
                              border: Border.all(
                                color: colorMain,
                                width: 1,
                              ),
                            ),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: <Widget>[
                                Text('110',style: TextStyle(color: colorMain, fontSize: 18.0, fontWeight: FontWeight.bold),),
                                Text('Desparasitaciones',style: TextStyle(color: colorMain, fontSize: 7.5),),
                              ],
                            ),
                          ),
                        ],
                      )
                    ],
                  )
                ),
                Container(
                  margin: EdgeInsets.only(top: 137.5),
                  //padding: EdgeInsets.symmetric(horizontal: 5.0),
                  width: double.infinity,
                  child: listaHistorial(context),
                )
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
      itemBuilder: (context, int index){
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
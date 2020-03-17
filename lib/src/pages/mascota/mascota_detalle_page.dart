import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:proypet/src/model/mascota/historias_model.dart';
import 'package:proypet/src/model/mascota/pet_model.dart';

import 'package:proypet/src/pages/shared/styles/styles.dart';
import 'package:proypet/src/providers/mascota_provider.dart';
import 'package:proypet/src/utils/utils.dart';

class MascotaDetallePage extends StatelessWidget {
  final String idmascota;

  MascotaDetallePage({@required this.idmascota});
  final mascotaProvider = MascotaProvider();

  @override
  Widget build(BuildContext context) {
    print(idmascota);
    return Scaffold(
      body: onDetail(),
    );
  }

  Widget onDetail(){
    return FutureBuilder(
      future: mascotaProvider.getPet(idmascota),
      builder: (BuildContext context, AsyncSnapshot<PetModel> snapshot) {
        final mydata=snapshot.data;
        if(!snapshot.hasData){
          return Center(child: CircularProgressIndicator()); //valueColor: new AlwaysStoppedAnimation<Color>(colorMain),
        }
        else{
          return Stack(
            children: <Widget>[
              Container(
                height: MediaQuery.of(context).size.height,
              ),
              Container(
                child: Image(
                  image: CachedNetworkImageProvider(mydata.pet.picture),
                  height: 300,
                  width: double.infinity,
                  fit: BoxFit.cover,
                ),         
              ),
              Container(
                height: MediaQuery.of(context).size.height,
              ),
              Container(
                margin: EdgeInsets.only(top: 275.0,left: 5.0,right: 5.0),
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
                          datoMascota(mydata.pet),
                          SizedBox(height: 10.0,),
                          numAtenciones(),
                        ],
                      )
                    ),
                    Container(
                      margin: EdgeInsets.only(top: 140.5),
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
                  actions: <Widget>[
                    IconButton(
                      icon: Icon(Icons.filter_list, color: Colors.white70,), 
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
                    ),
                  ],
                ),
              )


            ],
          );
        }
      },
    );
  }

  datoMascota(pet){
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: <Widget>[
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Text(pet.name, style: TextStyle(fontSize: 22.0,fontWeight: FontWeight.w600),),
            Text(pet.breedName, style: TextStyle(fontSize: 12.0,fontWeight: FontWeight.w600),),
            Text(calculateAge(pet.birthdate), style: TextStyle(fontSize: 12.0,fontWeight: FontWeight.w600, color: Colors.grey[500]),),
          ],
        ),
        Row(
          children: <Widget>[
            Text('${pet.weight} kg.', style: TextStyle(fontWeight: FontWeight.w600,),),
          ],
        )                          
      ],
    );
  }
  numAtenciones(){
    return Row(
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
    );
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
                        backgroundColor: Colors.transparent,
                        backgroundImage: CachedNetworkImageProvider(historialList[0].logo),
                        radius: 25.0,
                      ),
                      SizedBox(width: 7.0),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Text(
                            historialList[0].nombreVet,
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
                      historialList[0].fecha,
                      style: TextStyle(color: Colors.black.withOpacity(.71),fontSize: 12.0,fontWeight: FontWeight.w600),
                    ),
                    Text(
                      historialList[0].hora,
                      style: TextStyle(color: colorMain,fontSize: 16.0,fontWeight: FontWeight.w600),
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
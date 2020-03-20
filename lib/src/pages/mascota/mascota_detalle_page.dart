import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:proypet/src/model/mascota/historias_model.dart';
import 'package:proypet/src/model/mascota/pet_model.dart';
import 'package:proypet/src/pages/shared/enddrawer/mascota_drawer.dart';

import 'package:proypet/src/pages/shared/styles/styles.dart';
import 'package:proypet/src/providers/mascota_provider.dart';
import 'package:proypet/src/utils/utils.dart';

class MascotaDetallePage extends StatefulWidget {
  final String idmascota;
  // final MascotaModel mascota;
  MascotaDetallePage({@required this.idmascota});

  @override
  _MascotaDetallePageState createState() => _MascotaDetallePageState(idmascota: idmascota);
}

class _MascotaDetallePageState extends State<MascotaDetallePage> {
  final String idmascota;
  _MascotaDetallePageState({@required this.idmascota});
  final GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey<ScaffoldState>();
  final mascotaProvider = MascotaProvider();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      body: onDetail(),
      endDrawer: MascotaDrawer(idPet: idmascota,),
    );
  }

  Widget onDetail(){
    return FutureBuilder(
      future: mascotaProvider.getPet(widget.idmascota),
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
                margin: EdgeInsets.only(top: 275.0,left: 5.0,right: 5.0),
                decoration: BoxDecoration(
                  borderRadius: borderRadius,
                  color: Colors.white,                            
                ),
                child: SingleChildScrollView(
                  physics: BouncingScrollPhysics(),
                  child: Column(
                    children: <Widget>[                      
                      datoMascota(mydata.pet),
                      numAtenciones(),
                      listaHistorial(context)
                    ],
                  ),
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
                      icon: Icon(Icons.filter_list, ), 
                      onPressed: ()=>_scaffoldKey.currentState.openEndDrawer()
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
    return Padding(
      padding: const EdgeInsets.only(left: 20.0,right: 20.0,top: 5.0,bottom: 15.0),
      child: Row(
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
      ),
    );
  }

  numAtenciones(){
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Row(
        //mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: <Widget>[
          casilleroAtencion('120','Consultas'),
          casilleroAtencion('20','Vacunas'),
          casilleroAtencion('80','Baños'),
          casilleroAtencion('120','Desparasitaciones'),
        ],
      ),
    );
  }

  casilleroAtencion(String cantidad,String texto){
    return Container(
      height: 65.0,
      width: 65.0,
      margin: EdgeInsets.symmetric(horizontal: 10.0),
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
          Text(cantidad, style: TextStyle(color: colorMain, fontSize: 18.0, fontWeight: FontWeight.bold),),
          Text(texto, style: TextStyle(color: colorMain, fontSize: 7.5),),
        ],
      ),
    );
  }

  listaHistorial(BuildContext context){
    return ListView.builder(
      physics: NeverScrollableScrollPhysics(),
      shrinkWrap: true,
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
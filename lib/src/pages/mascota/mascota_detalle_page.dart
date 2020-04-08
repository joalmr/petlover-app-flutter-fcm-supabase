import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:proypet/src/model/mascota/historia_model.dart';
import 'package:proypet/src/model/mascota/mascota_model.dart';
import 'package:proypet/src/model/mascota/pet_model.dart';
import 'package:proypet/src/pages/shared/enddrawer/mascota_drawer.dart';
import 'package:proypet/src/pages/shared/icons_map.dart';

import 'package:proypet/src/pages/shared/styles/styles.dart';
import 'package:proypet/src/providers/mascota_provider.dart';
import 'package:proypet/src/utils/utils.dart';

class MascotaDetallePage extends StatefulWidget {

  @override
  _MascotaDetallePageState createState() => _MascotaDetallePageState();//mascota: mascota
}

class _MascotaDetallePageState extends State<MascotaDetallePage> {
  // MascotaModel mascota;
  // _MascotaDetallePageState({@required this.mascota});
  final GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey<ScaffoldState>();
  final mascotaProvider = MascotaProvider();

  @override
  Widget build(BuildContext context) {
    final MascotaModel mascota = ModalRoute.of(context).settings.arguments;
    return Scaffold(
      key: _scaffoldKey,
      body: onDetail(mascota),
      endDrawer: MascotaDrawer(modelMascota: mascota,),
    );
  }

  Widget onDetail(MascotaModel mascota){
    return Stack(
      children: <Widget>[
        Container(
          height: MediaQuery.of(context).size.height,
        ),
        Container(
          child: Image(
            image: CachedNetworkImageProvider(mascota.picture),
            height: 350,
            width: double.infinity,
            fit: BoxFit.cover,
          ),
        ),
        Container(
          margin: EdgeInsets.only(top: 330.0,left: 5.0,right: 5.0),
          decoration: BoxDecoration(
            borderRadius: borderRadius,
            color: Colors.white,                            
          ),
          child: SingleChildScrollView(
            physics: BouncingScrollPhysics(),
            child: Column(
              children: <Widget>[                      
                datoMascota(mascota),
                // numAtenciones(),
                listaHistorial(context, mascota),
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
                icon: Icon(Icons.settings ), 
                onPressed: ()=>_scaffoldKey.currentState.openEndDrawer()
              ),
            ],
          ),
        )

      ],
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
              Text(calculateAge(DateTime.parse(pet.birthdate)), style: TextStyle(fontSize: 12.0,fontWeight: FontWeight.w600, color: Colors.grey[500]),),
            ],
          ),
          Column(
            children: <Widget>[
              Text('${pet.weight} kg.', style: TextStyle(fontWeight: FontWeight.w600,),),
              (pet.status==0) 
              ? Text('Fallecido', style: TextStyle(fontStyle: FontStyle.italic, fontSize: 12.0, fontWeight: FontWeight.bold),)
              : SizedBox(height: 0,)
              // IconButton(
              //   icon: Icon(Icons.filter_list),
              //   onPressed: (){}
              // ),
            ],
          )                          
        ],
      ),
    );
  }


  listaHistorial(BuildContext context, MascotaModel mascota){ //List<HistoriaModel> historias
    return FutureBuilder(
      future: mascotaProvider.getPet(mascota.id),
      builder: (BuildContext context, AsyncSnapshot<PetModel> snapshot) {
        if(!snapshot.hasData){
          return Center(child: CircularProgressIndicator(),);
        }
        else{
          List<HistoriaModel> historias = snapshot.data.history;
          // print(historias[0].details);
          return ListView.builder(
          physics: NeverScrollableScrollPhysics(),
          shrinkWrap: true,
          itemCount: historias.length,
          itemBuilder: (context, int index){
            return FlatButton(
              onPressed: (){},          
              child: Padding(
                padding: const EdgeInsets.symmetric(vertical: 10.0),
                child: InkWell(
                  onTap: ()=>Navigator.pushNamed(context, 'detallehistoriamascota', arguments: {"detalle":historias[index].details,"precio":historias[index].amount} ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: <Widget>[
                      Expanded(
                        child: Row(
                          children: <Widget>[
                            CircleAvatar(
                              backgroundColor: Colors.transparent,
                              backgroundImage: CachedNetworkImageProvider(historias[index].establishmentLogo), //('http://ce2019121721001.dnssw.net/storage/logos/default.jpg'), //CachedNetworkImageProvider(historialList[0].logo),
                              radius: 25.0,
                            ),
                            SizedBox(width: 7.0),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: <Widget>[
                                Text(
                                  historias[index].establishment,
                                  //historialList[0].nombreVet,
                                  style: TextStyle(
                                    color: Colors.black87,
                                    fontSize: 17.0,
                                    fontWeight: FontWeight.w600
                                  ),
                                ),
                                iconosHistoria(historias[index].details)
                                //Icon( IconProypet.consulta ,size: 18.0,color: Colors.black.withOpacity(.5)),
                              ],
                            ),
                          ],
                        ),
                      ),
                      Column(
                        children: <Widget>[
                          Text(
                            historias[index].createdAt.toString().split(' ')[0],
                            style: TextStyle(color: Colors.black.withOpacity(.71),fontSize: 12.0,fontWeight: FontWeight.w600),
                          ),
                          Text(
                            historias[index].createdAt.toString().split(' ')[1],
                            style: TextStyle(color: colorMain,fontSize: 16.0,fontWeight: FontWeight.w600),
                            textAlign: TextAlign.center,
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            );
          } 
        );
        }
      },
    );

  }


  iconosHistoria(json){
    List<String> listaIcon=[];
    if(json.toString().contains("grooming")) listaIcon.add("grooming");
    if(json.toString().contains("surgery")) listaIcon.add("surgery");
    if(json.toString().contains("deworming")) listaIcon.add("deworming");
    if(json.toString().contains("vaccination")) listaIcon.add("vaccination");
    if(json.toString().contains("consultation")) listaIcon.add("consultation");

    print(listaIcon);
    return 
      // onTap: ()=>Navigator.pushNamed(context, 'detallehistoriamascota', arguments: { "slug":listaIcon, "detalle":json } ),
      Row(
        children: <Widget>[
          (json.toString().contains("grooming"))
            ? Padding(
              padding: const EdgeInsets.symmetric(horizontal: 2.0),
              child: Icon( iconMap["grooming"] ,size: 18.0,color: Colors.black.withOpacity(.5)),
            )
            : SizedBox(),
          (json.toString().contains("surgery"))
            ? Padding(
              padding: const EdgeInsets.symmetric(horizontal: 2.0),
              child: Icon( iconMap["surgery"] ,size: 18.0,color: Colors.black.withOpacity(.5)),
            )
            : SizedBox(),
          (json.toString().contains("deworming"))
            ? Padding(
              padding: const EdgeInsets.symmetric(horizontal: 2.0),
              child: Icon( iconMap["deworming"] ,size: 18.0,color: Colors.black.withOpacity(.5)),
            )
            : SizedBox(),
          (json.toString().contains("vaccination"))
            ? Padding(
              padding: const EdgeInsets.symmetric(horizontal: 2.0),
              child: Icon( iconMap["vaccination"] ,size: 18.0,color: Colors.black.withOpacity(.5)),
            )
            : SizedBox(),
          (json.toString().contains("consultation"))
            ? Padding(
              padding: const EdgeInsets.symmetric(horizontal: 2.0),
              child: Icon( iconMap["consultation"] ,size: 18.0,color: Colors.black.withOpacity(.5)),
            )
            : SizedBox(),
        ],
      )
    ;

  }
}
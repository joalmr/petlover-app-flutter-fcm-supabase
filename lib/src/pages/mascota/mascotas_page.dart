import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

import 'package:proypet/src/model/mascota/mascota_model.dart';
import 'package:proypet/src/pages/mascota/mascotas_agregar_page.dart';

import 'package:proypet/src/pages/shared/appbar_menu.dart';
import 'package:proypet/src/pages/shared/form_control/button_primary.dart';
import 'package:proypet/src/pages/shared/snackbar.dart';
import 'package:proypet/src/pages/shared/styles/styles.dart';
import 'package:proypet/src/providers/mascota_provider.dart';
import 'package:proypet/src/utils/utils.dart';

class MascotasPage extends StatefulWidget {

  @override
  _MascotasPageState createState() => _MascotasPageState();
}

class _MascotasPageState extends State<MascotasPage> {
  final mascotaProvider = MascotaProvider();  
  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: scaffoldKey,
      appBar: appbar(
        // null,
        Text('Agregar mascota',
          style: TextStyle(
            fontSize: 16.0,
            fontWeight: FontWeight.normal
          ),
        ),
        null,
      ),
      body: _mascotas(),
    );
    
  }

  Widget _mascotas(){
    return FutureBuilder(
      future: mascotaProvider.getPets(),
      builder: (BuildContext context, AsyncSnapshot<List<MascotaModel>> snapshot){
        final mydata=snapshot.data;
        if(!snapshot.hasData){
          return Center(child: CircularProgressIndicator());
        }
        else{
          return CustomScrollView(
            slivers: <Widget>[
              SliverToBoxAdapter(
                child: Column(
                  children: <Widget>[
                    SizedBox(height: 15.0,),
                    buttonPri('Agregar mascota',()=>Navigator.push(context, MaterialPageRoute(
                      builder: (_)=>MascotaAgregarPage(),
                    ))),
                    SizedBox(height: 10.0,),
                  ],
                ),
              ),
              SliverList(
                delegate: SliverChildBuilderDelegate(
                  (BuildContext context, int index){
                    var mascota = mydata[index % mydata.length];
                    return listaMascota(mascota);
                  },
                  childCount: mydata.length,
                ),
              ),
            ],
          );
        }
      }
    );
  }

  listaMascota(MascotaModel mascota){
    return Dismissible(
      key: UniqueKey(),
      direction: DismissDirection.endToStart,
      background: Container(
        color: Colors.red[300],
      ),
      confirmDismiss: (fn)=>showDialog(
        context: context,
        builder: (BuildContext context){
          return AlertDialog(
            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10.0)),
            title: Text('Eliminar'),
            content: Text('Seguro que desea eliminar a ${mascota.name}?'),
            actions: <Widget>[
              FlatButton(
                onPressed: ()=>Navigator.pop(context), 
                child: Text('Cancelar')
              ),
              FlatButton(
                onPressed: () async {
                  bool resp = await mascotaProvider.deletePet(mascota.id);
                  if(resp){
                    mostrarSnackbar("Se eliminó a ${mascota.name}", colorMain, scaffoldKey);
                    Navigator.pushReplacementNamed(context, 'mismascotas');
                    //Navigator.pop(context);
                    // Navigator.pushNamed(context, 'mismascotas');
                    // Navigator.of(context).popAndPushNamed('mismascotas');
                    // Timer(
                    //   Duration(milliseconds: 2500), (){
                    //     Navigator.of(context).pushReplacementNamed('mismascotas');   
                    //   }
                    // );
                  }
                  else{
                    mostrarSnackbar("No se eliminó a ${mascota.name}", Colors.red[300], scaffoldKey);
                    Navigator.pop(context);
                  }
                },
                child: Text('Sí, eliminar')
              )
            ],
          );
        }
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 5.0),
        child: ListTile(
          isThreeLine: true,
          leading: CircleAvatar(
            radius: 28.0,
            backgroundImage: (mascota.picture == 'http://ce2019121721001.dnssw.net/storage/') ? AssetImage('images/proypet.png') : CachedNetworkImageProvider(mascota.picture),
          ),
          title: Text(mascota.name,
            style: const TextStyle(
              fontSize: 16.0,
              fontWeight: FontWeight.bold,
            ),
          ),
          subtitle: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Text(
                mascota.breedName,
                overflow: TextOverflow.ellipsis,
                style: const TextStyle(
                  fontSize: 14.0,
                  color: Colors.black54,
                ),
              ),
              const Padding(padding: EdgeInsets.only(bottom: 2.0)),
              Text(
                calculateAge(mascota.birthdate),
                style: const TextStyle(
                  fontSize: 12.0,
                  color: Colors.black87,
                ),
              ),
            ],
          ),
          // onTap: ()=>Navigator.push(context, MaterialPageRoute(
          //   builder: (_)=>MascotaDetallePage(modelMascota: mascota,),)),
          trailing: IconButton(
            icon: Icon(Icons.edit,color: Colors.blue[300]), 
            onPressed: ()=>Navigator.pushNamed(context, 'agregarmascota', arguments: mascota)
            // Navigator.push(context, MaterialPageRoute(
            //     builder: (_)=>MascotaAgregarPage(),
            // ))
          ),
        ),
      ),
    );
  }
  // void mostrarSnackbar(String mensaje, Color color){
  //   final snackbar = SnackBar(
  //     content: Text(mensaje),
  //     duration: Duration(milliseconds: 2500),
  //     backgroundColor: color,
  //   );
  //   scaffoldKey.currentState.showSnackBar(snackbar);    
  // }
}



// return Container(
//     height: 115.0,
//     margin: EdgeInsets.symmetric(vertical: 5.0,horizontal: 15.0),
//     padding: EdgeInsets.symmetric(horizontal: 10.0,vertical: 10.0),
//     decoration: BoxDecoration(
//       color: Colors.grey[100],
//       borderRadius: BorderRadius.circular(10.0),
//     ),
//     child: Row(
//       children: <Widget>[
//         Container(
//           width: 80.0,
//           height: 80.0,
//           decoration: new BoxDecoration(
//             shape: BoxShape.circle,
//             image: DecorationImage(
//                 fit: BoxFit.cover,
//                 image: mascota.picture == 'http://ce2019121721001.dnssw.net/storage/' 
//                   ? AssetImage('images/proypet.png') 
//                   : CachedNetworkImageProvider(mascota.picture)//AssetImage('images/greco.png')
//             )
//           )
//         ),
//         Expanded(
//           child: Padding(
//             padding: const EdgeInsets.fromLTRB(15.0, 0.0, 2.0, 0.0),
//             child: Column(
//               crossAxisAlignment: CrossAxisAlignment.start,
//               children: <Widget>[
//                 Column(
//                   crossAxisAlignment: CrossAxisAlignment.start,
//                   children: <Widget>[
//                     Text(
//                       mascota.name,
//                       maxLines: 2,
//                       overflow: TextOverflow.ellipsis,
//                       style: const TextStyle(
//                         fontSize: 16.0,
//                         fontWeight: FontWeight.bold,
//                       ),
//                     ),
//                     const Padding(padding: EdgeInsets.only(bottom: 2.0)),
//                     Text(
//                       mascota.breedName,
//                       maxLines: 2,
//                       overflow: TextOverflow.ellipsis,
//                       style: const TextStyle(
//                         fontSize: 14.0,
//                         color: Colors.black54,
//                       ),
//                     ),
//                     const Padding(padding: EdgeInsets.only(bottom: 2.0)),
//                     Text(
//                       calculateAge(mascota.birthdate),
//                       style: const TextStyle(
//                         fontSize: 12.0,
//                         color: Colors.black87,
//                       ),
//                     ),
//                     Row(
//                       children: <Widget>[
//                         Padding(
//                           padding: const EdgeInsets.symmetric(horizontal: 5.0,vertical: 5.0),
//                           child: InkWell(
//                             child: Icon(Icons.edit,color: Colors.blue[300]),
//                             //onTap: ()=>Navigator.pushNamed(context, 'editarmascota', arguments: mascota)
//                             onTap: ()=>Navigator.push(context, MaterialPageRoute(
//                               builder: (_)=>MascotasEditarPage(),
//                             )),
//                           )
//                         ),
//                         Padding(
//                           padding: const EdgeInsets.symmetric(horizontal: 5.0,vertical: 5.0),
//                           child: InkWell(
//                             child: Icon(Icons.delete,color: Colors.red[300]),
//                             onTap: ()=>showDialog(
//                               context: context,
//                               builder: (BuildContext context){
//                                 return AlertDialog(
//                                   shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10.0)),
//                                   title: Text('Eliminar'),
//                                   content: Text('Seguro que desea eliminar a ${mascota.name}?'),
//                                   actions: <Widget>[
//                                     FlatButton(
//                                       onPressed: ()=>Navigator.pop(context), 
//                                       child: Text('Cancelar')
//                                     ),
//                                     FlatButton(
//                                       onPressed: () async {
//                                         bool resp = await mascotaProvider.deletePet(mascota.id);
//                                         if(resp){
//                                           mostrarSnackbar("Se eliminó a ${mascota.name}", colorMain);
//                                           Navigator.pushReplacementNamed(context, 'mismascotas');
//                                           //Navigator.pop(context);
//                                           // Navigator.pushNamed(context, 'mismascotas');
//                                           // Navigator.of(context).popAndPushNamed('mismascotas');
//                                           // Timer(
//                                           //   Duration(milliseconds: 2500), (){
//                                           //     Navigator.of(context).pushReplacementNamed('mismascotas');   
//                                           //   }
//                                           // );
//                                         }
//                                         else{
//                                           mostrarSnackbar("No se eliminó a ${mascota.name}", Colors.red[300]);
//                                           Navigator.pop(context);
//                                         }
//                                       },
//                                       child: Text('Sí, eliminar')
//                                     )
//                                   ],
//                                 );
//                               }
//                             )
//                           )
//                         ),
//                       ],
//                     ) 
//                   ],
//                 )
//               ],
//             ),
//           ),
//         ),
//       ],
//     ),
//   );
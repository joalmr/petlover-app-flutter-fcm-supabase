import 'package:flutter/material.dart';
import 'package:proypet/src/model/mascota/mascota1_model.dart';
import 'package:proypet/src/model/mascota/mascota_model.dart';
import 'package:proypet/src/pages/mascotas_agregar_page.dart';
import 'package:proypet/src/pages/mascotas_editar_page.dart';

import 'package:proypet/src/pages/shared/appbar_menu.dart';
import 'package:proypet/src/pages/shared/form_control/button_primary.dart';
import 'package:proypet/src/providers/mascota_provider.dart';

class MascotasPage extends StatelessWidget {

  final mascotaProvider = MascotaProvider();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appbar2(
        null,
        Text('Agregar mascota',
          style: TextStyle(
            fontSize: 16.0,
            fontWeight: FontWeight.normal
          ),
        ),
        null
      ),
      body: _mascotas(),
    );
    
  }

  // Future<Null> obtenerPagina1() async{
  //   final duration = new Duration(seconds: 2);
  //   new Timer(duration, (){
      
  //   });
  // }

  Widget _mascotas(){
    return FutureBuilder(
      future: mascotaProvider.getPets(),
      builder: (BuildContext context, AsyncSnapshot<MascotaModel> snapshot){
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
                    var mascota = mydata.pets[index % mydata.pets.length];
                    return Container(
                      height: 110.0,
                      margin: EdgeInsets.symmetric(vertical: 5.0,horizontal: 15.0),
                      padding: EdgeInsets.symmetric(horizontal: 10.0,vertical: 10.0),
                      decoration: BoxDecoration(
                        color: Colors.grey[100],
                        borderRadius: BorderRadius.circular(5.0),
                      ),
                      child: Row(
                        children: <Widget>[
                          Container(
                            width: 80.0,
                            height: 80.0,
                            decoration: new BoxDecoration(
                              shape: BoxShape.circle,
                              image: DecorationImage(
                                  fit: BoxFit.fill,
                                  image: AssetImage('images/greco.png')//NetworkImage(mascota.picture)
                              )
                            )
                          ),
                          Expanded(
                            child: Padding(
                              padding: const EdgeInsets.fromLTRB(15.0, 0.0, 2.0, 0.0),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: <Widget>[
                                  Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: <Widget>[
                                      Text(
                                        mascota.name,
                                        maxLines: 2,
                                        overflow: TextOverflow.ellipsis,
                                        style: const TextStyle(
                                          fontSize: 16.0,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                      const Padding(padding: EdgeInsets.only(bottom: 2.0)),
                                      Text(
                                        mascota.breed,
                                        maxLines: 2,
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
                                      Row(
                                        children: <Widget>[
                                          Padding(
                                            padding: const EdgeInsets.symmetric(horizontal: 5.0,vertical: 5.0),
                                            child: InkWell(
                                              child: Icon(Icons.edit,color: Colors.blue[300]),
                                              onTap: ()=>Navigator.push(context, MaterialPageRoute(
                                                builder: (_)=>MascotasEditarPage(),
                                              )),
                                            )
                                          ),
                                          Padding(
                                            padding: const EdgeInsets.symmetric(horizontal: 5.0,vertical: 5.0),
                                            child: InkWell(
                                              child: Icon(Icons.delete,color: Colors.red[300]),
                                              onTap: (){},
                                            )
                                          ),
                                        ],
                                      ) 
                                    ],
                                  )
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                    );
                  },
                  childCount: mydata.pets.length
                ),
              ),
            ],
          );
        }

      }
    );
  }

}

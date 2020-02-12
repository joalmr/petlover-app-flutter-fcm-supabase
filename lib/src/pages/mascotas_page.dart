import 'package:flutter/material.dart';
import 'package:proypet/main.dart';
import 'package:proypet/src/pages/mascotas_agregar_page.dart';
import 'package:proypet/src/pages/mascotas_editar_page.dart';
import 'package:proypet/src/pages/model/mascota/mascota_model.dart';
import 'package:proypet/src/pages/shared/form_control.dart';
import 'package:proypet/src/pages/shared/form_control/button_primary.dart';
import 'package:proypet/src/pages/shared/styles/styles.dart';


final mascotas=[
  {'nombre':'Greco','raza':'Cocker spaniel','edad':'4 años 1 mes','foto':'images/greco.png'},
  {'nombre':'Greco','raza':'Cocker spaniel','edad':'4 años 1 mes','foto':'images/greco.png'},
  {'nombre':'Greco','raza':'Cocker spaniel','edad':'4 años 1 mes','foto':'images/greco.png'},
];

class MascotasPage extends StatelessWidget {
  //static const String _title = 'Flutter Code Sample';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: colorMain,
        title: Text('Mis mascotas',
          style: TextStyle(
            fontSize: 16.0,
            fontWeight: FontWeight.normal
          ),
        ),
        elevation: 0,
      ),
      body: CustomScrollView(
        slivers: <Widget>[
          SliverToBoxAdapter(
            child: Column(
              children: <Widget>[
                SizedBox(height: 15.0,),
                // FormControl().buttonSec('Agregar mascota',()=>Navigator.push(context, MaterialPageRoute(
                //   builder: (_)=>MascotaAgregarPage(),
                // ))),
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
                return _buildMascotas(context,index);
              },
              childCount: mascotas.length
            ),
          ),
        ],
      ),
    );
    
  }

  // Future<Null> obtenerPagina1() async{
  //   final duration = new Duration(seconds: 2);
  //   new Timer(duration, (){
      
  //   });
  // }

}

Widget _buildMascotas(BuildContext context, int index){
  var mascota = mascotaList[index % mascotaList.length];
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
                image: AssetImage(mascota.foto)
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
                      mascota.nombre,
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                      style: const TextStyle(
                        fontSize: 16.0,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const Padding(padding: EdgeInsets.only(bottom: 2.0)),
                    Text(
                      mascota.raza,
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                      style: const TextStyle(
                        fontSize: 14.0,
                        color: Colors.black54,
                      ),
                    ),
                    const Padding(padding: EdgeInsets.only(bottom: 2.0)),
                    Text(
                      mascota.edad,
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
}

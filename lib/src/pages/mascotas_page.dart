import 'package:flutter/material.dart';
import 'package:proypet/src/pages/shared/navigation_bar.dart';

import '../../main.dart';

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
           
        body: CustomScrollView(
          slivers: <Widget>[
            SliverAppBar(
            expandedHeight: 82.5,
            backgroundColor: colorMain,
            floating: true,
            flexibleSpace: ListView(
              children: <Widget>[
                SizedBox(height: 35.0,),
                Text('Mis mascotas', 
                  textAlign: TextAlign.center, 
                  style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                    fontSize: 20.0
                  )
                ),
              ],
            ),
          ),
            SliverToBoxAdapter(child: SizedBox(height: 0.0,),),
            SliverList(
              delegate: SliverChildBuilderDelegate(
                (BuildContext context, int index){
                  return _buildMascotas(context,index);
                },
                childCount: mascotas.length
              ),
            )
          ],
        ),
        //bottomNavigationBar: NavigationBar(),
      );
  }




  Widget _buildMascotas(BuildContext context, int index){
    var mascota = mascotas[index % mascotas.length];
    return Container(
      height: 110.0,
      padding: EdgeInsets.symmetric(horizontal: 20.0,vertical: 10.0),
      child: Row(
        children: <Widget>[
          AspectRatio(
            aspectRatio: 1.0,
            child: Image(image: AssetImage(mascota['foto']),),
          ),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.fromLTRB(20.0, 0.0, 2.0, 0.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Text(
                        mascota['nombre'],
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis,
                        style: const TextStyle(
                          fontSize: 16.0,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const Padding(padding: EdgeInsets.only(bottom: 2.0)),
                      Text(
                        mascota['raza'],
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis,
                        style: const TextStyle(
                          fontSize: 14.0,
                          color: Colors.black54,
                        ),
                      ),
                      const Padding(padding: EdgeInsets.only(bottom: 2.0)),
                      Text(
                        mascota['edad'],
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
                              onTap: (){},
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
                  ),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}


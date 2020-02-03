import 'package:flutter/material.dart';
import 'package:flutter_swiper/flutter_swiper.dart';
import 'package:proypet/main.dart';
import 'package:proypet/src/pages/mascota_detalle_page.dart';
import 'package:proypet/src/pages/mascotas_page.dart';
import 'package:proypet/src/pages/model/mascota_model.dart';
import 'package:proypet/src/pages/model/vet_model.dart';

final List publicidad = ['images/elegante1.jpg','images/royal1.jpg'];
class HomePage extends StatelessWidget {
  //final GlobalKey<ScaffoldState> _key = GlobalKey<ScaffoldState>();
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        padding: EdgeInsets.all(15.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            SizedBox(height: 35.0,),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Text(
                  "Hola,",
                  style: Theme.of(context)
                      .textTheme
                      .display1
                      .apply(color: Colors.grey[500]),
                ),
                IconButton(
                  icon: Icon(Icons.settings), 
                  onPressed: (){}
                )
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Text(
                  "Alonso",
                  style: Theme.of(context)
                      .textTheme
                      .display1
                      .apply(color: Colors.black87, fontWeightDelta: 2),
                ),                
              ],
            ),
            SizedBox(
              height: 25.0,
            ),
            Container(
              height: 250.0,
              width: double.infinity,
              child: Stack(
                children: <Widget>[
                  Swiper(
                    onTap: (index)=>Navigator.push(context, MaterialPageRoute(
                      builder: (_)=>MascotaDetallePage(idmascota:  index),
                    )),
                    itemBuilder: (BuildContext context, int index){
                      return Container(    
                        decoration: BoxDecoration(
                          color: colorMain,
                          borderRadius: BorderRadius.circular(15.0),
                          image: DecorationImage(
                            image: AssetImage(mascotaList[index].foto),
                            fit: BoxFit.cover
                          ),
                        ),
                        child: Container(
                          child: 
                            Column(
                              mainAxisAlignment: MainAxisAlignment.end,
                              children: <Widget>[
                                Container(
                                  width: double.infinity,
                                  color: Colors.white38,
                                  padding: EdgeInsets.symmetric(vertical: 7.5),
                                  child: Center(
                                    child: Text(mascotaList[index].nombre,
                                      style: TextStyle(
                                        fontSize: 18.0,
                                        fontWeight: FontWeight.w400
                                      ),
                                    ),
                                  ),
                                )
                              ],
                            )
                        ),
                      );
                    },
                    viewportFraction: 0.75,
                    scale: 0.75,
                    itemCount: mascotaList.length,
                    loop: false,
                  ),
                  Positioned(
                    top: 0.0,
                    right: 0.0,
                    child: FloatingActionButton(
                      onPressed: ()=>Navigator.push(context, MaterialPageRoute(
                        builder: (_)=>MascotasPage(),
                      )),
                      child: Icon(Icons.playlist_add),
                    ),
                  ),
                ],
              ),
            ),
            Container(
              margin: EdgeInsets.symmetric(vertical: 25.0),
              //height: MediaQuery.of(context).size.height / 4,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.start,
                children: <Widget>[
                  Text(' Qué estás buscando?',
                  style: TextStyle(
                    color: Colors.black87,
                    fontSize: 24.0,
                    fontWeight: FontWeight.w300),),
                  SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    child: Row(
                      children: <Widget>[
                        Container(
                          margin: EdgeInsets.symmetric(horizontal: 15.0, vertical: 15.0),
                          width: 120.0,
                          height: 100.0,
                          padding: EdgeInsets.all(15.0),
                          decoration: BoxDecoration(
                            color: Colors.blue[600],
                            borderRadius: BorderRadius.circular(15.0),
                            boxShadow: [
                              BoxShadow(color: Colors.grey[200], blurRadius: 14),
                            ],
                          ),
                        ),
                        Container(
                          margin: EdgeInsets.symmetric(horizontal: 15.0, vertical: 15.0),
                          width: 120.0,
                          height: 100.0,
                          padding: EdgeInsets.all(15.0),
                          decoration: BoxDecoration(
                            color: Colors.red[600],
                            borderRadius: BorderRadius.circular(15.0),
                            boxShadow: [
                              BoxShadow(color: Colors.grey[200], blurRadius: 14),
                            ],
                          ),
                        ),
                        Container(
                          margin: EdgeInsets.symmetric(horizontal: 15.0, vertical: 15.0),
                          width: 120.0,
                          height: 100.0,
                          padding: EdgeInsets.all(15.0),
                          decoration: BoxDecoration(
                            color: Colors.brown[600],
                            borderRadius: BorderRadius.circular(15.0),
                            boxShadow: [
                              BoxShadow(color: Colors.grey[200], blurRadius: 14),
                            ],
                          ),
                        ),
                        Container(
                          margin: EdgeInsets.symmetric(horizontal: 15.0, vertical: 15.0),
                          width: 120.0,
                          height: 100.0,
                          padding: EdgeInsets.all(15.0),
                          decoration: BoxDecoration(
                            color: Colors.indigo[600],
                            borderRadius: BorderRadius.circular(15.0),
                            boxShadow: [
                              BoxShadow(color: Colors.grey[200], blurRadius: 14),
                            ],
                          ),
                        ),
                      ],
                    ),
                  )
                ],
              ),
            ),
            SizedBox(height: 25.0),
            Row(
              children: <Widget>[
                Expanded(
                  child: Text(
                    "Próxima atención",
                    style: Theme.of(context)
                        .textTheme
                        .title
                        .apply(color: Colors.black87, fontWeightDelta: 1),
                  ),
                ),
                Icon(Icons.timelapse, color: Colors.black.withOpacity(.71)),
                Text(
                  " Mañana",
                  style: TextStyle(color: Colors.black.withOpacity(.71)),
                ),
              ],
            ),
            Divider(height: 20.0,),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Flexible(
                  flex: 3,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Text(
                        vetLocales[1].nombre,
                        style: Theme.of(context)
                            .textTheme
                            .title
                            .apply(color: Colors.black87, fontWeightDelta: 1),
                      ),
                      Text(
                        vetLocales[1].direccion,
                        style: TextStyle(color: Colors.black.withOpacity(.71)),
                      ),
                      // Text(
                      //   "Originator: Cybdom Tech",
                      //   style: TextStyle(color: Colors.black.withOpacity(.71)),
                      // ),
                    ],
                  ),
                ),
                Flexible(
                  child: Column(
                    children: <Widget>[
                      Text(
                        "17:00",
                        style: Theme.of(context).textTheme.title.apply(
                            color: colorMain[900], fontWeightDelta: 1),
                        textAlign: TextAlign.center,
                      ),
                      RaisedButton(
                        color: colorMain,
                        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10.0)),
                        child: Text("Ver", style: TextStyle(color: Colors.white),),
                        onPressed: () {},
                      )
                    ],
                  ),
                )
              ],
            )
          ],
        ),
      ),
    );
      
  }
}

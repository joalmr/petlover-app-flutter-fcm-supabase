import 'package:flutter/material.dart';
import 'package:flutter_swiper/flutter_swiper.dart';
import 'package:proypet/main.dart';
import 'package:proypet/src/pages/mascota_detalle_page.dart';
import 'package:proypet/src/pages/mascotas_page.dart';
import 'package:proypet/src/pages/model/mascota/mascota_model.dart';
import 'package:proypet/src/pages/model/vet_model.dart';
import 'package:proypet/src/pages/shared/navigation_bar.dart';
import 'package:proypet/src/pages/shared/styles/styles.dart';

final List publicidad = ['images/elegante1.jpg','images/royal1.jpg'];
class HomePage extends StatelessWidget {
  //final GlobalKey<ScaffoldState> _key = GlobalKey<ScaffoldState>();
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: ListView(
              padding: EdgeInsets.symmetric(horizontal: 20.0),
              
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
                        itemCount: mascotaList.length,
                        itemBuilder: (BuildContext context, int index){
                          return ClipRRect(
                            borderRadius: BorderRadius.circular(15.0),
                            child: Stack(
                              children: <Widget>[
                                Container(
                                  height: 250.0,
                                  width: double.infinity,
                                  foregroundDecoration: BoxDecoration(
                                    color: Colors.black.withOpacity(0.15),
                                  ),
                                  child: Image(
                                    image: AssetImage(mascotaList[index].foto),
                                    fit: BoxFit.cover,
                                  ),
                                ),

                                Positioned(
                                  top: 15.0,
                                  left: 10.0,
                                  child: Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    children: <Widget>[
                                      Text(
                                        mascotaList[index].nombre,
                                        style: TextStyle(
                                          fontSize: 22,
                                          fontWeight: FontWeight.bold,
                                          color: Colors.white,
                                        ),
                                      ),
                                      Text(
                                        mascotaList[index].raza,
                                        style: TextStyle(
                                          fontSize: 16,
                                          fontWeight: FontWeight.w400,
                                          color: Colors.white,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),

                                Positioned(
                                  bottom: 10.0,
                                  left: 10.0,
                                  child: Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    children: <Widget>[
                                      RichText(
                                        text: TextSpan(
                                          children: [
                                            TextSpan(
                                              text: mascotaList[index].peso,
                                              style: Theme.of(context)
                                                  .textTheme
                                                  .display1
                                                  .apply(color: Colors.white, fontWeightDelta: 2),
                                            ),
                                            TextSpan(text: " kg.")
                                          ],
                                        ),
                                      ),
                                      Row(
                                        children: <Widget>[
                                          Icon(Icons.cake, color: Colors.grey[300]),
                                          SizedBox(width: 5.0),
                                          Text(
                                            mascotaList[index].edad,
                                            style: TextStyle(color: Colors.grey[300]),
                                          )
                                        ],
                                      ),
                                    ],
                                  ),
                                ),

                                Positioned(
                                  bottom: 10.0,
                                  right: 10.0,
                                  child: RaisedButton(
                                    padding: EdgeInsets.symmetric(
                                        horizontal: 15.0, vertical: 11.0),
                                    color: Colors.black.withOpacity(0.15),
                                    onPressed: ()=>Navigator.push(context, MaterialPageRoute(
                                      builder: (_)=>MascotaDetallePage(idmascota:  index),
                                    )),
                                    child: Text(
                                      'Ver más',
                                      style: TextStyle(
                                          color: Colors.white,
                                          fontWeight: FontWeight.bold),
                                    ),
                                    shape: RoundedRectangleBorder(
                                        borderRadius: new BorderRadius.circular(9.0),
                                        side: BorderSide(color: Colors.white)),
                                  ),
                                ),
                              ],
                              
                            ),
                          );
                        },
                        viewportFraction: 0.79,
                        scale: 0.77,                        
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

                Column(
                  children: <Widget>[
                    Container(
                      margin: EdgeInsets.symmetric(vertical: 25.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: <Widget>[
                          Text(' Qué estás buscando?',
                          style: TextStyle(
                            color: Colors.black87,
                            fontSize: 24.0,
                            fontWeight: FontWeight.w300),),
                          SizedBox(height: 15.0),
                          SingleChildScrollView(
                            scrollDirection: Axis.horizontal,
                            child: Row(
                              children: <Widget>[
                                InkWell(
                                  onTap: ()=>Navigator.push(
                                    context,MaterialPageRoute(
                                      builder: (context) => NavigationBar(currentTabIndex: 2,)
                                  )),
                                  child: Stack(
                                    children: <Widget>[
                                      Container(
                                        width: 120.0,
                                        height: 100.0,
                                        padding: EdgeInsets.all(15.0),
                                        foregroundDecoration: BoxDecoration(
                                          color: Colors.black.withOpacity(0.25),
                                          borderRadius: BorderRadius.circular(15.0),
                                        ),
                                        //padding: EdgeInsets.all(25.0),
                                        decoration: BoxDecoration(
                                          borderRadius: BorderRadius.circular(15.0),
                                          image: DecorationImage(
                                            fit: BoxFit.cover,
                                            image: AssetImage('images/v_consulta.jpg'),
                                          )
                                        ),
                                      ),
                                      Container(
                                        width: 120.0,
                                        height: 100.0,
                                        child: Center(
                                          child: Text('Consulta',style: TextStyle(color: Colors.white)),
                                        ),
                                      )
                                    ],
                                  ),
                                ),
                                SizedBox(width: 15.0),
                                InkWell(
                                  onTap: ()=>Navigator.push(
                                    context,MaterialPageRoute(
                                      builder: (context) => NavigationBar(currentTabIndex: 2,)
                                  )),
                                  child: Stack(
                                    children: <Widget>[
                                      Container(
                                        width: 120.0,
                                        height: 100.0,
                                        padding: EdgeInsets.all(15.0),
                                        foregroundDecoration: BoxDecoration(
                                          color: Colors.black.withOpacity(0.25),
                                          borderRadius: BorderRadius.circular(15.0),
                                        ),
                                        //padding: EdgeInsets.all(25.0),
                                        decoration: BoxDecoration(
                                          borderRadius: BorderRadius.circular(15.0),
                                          image: DecorationImage(
                                            fit: BoxFit.cover,
                                            image: AssetImage('images/v_vacuna.jpeg'),
                                          )
                                        ),
                                      ),
                                      Container(
                                        width: 120.0,
                                        height: 100.0,
                                        child: Center(
                                          child: Text('Vacuna',style: TextStyle(color: Colors.white)),
                                        ),
                                      )
                                    ],
                                  ),
                                ),
                                SizedBox(width: 15.0),
                                InkWell(
                                  onTap: ()=>Navigator.push(
                                    context,MaterialPageRoute(
                                      builder: (context) => NavigationBar(currentTabIndex: 2,)
                                  )),
                                  child: Stack(
                                    children: <Widget>[
                                      Container(
                                        width: 120.0,
                                        height: 100.0,
                                        padding: EdgeInsets.all(15.0),
                                        foregroundDecoration: BoxDecoration(
                                          color: Colors.black.withOpacity(0.25),
                                          borderRadius: BorderRadius.circular(15.0),
                                        ),
                                        //padding: EdgeInsets.all(25.0),
                                        decoration: BoxDecoration(
                                          borderRadius: BorderRadius.circular(15.0),
                                          image: DecorationImage(
                                            fit: BoxFit.cover,
                                            image: AssetImage('images/v_banio.jpg'),
                                          )
                                        ),
                                      ),
                                      Container(
                                        width: 120.0,
                                        height: 100.0,
                                        child: Center(
                                          child: Text('Baño',style: TextStyle(color: Colors.white)),
                                        ),
                                      )
                                    ],
                                  ),
                                ),
                                SizedBox(width: 15.0),
                                InkWell(
                                  onTap: ()=>Navigator.push(
                                    context,MaterialPageRoute(
                                      builder: (context) => NavigationBar(currentTabIndex: 2,)
                                  )),
                                  child: Stack(
                                    children: <Widget>[
                                      Container(
                                        width: 120.0,
                                        height: 100.0,
                                        padding: EdgeInsets.all(15.0),
                                        foregroundDecoration: BoxDecoration(
                                          color: Colors.black.withOpacity(0.25),
                                          borderRadius: BorderRadius.circular(15.0),
                                        ),
                                        //padding: EdgeInsets.all(25.0),
                                        decoration: BoxDecoration(
                                          borderRadius: BorderRadius.circular(15.0),
                                          image: DecorationImage(
                                            fit: BoxFit.cover,
                                            image: AssetImage('images/v_desparacita.jpg'),
                                          )
                                        ),
                                      ),
                                      Container(
                                        width: 120.0,
                                        height: 100.0,
                                        child: Center(
                                          child: Text('Desparasitación',style: TextStyle(color: Colors.white)),
                                        ),
                                      )
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          )
                        ],
                      ),
                    ),

                    SizedBox(height: 10.0),

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
                      ],
                    ),

                    Column(
                      children: <Widget>[
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: <Widget>[
                            Expanded(
                              child: Row(
                                children: <Widget>[
                                  CircleAvatar(
                                    backgroundImage: AssetImage('images/greco.png'),
                                    radius: 25.0,
                                  ),
                                  SizedBox(width: 7.0),
                                  Column(
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
                                    ],
                                  ),
                                ],
                              ),
                            ),
                            Column(
                              children: <Widget>[
                                Text(
                                  " Mañana",
                                  style: TextStyle(color: Colors.black.withOpacity(.71),fontSize: 12.0,fontWeight: FontWeight.w600),
                                ),
                                Text(
                                  "17:00",
                                  style: TextStyle(color: colorMain[700],fontSize: 16.0,fontWeight: FontWeight.w600),
                                  textAlign: TextAlign.center,
                                ),
                                IconButton(icon: Icon(Icons.delete,color: Colors.red[300],), onPressed: () {}),
                              ],
                            ),
                          ],
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: <Widget>[
                            Expanded(
                              child: Row(
                                children: <Widget>[
                                  CircleAvatar(
                                    backgroundImage: AssetImage('images/greco.png'),
                                    radius: 25.0,
                                  ),
                                  SizedBox(width: 7.0),
                                  Column(
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
                                    ],
                                  ),
                                ],
                              ),
                            ),
                            Column(
                              children: <Widget>[
                                Text(
                                  " Mañana",
                                  style: TextStyle(color: Colors.black.withOpacity(.71),fontSize: 12.0,fontWeight: FontWeight.w600),
                                ),
                                Text(
                                  "17:00",
                                  style: TextStyle(color: colorMain[700],fontSize: 16.0,fontWeight: FontWeight.w600),
                                  textAlign: TextAlign.center,
                                ),
                                IconButton(icon: Icon(Icons.delete,color: Colors.red[300],), onPressed: () {}),
                              ],
                            ),
                          ],
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: <Widget>[
                            Expanded(
                              child: Row(
                                children: <Widget>[
                                  CircleAvatar(
                                    backgroundImage: AssetImage('images/greco.png'),
                                    radius: 25.0,
                                  ),
                                  SizedBox(width: 7.0),
                                  Column(
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
                                    ],
                                  ),
                                ],
                              ),
                            ),
                            Column(
                              children: <Widget>[
                                Text(
                                  " Mañana",
                                  style: TextStyle(color: Colors.black.withOpacity(.71),fontSize: 12.0,fontWeight: FontWeight.w600),
                                ),
                                Text(
                                  "17:00",
                                  style: TextStyle(color: colorMain[700],fontSize: 16.0,fontWeight: FontWeight.w600),
                                  textAlign: TextAlign.center,
                                ),
                                IconButton(icon: Icon(Icons.delete,color: Colors.red[300],), onPressed: () {}),
                              ],
                            ),
                          ],
                        ),
                      ],
                    ),


                  ],
                ),
     
                // SingleChildScrollView(
                //   scrollDirection: Axis.vertical,
                //   child: 
                // )
                  
              ],
              
            ),
    );
      
  }

}

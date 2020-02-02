
import 'package:flutter/material.dart';
import 'package:proypet/main.dart';
import 'package:proypet/src/pages/mascotas_page.dart';
import 'package:proypet/src/pages/model/mascota_model.dart';
import 'package:proypet/src/pages/model/vet_model.dart';
import 'package:proypet/src/pages/shared/appbar_menu.dart';
//import 'package:proypet/src/pages/shared/card_swiper.dart';

final List publicidad = ['images/elegante1.jpg','images/royal1.jpg'];
class HomePage extends StatelessWidget {
  //final GlobalKey<ScaffoldState> _key = GlobalKey<ScaffoldState>();
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        iconTheme: IconThemeData(color: Colors.black87),
        elevation: 0,
        //leading: leadingProypet,
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.settings),
            onPressed: (){},
          )
        ],
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(15.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Text(
              "Hola,",
              style: Theme.of(context)
                  .textTheme
                  .display1
                  .apply(color: Colors.grey[500]),
            ),
            Text(
              "Alonso",
              style: Theme.of(context)
                  .textTheme
                  .display1
                  .apply(color: Colors.black87, fontWeightDelta: 2),
            ),
            SizedBox(
              height: 15.0,
            ),
            Container(
              padding: EdgeInsets.all(25.0),
              decoration: BoxDecoration(
                color: colorMain,
                borderRadius: BorderRadius.circular(15.0),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: <Widget>[
                      Container(
                        margin: EdgeInsets.all(2.5),
                        child: CircleAvatar(
                          backgroundColor: colorMain,      
                          backgroundImage: AssetImage(mascotaList[0].foto),
                          radius: 35.0,
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 5.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: <Widget>[
                            Text(
                              mascotaList[0].nombre,
                              style: TextStyle(
                                fontSize: 19,
                                fontWeight: FontWeight.bold,
                                color: Colors.white,
                              ),
                            ),
                            Text(
                              mascotaList[0].raza,
                              style: TextStyle(
                                fontSize: 15,
                                fontWeight: FontWeight.w400,
                                color: Colors.white,
                              ),
                            ),
                          ],
                        ),
                      )

                    ],
                  ),
                  SizedBox(
                    height: 11.0,
                  ),
                  RichText(
                    text: TextSpan(
                      children: [
                        TextSpan(
                          text: mascotaList[0].peso,
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
                        mascotaList[0].edad,
                        style: TextStyle(color: Colors.grey[300]),
                      )
                    ],
                  ),
                  SizedBox(
                    height: 11.0,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: <Widget>[
                      Flexible(
                        child: RaisedButton(
                          padding: EdgeInsets.symmetric(
                              horizontal: 15.0, vertical: 11.0),
                          color: colorMain,
                          onPressed: (){},
                          child: Text(
                            'Historial',
                            style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.bold),
                          ),
                          shape: RoundedRectangleBorder(
                              borderRadius: new BorderRadius.circular(9.0),
                              side: BorderSide(color: Colors.white)),
                        ),
                      ),
                      Flexible(
                        child: RaisedButton(
                          padding: EdgeInsets.symmetric(
                              horizontal: 15.0, vertical: 11.0),
                          color: colorMain[900],
                          onPressed: ()=>Navigator.push(context, MaterialPageRoute(
                            builder: (_)=>MascotasPage(),
                          )),
                          child: Text(
                            'Mis mascotas',
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
                  )
                ],
              ),
            ),
            Container(
              margin: EdgeInsets.symmetric(vertical: 15.0),
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
            SizedBox(height: 15.0),
            Row(
              children: <Widget>[
                Expanded(
                  child: Text(
                    "Próxima atención",
                    style: Theme.of(context)
                        .textTheme
                        .title
                        .apply(color: Colors.black87, fontWeightDelta: 2),
                  ),
                ),
                Icon(Icons.timelapse, color: Colors.black.withOpacity(.71)),
                Text(
                  " Mañana",
                  style: TextStyle(color: Colors.black.withOpacity(.71)),
                ),
              ],
            ),
            Divider(height: 20,),
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
                            .apply(color: Colors.black87, fontWeightDelta: 2),
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
                            color: colorMain[900], fontWeightDelta: 2),
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

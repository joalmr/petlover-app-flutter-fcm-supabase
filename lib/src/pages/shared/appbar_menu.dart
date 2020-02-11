import 'package:flutter/material.dart';
import 'package:proypet/main.dart';
import 'package:proypet/src/pages/model/mascota/mascota_model.dart';

// final leadingProypet = Container(
//     margin: EdgeInsets.all(10.0),
//     //padding: EdgeInsets.symmetric(horizontal: 10.0),
//     decoration: BoxDecoration(
//       shape: BoxShape.circle,
//       color: Colors.transparent,
//     ),
//     child: CircleAvatar(
//       backgroundColor: Colors.transparent,      
//       backgroundImage: AssetImage('images/proypet.png'),
//       //child: Image.asset('images/greco.png'),
//       //radius: 40.0,
//     ),
//   );
final leadingH = Container(
    margin: EdgeInsets.all(.5),
    // //padding: EdgeInsets.symmetric(horizontal: 10.0),
    // // decoration: BoxDecoration(
    // //   shape: BoxShape.circle,
    // //   color: colorSec,
    // // ),
    child: ClipRRect(
      //borderRadius: BorderRadius.circular(100.0),
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 5.0),
        child: Center(child: Image(image: AssetImage('images/proypet.png'))),
      ),
    )
    // CircleAvatar(
    //   backgroundColor: colorMain,      
    //   backgroundImage: AssetImage(mascotaList[0].foto),
    //   //child: Image.asset('images/greco.png'),
    //   //radius: 40.0,
    // ),
  );
final titleH = Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.start,
            children: <Widget>[
              Text("Proypet", style: TextStyle(fontSize: 18.0,),),//mascotaList[0].nombre
              Text("El control de tu mascota en tus manos", 
                style: TextStyle(
                  fontSize: 12.0,
                  fontWeight: FontWeight.w300,
                  color: Colors.grey[300],
                ),
              ),
            ],
          );
final actionsH = <Widget>[
          IconButton(
            icon: Icon(Icons.widgets),
            onPressed: (){},
          )
        ];

class AppbarMenu {

}
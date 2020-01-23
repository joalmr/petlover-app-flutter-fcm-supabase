import 'package:flutter/material.dart';
import 'package:proypet/main.dart';
import 'package:proypet/src/pages/model/mascota_model.dart';

final leadingH = Container(
    margin: EdgeInsets.all(2.5),
    //padding: EdgeInsets.symmetric(horizontal: 10.0),
    decoration: BoxDecoration(
      shape: BoxShape.circle,
      color: colorSec,
    ),
    child: CircleAvatar(
      backgroundColor: colorMain,      
      backgroundImage: AssetImage(mascotaList[0].foto),
      //child: Image.asset('images/greco.png'),
      //radius: 40.0,
    ),
  );
final titleH = Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.start,
            children: <Widget>[
              Text(mascotaList[0].nombre, style: TextStyle(fontSize: 18.0,),),
              Text(mascotaList[0].raza, style: TextStyle(fontSize: 12.0,color: Colors.grey[300]),),
            ],
          );
final actionsH = <Widget>[
          IconButton(
            icon: Icon(Icons.notifications_active),
            onPressed: (){},
          )
        ];

class AppbarMenu {

}
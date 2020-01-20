import 'package:flutter/material.dart';
import 'package:proypet/main.dart';

final leadingH = Container(
    margin: EdgeInsets.all(2.5),
    //padding: EdgeInsets.symmetric(horizontal: 10.0),
    decoration: BoxDecoration(
      shape: BoxShape.circle,
      color: colorSec,
    ),
    child: CircleAvatar(
      backgroundColor: colorMain,      
      backgroundImage: AssetImage('images/greco.png'),
      //child: Image.asset('images/greco.png'),
      //radius: 40.0,
    ),
  );
final titleH = Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.start,
            children: <Widget>[
              Text('Greco', style: TextStyle(fontSize: 18.0,),),
              Text('Cocker spaniel', style: TextStyle(fontSize: 12.0,color: Colors.grey[300]),),
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
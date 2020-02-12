import 'package:flutter/material.dart';


Widget appbar2(inn,titulo,acc){
  PreferredSize appbar =  PreferredSize(
    preferredSize: Size.fromHeight(55.0),
    child: AppBar(
      leading: inn,
      title: titulo,
      actions: acc,
    )
  );
  return appbar;
}

final leadingH = Container(
  margin: EdgeInsets.all(.5),
  child: ClipRRect(
    child: Padding(
      padding: const EdgeInsets.symmetric(vertical: 5.0),
      child: Center(child: Image(image: AssetImage('images/proypet.png'))),
    ),
  )
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

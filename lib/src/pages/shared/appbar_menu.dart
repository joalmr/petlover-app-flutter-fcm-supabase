import 'package:flutter/material.dart';
import 'package:proypet/src/pages/shared/styles/styles.dart';

//double size=55.0;

Widget appbar(inn,titulo,acc){
  return AppBar(
    backgroundColor: colorMain,
    leading: inn,
    title: titulo,
    actions: acc,
  );
}

Widget appbar2(inn,titulo,acc,btnTab){
  return AppBar(
    backgroundColor: colorMain,
    leading: inn,
    title: titulo,
    actions: acc,
    bottom: PreferredSize(
      preferredSize: Size.fromHeight(25),
      child: btnTab,
    ),
  );
  // PreferredSize appbar =  PreferredSize(
  //   preferredSize: Size.fromHeight(80),
  //   child: AppBar(
  //     backgroundColor: colorMain,
  //     leading: inn,
  //     title: titulo,
  //     actions: acc,
  //     bottom: btnTab,
  //   )
  // );
  // return appbar;
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

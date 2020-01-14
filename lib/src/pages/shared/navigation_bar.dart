import 'package:flutter/material.dart';

import '../../../main.dart';

class NavigationBar extends StatelessWidget {
  final sinTexto = Text('',style: TextStyle(fontSize: 1.0),);
  @override
  Widget build(BuildContext context){
  return Theme(
    data: Theme.of(context).copyWith(
      canvasColor: Color.fromRGBO(250, 240, 240, 1.0),
      //primaryColor: colorMain,
      // textTheme: Theme.of(context).textTheme.copyWith(
      //   caption: TextStyle(color: Color.fromRGBO(116, 117, 152, 1.0))
      // )
    ),
    child: BottomAppBar(
      //shape: const CircularNotchedRectangle(),        
      child: BottomNavigationBar(
        iconSize: 26.0,
        unselectedItemColor: Color.fromRGBO(116, 117, 152, 1.0),
        items: <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.pets,),
            title: sinTexto,
            
            activeIcon: Column(
              children: <Widget>[
                Icon(Icons.pets,color: colorMain,),
                Text('Mis mascotas',style: TextStyle(color: colorMain),),
              ],
            ),
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.pets,),
            title: sinTexto,
            activeIcon: Column(
              children: <Widget>[
                Icon(Icons.pets,color: colorMain,),
                Text('Mis mascotas',style: TextStyle(color: colorMain),),
              ],
            )
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.home,),
            title: sinTexto,
            activeIcon: Column(
              children: <Widget>[
                Icon(Icons.pets,color: colorMain,),
                Text('Greco',style: TextStyle(color: colorMain),),
              ],
            )
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.assignment_late,),
            title: sinTexto,
            activeIcon: Column(
              children: <Widget>[
                Icon(Icons.pets,color: colorMain,),
                Text('Atenciones',style: TextStyle(color: colorMain),),
              ],
            )
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.assignment_late,),
            title: sinTexto,
            activeIcon: Column(
              children: <Widget>[
                Icon(Icons.pets,color: colorMain,),
                Text('Atenciones',style: TextStyle(color: colorMain),),
              ],
            )
          ),
        ],
      ),
    ),
  );
}
}
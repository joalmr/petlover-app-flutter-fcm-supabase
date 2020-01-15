import 'package:flutter/material.dart';

import '../../../main.dart';

class NavigationBar extends StatelessWidget {
  final sinTexto = Text('',style: TextStyle(fontSize: 1.0),);
  @override
  Widget build(BuildContext context){
  return BottomAppBar(
      child: BottomNavigationBar(
        iconSize: 26.0,
        fixedColor: colorMain ,
        unselectedItemColor: Color.fromRGBO(116, 117, 152, 1.0),
        items: <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.pets,),
            title: sinTexto,
            
            activeIcon: Column(
              children: <Widget>[
                Icon(Icons.pets,),
                Text('Mascotas',style: TextStyle(color: colorMain),),
              ],
            ),
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.pets,),
            title: sinTexto,
            activeIcon: Column(
              children: <Widget>[
                Icon(Icons.pets,),
                Text('Mascotas',style: TextStyle(color: colorMain),),
              ],
            )
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.home,),
            title: sinTexto,
            activeIcon: Column(
              children: <Widget>[
                Icon(Icons.pets,),
                Text('Greco',style: TextStyle(color: colorMain),),
              ],
            )
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.assignment_late,),
            title: sinTexto,
            activeIcon: Column(
              children: <Widget>[
                Icon(Icons.pets,),
                Text('Atenciones',style: TextStyle(color: colorMain),),
              ],
            )
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.assignment_late,),
            title: sinTexto,
            activeIcon: Column(
              children: <Widget>[
                Icon(Icons.pets,),
                Text('Atenciones',style: TextStyle(color: colorMain),),
              ],
            )
          ),
        ],
      ),
    );
}
}
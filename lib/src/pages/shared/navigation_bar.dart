import 'package:flutter/material.dart';

import '../../../main.dart';

class NavigationBar extends StatelessWidget {

  @override
  Widget build(BuildContext context){
  return Theme(
    data: Theme.of(context).copyWith(
      canvasColor: Color.fromRGBO(250, 240, 240, 1.0),
      primaryColor: colorMain,
      textTheme: Theme.of(context).textTheme.copyWith(
        caption: TextStyle(color: Color.fromRGBO(116, 117, 152, 1.0))
      )
    ),
    child: BottomAppBar(
      //shape: const CircularNotchedRectangle(),        
      child: BottomNavigationBar(
        items: <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.adjust),
            title: Text('Mis mascotas'),
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.album),
            title: Text('Greco')
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.album),
            title: Text('Menu 2')
          ),
        ],
      ),
    ),
  );
}
}
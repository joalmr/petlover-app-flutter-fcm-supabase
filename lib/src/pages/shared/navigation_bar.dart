import 'package:flutter/material.dart';

import '../../../main.dart';

class NavigationBar extends StatelessWidget {
  @override
  Widget build(BuildContext context){
  return BottomAppBar(
    color: Color.fromRGBO(116, 117, 152, 1.0),
      child: BottomNavigationBar(
        iconSize: 28.0,
        selectedItemColor: colorMain,
        type: BottomNavigationBarType.fixed,
        //currentIndex: _selectedIndex,
        //onTap: _onItemTapped,
        items: <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.list,),
            title: Text('Mascotas',style: TextStyle(fontSize: 12.0)),
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.pets,),
            title: Text('Greco',style: TextStyle(fontSize: 12.0)),
          ),
          BottomNavigationBarItem(
            icon: Container(
              height: 50.0,
              width: 50.0,
              decoration: BoxDecoration(
                color: colorSec,
                borderRadius: BorderRadius.circular(100.0),
              ),
              child: Icon(Icons.search,color: Colors.white70,),
            ),
            title: Text('',style: TextStyle(fontSize: 0.0)),
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.assignment_late,),
            title: Text('Atenciones',style: TextStyle(fontSize: 12.0)),
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.notifications,),
            title: Text('Notificaciones',style: TextStyle(fontSize: 12.0)),
          ),
        ],
      ),
    );
  }

}
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:proypet/src/pages/shared/appbar_menu.dart';
import 'package:proypet/src/pages/shared/styles/styles.dart';

class RecompensasPage extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appbar(leadingH,'Recompensas',null),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 20.0, horizontal: 20.0),
              child: Row(
                children: <Widget>[
                  Expanded(
                    flex: 2,
                    child: Container(
                      padding: EdgeInsets.all(8.0),
                      height: 90.0,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10.0),
                        color: colorBlue
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: <Widget>[
                          Text('Puntos acumulados', style: TextStyle(color: Colors.white),),
                          Align(
                            alignment: Alignment.centerRight,
                            child: Padding(
                              padding: const EdgeInsets.only(right: 15.0),
                              child: Text('85', 
                                style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 24.0,),
                              ),
                            )
                          )
                        ],
                      ),
                    )
                  ),
                  SizedBox(width: 10.0,),
                  Expanded(
                    //child: Icon(CupertinoIcons.circle_filled),
                    child: Icon(FontAwesomeIcons.coins, color: colorBlue, size: 40.0,),
                  )
                ],
              ),
            ),
            SizedBox(height: 20.0,),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20.0),
              child: Text('Últimas puntos ganados', style: TextStyle(fontSize: 14.0, fontWeight: FontWeight.bold)),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20.0),
              child: ListTile(
                contentPadding: EdgeInsets.zero,
                title: Text('Veterinaria Prueba 1',style: TextStyle(fontSize: 14.0)),
                trailing: Text('25'),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20.0),
              child: ListTile(
                contentPadding: EdgeInsets.zero,
                title: Text('Veterinaria Prueba 1',style: TextStyle(fontSize: 14.0)),
                trailing: Text('10'),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20.0),
              child: ListTile(
                contentPadding: EdgeInsets.zero,
                title: Text('Veterinaria Prueba 2',style: TextStyle(fontSize: 14.0)),
                trailing: Text('15'),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20.0),
              child: ListTile(
                contentPadding: EdgeInsets.zero,
                title: Text('Veterinaria Prueba 2',style: TextStyle(fontSize: 14.0)),
                trailing: Text('20'),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20.0),
              child: ListTile(
                contentPadding: EdgeInsets.zero,
                title: Text('Veterinaria Prueba 1',style: TextStyle(fontSize: 14.0)),
                trailing: Text('15'),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
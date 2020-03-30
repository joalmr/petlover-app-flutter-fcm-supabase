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
              padding: const EdgeInsets.symmetric(vertical: 20.0, horizontal: 30.0),
              child: Row(
                children: <Widget>[
                  Expanded(
                    // flex: 2,
                    child: Container(
                      padding: EdgeInsets.all(8.0),
                      height: 120.0,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10.0),
                        color: colorBlue,
                      ),
                      child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 30.0),
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: <Widget>[
                            Icon(FontAwesomeIcons.coins, color: Colors.white, size: 50.0,),
                            Align(
                              alignment: Alignment.centerRight,
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.end,
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: <Widget>[
                                  Text('85',style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 30.0,),),
                                  Text('Puntos acumulados', style: TextStyle(color: Colors.white60, fontSize: 12.0, fontWeight: FontWeight.bold),),
                                ],
                              ),
                            )
                          ],
                        ),
                      ),
                    )
                  ),
                  // SizedBox(width: 10.0,),
                  // Expanded(
                  //   //child: Icon(CupertinoIcons.circle_filled),
                  //   child: Icon(FontAwesomeIcons.coins, color: colorBlue, size: 40.0,),
                  // )
                ],
              ),
            ),
            SizedBox(height: 20.0,),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20.0),
              child: Text('Últimos puntos ganados', style: TextStyle(fontSize: 14.0, fontWeight: FontWeight.bold)),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10.0),
              child: ListTile(
                title: Text('Veterinaria Prueba 1',style: TextStyle(fontSize: 14.0)),
                trailing: CircleAvatar(
                  backgroundColor: colorBlue,
                  foregroundColor: Colors.white,
                  child: Text('+25', style: TextStyle(fontSize: 12.0, fontWeight: FontWeight.bold),)
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10.0),
              child: ListTile(
                title: Text('Veterinaria Prueba 1',style: TextStyle(fontSize: 14.0)),
                trailing: CircleAvatar(
                  backgroundColor: colorBlue,
                  foregroundColor: Colors.white,
                  child: Text('+10', style: TextStyle(fontSize: 12.0, fontWeight: FontWeight.bold),)
                ),
                // trailing: Text('+10', style: TextStyle(fontSize: 14.0),),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10.0),
              child: ListTile(
                title: Text('Veterinaria Prueba 2',style: TextStyle(fontSize: 14.0)),
                trailing: CircleAvatar(
                  backgroundColor: colorBlue,
                  foregroundColor: Colors.white,
                  child: Text('+15', style: TextStyle(fontSize: 12.0, fontWeight: FontWeight.bold),)
                ),
                // trailing: Text('+15', style: TextStyle(fontSize: 14.0),),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10.0),
              child: ListTile(
                title: Text('Veterinaria Prueba 2',style: TextStyle(fontSize: 14.0)),
                trailing: CircleAvatar(
                  backgroundColor: colorBlue,
                  foregroundColor: Colors.white,
                  child: Text('+20', style: TextStyle(fontSize: 12.0, fontWeight: FontWeight.bold),)
                ),
                // trailing: Text('+20', style: TextStyle(fontSize: 14.0),),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10.0),
              child: ListTile(
                title: Text('Veterinaria Prueba 1',style: TextStyle(fontSize: 14.0)),
                trailing: CircleAvatar(
                  backgroundColor: colorBlue,
                  foregroundColor: Colors.white,
                  child: Text('+15', style: TextStyle(fontSize: 12.0, fontWeight: FontWeight.bold),)
                ),
                // trailing: Text('+15', style: TextStyle(fontSize: 14.0),),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
import 'dart:math';
import 'package:flutter/material.dart';
import 'package:proypet/src/pages/shared/menu_page.dart';

import '../../main.dart';

class HomePage extends StatelessWidget {
  final GlobalKey<ScaffoldState> _key = GlobalKey<ScaffoldState>();
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _key,
      drawer: MenuPage(),
      body: Stack(
        children: <Widget>[
          _fondo(),
          SingleChildScrollView(
            child: Column(
              children: <Widget>[
                _titulos(),
                
                SizedBox(height: 75.0,),

                Card(
                  elevation: 4.0,
                  color: Colors.white,
                  margin: EdgeInsets.all(16.0),
                  child: Row(
                    children: <Widget>[
                      Expanded(
                        child: ListTile(
                          leading: Container(
                            alignment: Alignment.bottomCenter,
                            width: 45.0,
                            child: Row(
                              crossAxisAlignment: CrossAxisAlignment.end,
                              children: <Widget>[
                                Container(
                                  height: 20,
                                  width: 8.0,
                                  color: Colors.grey.shade300,
                                ),
                                SizedBox(width: 4.0),
                                Container(
                                  height: 25,
                                  width: 8.0,
                                  color: Colors.grey.shade300,
                                ),
                                SizedBox(width: 4.0),
                                Container(
                                  height: 40,
                                  width: 8.0,
                                  color: Colors.blue,
                                ),
                                SizedBox(width: 4.0),
                                Container(
                                  height: 30,
                                  width: 8.0,
                                  color: Colors.grey.shade300,
                                ),
                              ],
                            ),
                          ),
                          title: Text("4 años\n2 meses"),
                          subtitle: Text("Edad"),
                        ),
                      ),
                      VerticalDivider(),
                      Expanded(
                        child: ListTile(
                          leading: Container(
                            alignment: Alignment.bottomCenter,
                            width: 45.0,
                            child: Row(
                              crossAxisAlignment: CrossAxisAlignment.end,
                              children: <Widget>[
                                Container(
                                  height: 20,
                                  width: 8.0,
                                  color: Colors.grey.shade300,
                                ),
                                SizedBox(width: 4.0),
                                Container(
                                  height: 25,
                                  width: 8.0,
                                  color: Colors.grey.shade300,
                                ),
                                SizedBox(width: 4.0),
                                Container(
                                  height: 40,
                                  width: 8.0,
                                  color: Colors.red,
                                ),
                                SizedBox(width: 4.0),
                                Container(
                                  height: 30,
                                  width: 8.0,
                                  color: Colors.grey.shade300,
                                ),
                              ],
                            ),
                          ),
                          title: Text("12.45 kg"),
                          subtitle: Text("Peso"),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          )
        ],        
      ),
      // bottomNavigationBar: NavigationBar(),
      // floatingActionButton: FloatingActionButton(
      //   onPressed: (){
      //     Navigator.pushNamed(context, 'reserva');
      //   },
      //   child: Icon(Icons.add),
      //   backgroundColor: colorSec,
      // ),
      // floatingActionButtonLocation: FloatingActionButtonLocation.endFloat,
      
    );
  }

  Widget _fondo(){
    final fondo = Container(
      width: double.infinity,
      height: double.infinity,
      decoration: BoxDecoration(
        //color: Color.fromRGBO(250, 240, 240, 1.0),
      ),
    );

    final caja = Transform.rotate(
      angle: -pi / 9.15,
      child: Container(
        height: 380.0,
        width: 430.0,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(65.0),
          color: colorMain,
        ),
      ),
    );

    return Stack(
      children: <Widget>[
        fondo,
        Positioned(
            top: -225.0,
            left: -45,
            child: caja,
          )
      ],
    );
  }

  Widget _titulos() {
    return SafeArea(
      child: Container(
        padding: EdgeInsets.all(10.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[
            CircleAvatar(
              backgroundColor: colorMain,
              backgroundImage: AssetImage('images/greco.png'),
              minRadius: 25.0,
              maxRadius: 35.0,
            ),
            SizedBox(width: 5.0,),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Text('Greco', style: TextStyle(color: Colors.white, fontSize: 30.0, fontWeight: FontWeight.bold),),
                Text('Cocker', style: TextStyle(color: Colors.white, fontSize: 18.0),),
              ],
            ),
            Spacer(),
            IconButton(
              color: Colors.white,
              icon: Icon(Icons.notifications_active),
              onPressed: (){},
            ),
            IconButton(
              color: Colors.white,
              icon: Icon(Icons.menu),
              onPressed: () {
                _key.currentState.openDrawer();
              },
            ),
          ],
        ),
      ),
    );
  }

  // Container _buildTile({Color color, IconData icon, String title, String data}) {
  //   return Container(
  //     padding: EdgeInsets.all(8.0),
  //     height: 150.0,
  //     decoration: BoxDecoration(
  //       borderRadius: BorderRadius.circular(10.0),
  //       color: color,
  //     ),
  //     child: Column(
  //       crossAxisAlignment: CrossAxisAlignment.start,
  //       mainAxisAlignment: MainAxisAlignment.spaceAround,
  //       children: <Widget>[
  //         Icon(
  //           icon,
  //           color: Colors.white,
  //         ),
  //         Text(
  //           title,
  //           style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
  //         ),
  //         Text(
  //           data,
  //           style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 20.0),
  //         ),
  //       ],
  //     ),
  //   );
  // }
}

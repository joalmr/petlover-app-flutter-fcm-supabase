
import 'package:flutter/material.dart';
import 'package:proypet/main.dart';
import 'package:proypet/src/pages/mascotas_page.dart';
import 'package:proypet/src/pages/shared/appbar_menu.dart';
import 'package:proypet/src/pages/shared/card_swiper.dart';

final List publicidad = ['images/elegante1.jpg','images/royal1.jpg'];
class HomePage extends StatelessWidget {
  //final GlobalKey<ScaffoldState> _key = GlobalKey<ScaffoldState>();
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: colorMain,
        leading: leadingH,
        title: titleH,
        actions: actionsH,
        elevation: 0,
      ),
      body: SingleChildScrollView(
            child: Column(
              children: <Widget>[
                // SizedBox(height: 25.0,),
                // miCard(),
                SizedBox(height: 5.0,),
                Material(
                  child: Stack(
                    children: <Widget>[
                      Hero(
                        tag: 'images/greco.png',
                        child: Container(
                          decoration: BoxDecoration(
                            image: DecorationImage(
                                image: AssetImage('images/greco.png'),
                                fit: BoxFit.cover),
                            borderRadius: BorderRadius.circular(100)
                          ),
                          height: 165.0,
                          width: 165.0,
                        )
                      )
                    ],
                  ),
                )
                ,
                SizedBox(height: 15.0,),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: <Widget>[
                    Text('43'),
                    Text('44'),
                    Text('45'),
                  ],
                ),
                // Padding(
                //   padding: const EdgeInsets.symmetric(horizontal: 22.0),
                //   child: _swiperPublicidad(publicidad),
                // ),
              ],
            ),
          ),
      
      floatingActionButton: FloatingActionButton(
        onPressed: ()=>Navigator.push(context, MaterialPageRoute(
          builder: (_)=>MascotasPage(),
        )),
        child: Icon(Icons.add),
        backgroundColor: colorMain,
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.endFloat
      // body: Stack(
      //   children: <Widget>[
      //     //_fondo(),
      //     Header(),
          // SingleChildScrollView(
          //   child: Column(
          //     children: <Widget>[
          //       //Header(),
          //       SizedBox(height: 75.0,),
          //       miCard()
          //     ],
          //   ),
          // )
      //   ],        
      // )
    );
      
  }

  Widget miCard(){
    return Card(
      elevation: 4.0,
      color: Colors.white,
      margin: EdgeInsets.symmetric(horizontal: 22.0,vertical: 16.0),
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
    );
  }

  // Widget _swiperPublicidad(imagen){
  //   return CardSwiper(imagenes : imagen,autoplay1: true,radius: 5.0,height1: 145.0);    
  // }
}

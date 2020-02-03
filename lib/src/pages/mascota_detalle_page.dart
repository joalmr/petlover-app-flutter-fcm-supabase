import 'package:flutter/material.dart';
import 'package:proypet/main.dart';
import 'package:proypet/src/pages/model/mascota_model.dart';

class MascotaDetallePage extends StatelessWidget {
  final int idmascota;

  MascotaDetallePage({@required this.idmascota});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Container(
            height: MediaQuery.of(context).size.height,
            color: colorMain,
          ),
          Positioned(
            bottom: 0.0,
            height: 100.0,
            child: FlatButton(
              onPressed: (){},
              child: Container(
                width: MediaQuery.of(context).size.width,
                padding: EdgeInsets.only(top: 35.0),
                child: Center(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: <Widget>[
                      
                    ],
                  ),
                )
              ),
            ),
          ),
          Container(
            height: MediaQuery.of(context).size.height - 65.0,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.only(bottomLeft: Radius.circular(35.0), bottomRight: Radius.circular(35.0)),
              color: Colors.white
            ),
            child: SingleChildScrollView(
              child: Column(
                children: <Widget>[
                  Container(
                    height: 300.0,
                    width: double.infinity,
                    child: Container(
                      decoration: BoxDecoration(
                        //borderRadius: BorderRadius.circular(15),
                        image: DecorationImage(
                          fit: BoxFit.cover,
                          image: AssetImage(mascotaList[idmascota].foto)
                        )
                      ),
                    )
                  ),
                  SizedBox(height: 5.0),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 22.0),
                    child: Container(
                      width: MediaQuery.of(context).size.width - 0.0,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: <Widget>[
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: <Widget>[
                              SizedBox(height: 2.0),
                              Text(mascotaList[idmascota].nombre,
                              style: TextStyle(
                                fontSize: 25.0,
                                fontWeight: FontWeight.w600
                              )
                              )
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                
                  SizedBox(height: 20.0),

                  // Container(
                  //   padding: EdgeInsets.symmetric(horizontal: 22.0, vertical: 5.0),
                  //   //alignment: Alignment.topLeft,
                  //   child: SingleChildScrollView(
                  //     scrollDirection: Axis.horizontal,
                  //     child: ,
                  //   ),
                  // ),
                  
                  SizedBox(height: 20.0),
                  
                                  ],
              ),
            ),
          ),
          Positioned(
            top: 0,
            left: 0,
            right: 0,
            child: AppBar(
              backgroundColor: Colors.transparent,
              elevation: 0,
              centerTitle: true,
              title: Text("",style: TextStyle(
                fontSize: 16.0,
                fontWeight: FontWeight.normal
              ),),
            ),
          ),
        ]
      ),
    );
  }
}
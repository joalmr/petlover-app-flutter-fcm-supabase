import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

Widget buildTip(context){

      return Container(
          margin: EdgeInsets.symmetric(vertical: 10.0,horizontal: 20.0),
          child: InkWell(
            onTap: (){},
            child: Card(
              child:
              Column(
                children: <Widget>[
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Container(
                        height: 50,
                        padding: EdgeInsets.symmetric(horizontal: 10.0, vertical: 5),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            Text('Tip de la semana:', style: Theme.of(context).textTheme.subtitle2),
                            Text('Blabla', style: Theme.of(context).textTheme.subtitle1.apply(fontWeightDelta: 2)),
                          ],
                        )
                      )
                    ],
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 0, horizontal: 10),
                    child: ClipRRect(
                      borderRadius: BorderRadius.all(Radius.circular(10)),
                      child: Image(
                        image: AssetImage('images/mascotas.png'),
                        height: 170,
                        width: double.infinity,
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                ],
              ),
            )
          ),
        );
    
  }
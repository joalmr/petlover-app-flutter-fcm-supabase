import 'package:badges/badges.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:proypet/src/app/styles/styles.dart';
import 'package:proypet/src/app/views/components/appbar_menu.dart';

class CanjearPuntos extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appbar(null, "Tienda puntos", <Widget>[
        Padding(
          padding: EdgeInsets.only(right: 15),
          child: InkWell(
            onTap: () {},
            borderRadius: BorderRadius.circular(100),
            child: AspectRatio(
              aspectRatio: 1,
              child: Badge(
                position: BadgePosition.bottomEnd(bottom: 0, end: 0),
                child: AspectRatio(
                  aspectRatio: 1,
                  child: Icon(
                    FontAwesomeIcons.cartPlus,
                  ),
                ),
                badgeContent: Text(
                  '1',
                  style: TextStyle(
                    color: Colors.white,
                  ),
                ),
                badgeColor: colorRed,
              ),
            ),
          ),
        )
      ]),
      body: Column(
        children: [
          Expanded(
            child: ListView.builder(
              itemCount: 20,
              itemBuilder: (BuildContext context, int index) {
                return Card(
                  child: Container(
                    height: 100,
                    width: double.maxFinite,
                    padding: EdgeInsets.all(8),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Container(
                          child: AspectRatio(
                            aspectRatio: 1,
                            child: ClipRRect(
                              borderRadius: borderRadius,
                              child: Image(
                                fit: BoxFit.cover,
                                image: AssetImage('images/shop/shop-cat.jpg'),
                              ),
                            ),
                          ),
                        ),
                        SizedBox(width: 5),
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Text(
                                'Producto',
                                style: TextStyle(
                                  fontSize: 16,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              Row(
                                children: [
                                  Column(
                                    children: [
                                      Text(
                                        'Breve descripción..',
                                        style: TextStyle(fontSize: 12),
                                      ),
                                      Text(
                                        'Stock: 7',
                                        style: TextStyle(fontSize: 10),
                                      ),
                                      Row(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        mainAxisAlignment:
                                            MainAxisAlignment.start,
                                        children: [
                                          Container(
                                            width: 60,
                                            child: Padding(
                                              padding:
                                                  EdgeInsets.only(right: 1),
                                              child: Text(
                                                'Puntos',
                                                style: TextStyle(
                                                  fontSize: 12,
                                                ),
                                              ),
                                            ),
                                          ),
                                          Text(
                                            '100',
                                            style: TextStyle(
                                              fontSize: 16,
                                              fontWeight: FontWeight.bold,
                                              color: colorMain,
                                            ),
                                          )
                                        ],
                                      ),
                                    ],
                                  )
                                ],
                              )
                            ],
                          ),
                        ),
                        IconButton(
                          icon: Icon(
                            Icons.add_circle_outline,
                            color: colorMain,
                            size: 32,
                          ),
                          onPressed: () {},
                        ),
                      ],
                    ),
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}

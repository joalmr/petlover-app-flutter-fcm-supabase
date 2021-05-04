import 'package:badges/badges.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:proypet/components/navegadores/appbar.dart';
import 'package:proypet/design/styles/styles.dart';

class CanjearPuntos extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: 
      appBar(
        texto:  "Tienda puntos",
        acc: <Widget>[
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
        ],
      ),
      body: Column(
        children: [
          Expanded(
            child: GridView.builder(
              itemCount: 20,
              padding: EdgeInsets.all(10),
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                childAspectRatio: 9.5 / 16,
              ),
              itemBuilder: (context, index) {
                return Card(
                  child: Column(
                    children: [
                      ClipRRect(
                        borderRadius: borderRadius,
                        child: Image(
                          fit: BoxFit.cover,
                          image: AssetImage('images/shop/shop-cat.jpg'),
                        ),
                      ),
                      Text(
                        'Producto',
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Text(
                        'Breve descripción..',
                        style: TextStyle(fontSize: 12),
                      ),
                      Text(
                        'Stock: 7',
                        style: TextStyle(fontSize: 10),
                      ),
                      Text(
                        'Puntos',
                        style: TextStyle(
                          fontSize: 12,
                        ),
                      ),
                      Text(
                        '100',
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                          color: colorMain,
                        ),
                      ),
                      Expanded(
                        child: InkWell(
                          borderRadius: borderRadius,
                          onTap: () {},
                          child: Container(
                            width: double.maxFinite,
                            child: Card(
                              color: colorMain,
                              child: Padding(
                                padding: const EdgeInsets.symmetric(
                                  vertical: 10,
                                  horizontal: 5,
                                ),
                                child: Center(
                                  child: Text(
                                    'Agregar producto',
                                    style: TextStyle(color: Colors.white),
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
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

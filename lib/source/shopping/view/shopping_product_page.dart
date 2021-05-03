import 'package:badges/badges.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:proypet/components/appbar_menu.dart';
import 'package:proypet/design/styles/styles.dart';
import 'package:proypet/source/shopping/controller/shopping_controller.dart';

class ShoppingProductPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GetX<ShoppingController>(
      builder: (_) {
        return Scaffold(
          appBar: appbar(null, "Shopping", <Widget>[
            Padding(
              padding: EdgeInsets.only(right: 15),
              child: InkWell(
                onTap: () => Get.toNamed('shop/cart'),
                borderRadius: BorderRadius.circular(100),
                child: AspectRatio(
                  aspectRatio: 1,
                  child: _.shopping == 0
                      ? AspectRatio(
                          aspectRatio: 1,
                          child: Icon(Icons.shopping_cart),
                        )
                      : Badge(
                          position: BadgePosition.bottomEnd(bottom: 0, end: 0),
                          child: AspectRatio(
                            aspectRatio: 1,
                            child: Icon(Icons.shopping_cart),
                          ),
                          badgeContent: Text(
                            '${_.shopping}',
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
                            'S/ 120',
                            style: TextStyle(
                              fontSize: 12,
                              decoration: TextDecoration.lineThrough,
                              color: colorRed,
                            ),
                          ),
                          Text(
                            'S/ 100',
                            style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                              color: colorMain,
                            ),
                          ),
                          Expanded(
                            child: InkWell(
                              borderRadius: borderRadius,
                              onTap: _.addShopping,
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
      },
    );
  }
}

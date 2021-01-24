import 'package:badges/badges.dart';
import 'package:flutter/material.dart';
import 'package:flutter_swiper/flutter_swiper.dart';
import 'package:get/get.dart';
import 'package:proypet/src/app/styles/styles.dart';
import 'package:proypet/src/app/views/components/appbar_menu.dart';
import 'package:proypet/src/controllers/shopping_controller/shopping_controller.dart';

import 'components/card_shop.dart';

class ShoppingPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GetX<ShoppingController>(
      init: ShoppingController(),
      builder: (_) {
        return Scaffold(
          appBar: appbar(null, "Shopping", <Widget>[
            Padding(
              padding: EdgeInsets.only(right: 15),
              child: InkWell(
                onTap: () {},
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
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  children: [
                    cardShop(
                      image: Icon(Icons.hail, color: colorMain),
                      text: 'Shopping',
                      fn: () => Get.toNamed('shopproduct'),
                    ),
                    cardShop(
                      image: Icon(Icons.hail, color: Colors.pinkAccent),
                      text: 'Alimentos',
                      fn: () => Get.toNamed('shopproduct'),
                    ),
                    cardShop(
                      image: Icon(Icons.hail, color: Colors.amberAccent),
                      text: 'Accesorios',
                      fn: () => Get.toNamed('shopproduct'),
                    ),
                    cardShop(
                      image: Icon(Icons.hail, color: Colors.lightBlueAccent),
                      text: 'Higiene',
                      fn: () => Get.toNamed('shopproduct'),
                    ),
                    cardShop(
                      image: Icon(Icons.hail, color: Colors.purpleAccent),
                      text: 'Suplementos',
                      fn: () => Get.toNamed('shopproduct'),
                    ),
                    cardShop(
                      image: Icon(Icons.hail, color: Colors.lightGreenAccent),
                      text: 'Farmacia',
                      fn: () => Get.toNamed('shopproduct'),
                    ),
                  ],
                ),
              ),
              SizedBox(height: 5),
              Container(
                child: AspectRatio(
                  aspectRatio: 16 / 9,
                  child: Container(
                    child: Swiper(
                      itemBuilder: (BuildContext context, int index) {
                        return ClipRRect(
                            child: Image(
                          image: AssetImage('images/shop/banner-1.jpg'),
                          fit: BoxFit.cover,
                        ));
                      },
                      itemCount: 3,
                      pagination: new SwiperPagination(
                          builder: new DotSwiperPaginationBuilder(
                        activeColor: colorMain,
                      )),
                    ),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 10, top: 5),
                child: Text("Lo más vendido",
                    style: Get.textTheme.headline6.apply(fontWeightDelta: 2)),
              ),
              Expanded(
                child: ListView.builder(
                  itemCount: 5,
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
                                    image:
                                        AssetImage('images/shop/shop-cat.jpg'),
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
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    children: [
                                      Container(
                                        width: 60,
                                        child: Padding(
                                          padding: EdgeInsets.only(right: 1),
                                          child: Text(
                                            'S/ 120',
                                            style: TextStyle(
                                              fontSize: 12,
                                              decoration:
                                                  TextDecoration.lineThrough,
                                              color: colorRed,
                                            ),
                                          ),
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
                                    ],
                                  ),
                                ],
                              ),
                            ),
                            IconButton(
                              icon: Icon(
                                Icons.add_circle_outline,
                                color: colorMain,
                                size: 32,
                              ),
                              onPressed: _.addShopping,
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
      },
    );
  }
}

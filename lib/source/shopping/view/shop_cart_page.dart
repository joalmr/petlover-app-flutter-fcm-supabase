import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:proypet/components/form_control/buttons/btn_alternative.dart';
import 'package:proypet/components/form_control/buttons/btn_primary.dart';
import 'package:proypet/components/navegadores/appbar.dart';
import 'package:proypet/design/styles/styles.dart';
import 'package:proypet/source/shopping/controller/shopping_controller.dart';

class ShopCartPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GetBuilder<ShoppingController>(builder: (_) {
      return Scaffold(
        appBar: appBar(texto: "Shopping cart", acc: null),
        body: Padding(
          padding: const EdgeInsets.all(10.0),
          child: Column(
            children: [
              Expanded(
                child: ListView.builder(
                  itemCount: 2,
                  itemBuilder: (BuildContext context, int index) {
                    return Card(
                      child: Container(
                        width: double.maxFinite,
                        child: Row(
                          children: [
                            Container(
                              height: 100,
                              width: 100,
                              child: ClipRRect(
                                borderRadius: borderRadius,
                                child: Image(
                                  fit: BoxFit.cover,
                                  image: AssetImage('images/shop/shop-cat.jpg'),
                                ),
                              ),
                            ),
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
                                  Text(
                                    'S/ 120',
                                    style: TextStyle(
                                      fontSize: 12,
                                      decoration: TextDecoration.lineThrough,
                                      color: colorRed,
                                    ),
                                  ),
                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Text(
                                        'S/ 100',
                                        style: TextStyle(
                                          fontSize: 16,
                                          fontWeight: FontWeight.bold,
                                          color: colorMain,
                                        ),
                                      ),
                                      Card(
                                        child: Container(
                                          decoration: BoxDecoration(
                                            borderRadius: borderRadius,
                                            color: colorGray3,
                                          ),
                                          padding: EdgeInsets.symmetric(
                                              horizontal: 10, vertical: 2),
                                          child: Row(
                                            children: [
                                              InkWell(
                                                onTap: () {},
                                                child: Icon(Icons.remove),
                                              ),
                                              Container(
                                                width: 50,
                                                child: Center(
                                                  child: Text("1"),
                                                ),
                                              ),
                                              InkWell(
                                                onTap: () {},
                                                child: Icon(Icons.add),
                                              ),
                                            ],
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            )
                          ],
                        ),
                      ),
                    );
                  },
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Divider(
                  thickness: 2,
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 20),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(left: 20),
                      child: Text(
                        "Total",
                        style: Get.textTheme.headline6,
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(right: 20),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: [
                          Text(
                            "200",
                            style: Get.textTheme.headline6,
                          ),
                          Text(
                            "El precio total incluye delivery",
                            style: TextStyle(fontSize: 8),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              btnPrimary(
                text: 'Pagar',
                onPressed: () {},
              ),
              btnAltern(
                text: 'Continuar comprando',
                onPressed: () => Get.back(),
                color: colorMain, //observado
              ),
            ],
          ),
        ),
      );
    });
  }
}

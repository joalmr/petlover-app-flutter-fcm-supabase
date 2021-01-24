import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:proypet/src/app/styles/styles.dart';
import 'package:proypet/src/app/views/components/navegadores/appbar.dart';

class SorteoPuntos extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appBar(
        texto: 'Sorteo',
        acc: null,
      ),
      body: ListView.builder(
        itemCount: 10,
        itemBuilder: (BuildContext context, int index) {
          return FadeIn(
            child: Container(
              margin: EdgeInsets.symmetric(vertical: 5.0, horizontal: 10.0),
              child: InkWell(
                borderRadius: borderRadius,
                onTap: () {},
                child: Card(
                  child: Row(
                    children: [
                      Container(
                        height: 100,
                        child: AspectRatio(
                          aspectRatio: 7 / 8,
                          child: ClipRRect(
                            borderRadius: borderRadius,
                            child: Image(
                              fit: BoxFit.cover,
                              image: AssetImage('images/shop/shop-cat.jpg'),
                            ),
                          ),
                        ),
                      ),
                      Expanded(
                        child: Padding(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 10, vertical: 5),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Text(
                                'Product $index',
                                style: Get.textTheme.subtitle2
                                    .apply(fontWeightDelta: 2),
                                maxLines: 2,
                              ),
                              Row(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  Expanded(
                                    flex: 8,
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      mainAxisAlignment:
                                          MainAxisAlignment.start,
                                      children: [
                                        Text(
                                          'bla bla',
                                          maxLines: 1,
                                          style: TextStyle(
                                              fontSize: sizeSmallx1,
                                              color: colorGray3,
                                              fontWeight: FontWeight.w400),
                                        ),
                                        Row(
                                          children: [
                                            Icon(
                                              FontAwesomeIcons.gift,
                                              size: 12,
                                            ),
                                            SizedBox(width: 5),
                                            Text(
                                              'bla bla',
                                              style: TextStyle(
                                                  fontSize: sizeSmallx1),
                                            )
                                          ],
                                        ),
                                      ],
                                    ),
                                  ),
                                  Expanded(
                                    flex: 2,
                                    child: Container(
                                      width: 100,
                                      padding: EdgeInsets.symmetric(
                                        vertical: 10,
                                        horizontal: 1,
                                      ),
                                      child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.end,
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: [
                                          Text(
                                            'Participar',
                                            style: TextStyle(
                                              fontSize: sizeSmallx3,
                                              color: colorMain,
                                              fontWeight: FontWeight.bold,
                                            ),
                                          ),
                                          Text(
                                            '45',
                                            style:
                                                Get.textTheme.subtitle2.apply(
                                              fontWeightDelta: 2,
                                              color: colorMain,
                                              fontSizeDelta: 4,
                                            ),
                                          ),
                                          Text(
                                            'puntos',
                                            style: TextStyle(
                                              fontSize: sizeSmallx3 - 2,
                                              color: colorMain,
                                            ),
                                          )
                                        ],
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}

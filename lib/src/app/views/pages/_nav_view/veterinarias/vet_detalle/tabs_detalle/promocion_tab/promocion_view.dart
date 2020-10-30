import 'package:flutter/material.dart';
import 'package:proypet/icons/icon_proypet_icons.dart';
import 'package:proypet/src/app/styles/styles.dart';

class ViewPromocion extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: 5,
      padding: EdgeInsets.all(10),
      itemBuilder: (BuildContext context, int index) {
        return Padding(
          padding: const EdgeInsets.only(bottom: 8.0),
          child: Card(
            elevation: 2,
            child: Row(
              children: [
                Padding(
                  padding: const EdgeInsets.only(top: 8, bottom: 8, left: 12, right: 10),
                  child: CircleAvatar(
                    radius: 30,
                    backgroundColor: colorBlue,
                    child: Icon(
                      IconProypet.grooming,
                      color: Colors.white,
                      size: 28,
                    ),
                  ),
                ),
                Expanded(
                  child: SizedBox(
                    width: double.maxFinite,
                    child: Text('Descuento de 45% en baños a todos los perros nacidos el 30 de Febrero; ¡Promoción valida todo el año!'),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 8, bottom: 8, left: 10, right: 12),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Text(
                        '45%',
                        style: TextStyle(
                          color: colorRed,
                          fontWeight: FontWeight.w900,
                          fontSize: 30,
                        ),
                      ),
                      Text(
                        'desc.',
                        style: TextStyle(
                          color: colorRed,
                          fontWeight: FontWeight.w900,
                          fontSize: 10,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}

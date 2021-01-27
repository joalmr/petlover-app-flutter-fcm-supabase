import 'package:flutter/material.dart';
import 'package:proypet/src/app/styles/styles.dart';
import 'package:proypet/src/app/components/navegadores/appbar.dart';

class SorteoPuntos extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appBar(
        texto: 'Sorteo',
        acc: null,
      ),
      body: GridView.builder(
        itemCount: 4,
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
                  '40',
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
                              'Participar',
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
    );
  }
}

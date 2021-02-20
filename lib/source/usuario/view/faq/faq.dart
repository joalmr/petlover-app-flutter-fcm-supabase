import 'package:flutter/material.dart';
import 'package:proypet/components/navegadores/appbar.dart';

import 'cardFaq.dart';
import 'dataFaq.dart';

class FaqPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appBar(
        texto: 'Preguntas frecuentes',
        acc: null,
      ),
      body: ListView.builder(
        itemCount: dataFaq.length,
        itemBuilder: (BuildContext context, int index) {
          return cardFaq(
            title: dataFaq[index]['title'],
            description: dataFaq[index]['description'],
          );
        },
      ),
    );
  }
}

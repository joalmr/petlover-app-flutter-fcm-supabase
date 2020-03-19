import 'package:flutter/material.dart';
import 'package:proypet/src/pages/shared/appbar_menu.dart';

class DestacadosPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appbar(
        // leadingH,
        titleH,
        null,
      ),
      body: Container(
        child: Center(
          child: Text('Destacados'),
        ),
      ),
    );
  }
}
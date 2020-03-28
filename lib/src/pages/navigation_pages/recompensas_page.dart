import 'package:flutter/material.dart';
import 'package:proypet/src/pages/shared/appbar_menu.dart';

class RecompensasPage extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appbar(leadingH,'Recompensas',null),
      body: Container(
        child: Center(
          child: Text('Recompensas'),
        ),
      ),
    );
  }
}
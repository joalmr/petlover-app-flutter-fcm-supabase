import 'package:flutter/material.dart';
import 'package:proypet/src/app/views/components/transition/fadeViewSafeArea.dart';

class UpdatePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: FadeViewSafeArea(
        child: Center(
          child: Text('Actualizar'),
        ),
      ),
    );
  }
}

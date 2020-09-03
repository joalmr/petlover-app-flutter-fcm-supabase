import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';

class FadeViewSafeArea extends StatelessWidget {
  // const Pagina({Key key}) : super(key: key);
  final Widget child;
  FadeViewSafeArea({@required this.child});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: FadeIn(
      delay: Duration(milliseconds: 5),
      duration: Duration(seconds: 1),
      child: child,
    ));
  }
}

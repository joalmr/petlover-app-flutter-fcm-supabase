import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';

class FadeView extends StatelessWidget {
  // const Pagina({Key key}) : super(key: key);
  final Widget child;
  FadeView({@required this.child});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: FadeIn(
      delay: Duration(milliseconds: 75),
      duration: Duration(seconds: 1),
      child: child,
    ));
  }
}

class FadeView2 extends StatelessWidget {
  // const Pagina({Key key}) : super(key: key);
  final Widget child;
  FadeView2({@required this.child});

  @override
  Widget build(BuildContext context) {
    return FadeIn(
      delay: Duration(milliseconds: 75),
      duration: Duration(seconds: 1),
      child: child,
    );
  }
}

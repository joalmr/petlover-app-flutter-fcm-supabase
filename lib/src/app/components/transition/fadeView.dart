import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';

class FadeView extends StatelessWidget {
  final Widget child;
  FadeView({@required this.child});

  @override
  Widget build(BuildContext context) {
    return FadeIn(
      delay: Duration(milliseconds: 5),
      duration: Duration(seconds: 1),
      child: child,
    );
  }
}

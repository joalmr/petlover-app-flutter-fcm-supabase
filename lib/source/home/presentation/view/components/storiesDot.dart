import 'package:flutter/material.dart';
import 'package:proypet/design/styles/styles.dart';

class StoriesDot extends StatelessWidget {
  final bool isActive;
  final int length;
  const StoriesDot({this.isActive, this.length});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 4,
      width: (MediaQuery.of(context).size.width-(length*4))/length,
      margin: EdgeInsets.symmetric(horizontal: 2),
      decoration: BoxDecoration(
        color: isActive ? colorMain : Colors.grey[300],
        borderRadius: BorderRadius.circular(20),
      ),
    );
  }
}
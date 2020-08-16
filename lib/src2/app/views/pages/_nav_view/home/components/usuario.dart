import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:proypet/src2/controllers/home_controller/home_controller.dart';

class Usuario extends StatelessWidget {
  const Usuario({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<HomeController>(
      builder: (_) => Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          Text(
            _.usuario,
            style: Get.textTheme.headline4.apply(fontWeightDelta: 2),
          ),
        ],
      ),
    );
  }
}

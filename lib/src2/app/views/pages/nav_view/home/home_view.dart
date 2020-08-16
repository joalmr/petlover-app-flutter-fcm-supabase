import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:proypet/src2/controllers/home_controller/home_controller.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('MyPage')),
      body: Container(
        child: GetX<HomeController>(
            init: HomeController(),
            builder: (_) {
              return Container();
            }),
      ),
    );
  }
}

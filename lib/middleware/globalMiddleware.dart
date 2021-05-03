import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:proypet/config/global_variables.dart';

class GlobalMiddleware extends GetMiddleware {
  @override
  RouteSettings redirect(String route) {
    return prefUser.hasToken() || route == '/login'
        ? null
        : RouteSettings(name: '/login');
  }
}

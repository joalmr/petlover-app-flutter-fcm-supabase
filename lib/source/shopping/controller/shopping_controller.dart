import 'package:get/get.dart';

class ShoppingController extends GetxController {
  RxInt _shopping = 0.obs;

  set shopping(int value) => _shopping.value = value;
  int get shopping => this._shopping.value;

  addShopping() {
    _shopping.value++;
  }
}

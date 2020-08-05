import 'package:mobx/mobx.dart';

part 'storeMain_store.g.dart';

class MainStore = MainStoreBase with _$MainStore;

abstract class MainStoreBase with Store {
  @observable
  int value = 0;
  int value2 = 0;

  @action
  void increment() {
    value++;
  }

  @action
  void increment2() {
    value2++;
  }
}

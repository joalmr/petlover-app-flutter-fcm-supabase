import 'dart:io';

import 'package:proypet/src/data/providers/update_provider.dart';

class UpdateService {
  final UpdateProvider updateProvider = UpdateProvider();

  Future<bool> setAppUpdate() {
    if (Platform.isIOS) return updateProvider.setAppiOs();
    return updateProvider.setAppAndroid();
  }
}

import 'dart:io';

import 'package:proypet/source/update/provider/update_provider.dart';

class UpdateService {
  final UpdateProvider updateProvider = UpdateProvider();

  Future<bool> setAppUpdate() {
    if (Platform.isIOS) return updateProvider.setAppiOs();
    return updateProvider.setAppAndroid();
  }
}

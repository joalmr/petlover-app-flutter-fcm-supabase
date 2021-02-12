import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:package_info/package_info.dart';
import 'package:proypet/config/global_variables.dart';

class UpdateProvider {
  final _url = urlApi;

  Future<bool> setAppAndroid() async {
    final url = '$_url/version/android';

    final response = await http.get(url);
    PackageInfo packageInfo = await PackageInfo.fromPlatform();

    final jsonData = json.decode(response.body);

    int buildNumber = int.parse(packageInfo.buildNumber);
    int versionCode = int.parse(jsonData['versionCode']);

    versionAndroid = jsonData['versionName'];

    if (buildNumber < versionCode) {
      return true;
    }
    return false;
  }

  Future<bool> setAppiOs() async {
    final url = '$_url/version/ios';

    final response = await http.get(url);
    PackageInfo packageInfo = await PackageInfo.fromPlatform();
    final jsonData = json.decode(response.body);

    int buildNumber = int.parse(packageInfo.buildNumber);
    int versionCode = int.parse(jsonData['versionCode']);

    versionIOS = jsonData['versionName'];

    if (buildNumber < versionCode) {
      return true;
    }
    return false;
  }
}

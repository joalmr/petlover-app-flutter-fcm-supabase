import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:package_info/package_info.dart';
import 'package:proypet/config/variables_globales.dart';

class UpdateProvider {
  final _url = urlApi;

  Future<bool> setAppAndroid() async {
    final url = Uri.parse('$_url/version/android');

    final response = await http.get(url);
    PackageInfo packageInfo = await PackageInfo.fromPlatform();

    final jsonData = json.decode(response.body);

    int buildNumber = int.parse(packageInfo.buildNumber);
    int versionCode = int.parse(jsonData['versionCode'] ?? 1);

    versionAndroid = jsonData['versionName'];

    if (buildNumber < versionCode) {
      return true;
    }
    return false;
  }

  Future<bool> setAppiOs() async {
    final url = Uri.parse('$_url/version/ios');

    final response = await http.get(url);
    PackageInfo packageInfo = await PackageInfo.fromPlatform();
    final jsonData = json.decode(response.body);

    int buildNumber = int.parse(packageInfo.buildNumber);
    int versionCode = int.parse(jsonData['versionCode'] ?? 1);

    versionIOS = jsonData['versionName'];

    if (buildNumber < versionCode) {
      return true;
    }
    return false;
  }
}

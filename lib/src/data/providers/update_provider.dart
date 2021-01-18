import 'package:dio/dio.dart';
import 'package:package_info/package_info.dart';
import 'package:proypet/config/global_variables.dart';

class UpdateProvider {
  final _url = urlApi;
  Dio dio = new Dio();

  Future<bool> setAppAndroid() async {
    final url = '$_url/version/android';

    Response response = await dio.get(url);
    PackageInfo packageInfo = await PackageInfo.fromPlatform();

    int buildNumber = int.parse(packageInfo.buildNumber);
    int versionCode = int.parse(response.data['versionCode']);

    versionAndroid = response.data['versionName'];

    print('===android===');
    print(buildNumber);
    print(versionCode);

    if (buildNumber < versionCode) {
      print(true);
      return true;
    }
    return false;
  }

  Future<bool> setAppiOs() async {
    final url = '$_url/version/ios';

    Response response = await dio.get(url);
    PackageInfo packageInfo = await PackageInfo.fromPlatform();

    int buildNumber = int.parse(packageInfo.buildNumber);
    int versionCode = int.parse(response.data['versionCode']);

    versionIOS = response.data['versionName'];

    print('===iOs===');
    print(buildNumber);
    print(versionCode);

    if (buildNumber < versionCode) {
      print(true);
      return true;
    }
    return false;
  }
}

import 'package:dio/dio.dart';
import 'package:proypet/config/global_variables.dart';

class AddressProvider {
  final _url = urlApi;
  Dio dio = new Dio();

  Future<void> setAddress(String address, lat, lng) async {
    final url = '$_url/settings/address';

    final _data = {
      "address": address,
      "latitude": lat,
      "longitude": lng,
    };
    var resp = await dio.post(
      url,
      data: _data,
      options: Options(headers: headersToken()),
    );
    print(resp.statusCode);
  }
}

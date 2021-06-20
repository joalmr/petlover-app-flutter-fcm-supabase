import 'package:http/http.dart' as http;
import 'package:proypet/config/variables_globales.dart';

class AddressProvider {
  final _url = urlApi;

  Future<void> setAddress(String address, lat, lng) async {
    final url = Uri.parse('$_url/settings/address');

    final _data = {
      "address": address,
      "latitude": lat,
      "longitude": lng,
    };
    final response = await http.post(url, body: _data, headers: headersToken());
    if (response.statusCode == 200) print("==add direccion");
  }
}

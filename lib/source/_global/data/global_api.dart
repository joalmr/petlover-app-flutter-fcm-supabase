import 'package:proypet/config/global_variables.dart';
import 'package:http/http.dart' as http;
import 'model/dataMapModel.dart';

class GlobalApi {

Future<DataMapModel> getLatLngByPlaceId(String placeId) async {
    final _urlBase = "maps.googleapis.com";
    final url = Uri.https(
      _urlBase,
      '/maps/api/place/details/json',
      {
        "key": keyMap,
        "language": "es",
        "placeid": placeId,
      },
    );

    http.Response response = await http.get(url);
    final byPlaceId = dataMapModelFromJson(response.body);

    return byPlaceId;
  }

}
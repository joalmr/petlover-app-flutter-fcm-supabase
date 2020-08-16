import 'package:proypet/config/global_variables.dart';
import 'package:proypet/src/models/home_model.dart';
import 'package:http/http.dart' as http;

class SummaryProvider {
  final _url = urlApi;
  // Dio dio = new Dio();

  Future<HomeModel> getUserSummary() async {
    final url = '$_url/summary';

    // Response response;
    // response = await dio.get(url, options: Options(headers: headersToken()));
    // print(response.data);

    final resp = await http.get(url, headers: headersToken());
    HomeModel homeModel = homeModelFromJson(resp.body);

    return homeModel;
  }
}

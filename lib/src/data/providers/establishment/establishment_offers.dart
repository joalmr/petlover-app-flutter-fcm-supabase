import 'package:proypet/config/global_variables.dart';
import 'package:http/http.dart' as http;
import '../../models/establishment/promocion_model.dart';

class EstablishmentOfferProvider {
  final _url = urlApi;

  Future<List<PromocionModel>> getOffers(String idVet) async {
    final url = '$_url/establishment/$idVet/offers';
    List<PromocionModel> promociones = [];

    final resp = await http.get(url, headers: headersToken());

    if (resp.statusCode == 200) promociones = promocionModelFromJson(resp.body);

    return promociones;
  }
}

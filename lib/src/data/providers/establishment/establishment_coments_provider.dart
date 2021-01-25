import 'package:dio/dio.dart';
import 'package:proypet/config/global_variables.dart';
import 'package:http/http.dart' as http;
import 'model/comentarios_model.dart';

class EstablishmentComentProvider {
  final _url = urlApi;

  Dio dio = new Dio();

  Future<List<Comentarios>> getTenComents(String idVet) async {
    final url = '$_url/establishment/$idVet/comments';

    List<Comentarios> comentarios = [];

    final resp = await http.get(url, headers: headersToken());

    if (resp.statusCode == 200) {
      comentarios = comentariosFromJson(resp.body);
    }

    return comentarios.take(10).toList();
  }

  Future<List<Comentarios>> getComents(String idVet) async {
    final url = '$_url/establishment/$idVet/comments';

    List<Comentarios> comentarios = [];

    final resp = await http.get(url, headers: headersToken());

    if (resp.statusCode == 200) comentarios = comentariosFromJson(resp.body);

    return comentarios;
  }
}

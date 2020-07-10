import 'package:shared_preferences/shared_preferences.dart';

/*
  Recordar instalar el paquete de:
    shared_preferences:

  Inicializar en el main
    final prefs = new PreferenciasUsuario();
    await prefs.initPrefs();
    
    Recuerden que el main() debe de ser async {...

*/

class PreferenciasUsuario {
  static final PreferenciasUsuario _instancia =
      new PreferenciasUsuario._internal();

  factory PreferenciasUsuario() {
    return _instancia;
  }

  PreferenciasUsuario._internal();

  SharedPreferences _prefs;

  initPrefs() async {
    this._prefs = await SharedPreferences.getInstance();
  }

  // GET y SET del token
  get token {
    return _prefs.getString('token') ?? '';
  }

  set token(String value) {
    _prefs.setString('token', value);
  }

//verificado
  get verify {
    return _prefs.getString('verify') ?? null;
  }

  set verify(String value) {
    _prefs.setString('verify', value);
  }

  get position {
    return _prefs.getString('position') ?? '0,0';
  }

  set position(String value) {
    _prefs.setString('position', value);
  }

//se usa para guardar la direccion de la ultima reserva realizada
  get myAddress {
    return _prefs.getString('address') ?? '';
  }

  set myAddress(String value) {
    _prefs.setString('address', value);
  }

//se usa para guardar la posicion de la ultima reserva realizada
  get myAddressLatLng {
    return _prefs.getString('mylatlng') ?? '';
  }

  set myAddressLatLng(String value) {
    _prefs.setString('mylatlng', value);
  }
}

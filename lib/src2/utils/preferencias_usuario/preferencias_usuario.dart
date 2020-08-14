import 'package:shared_preferences/shared_preferences.dart';

class PreferenciasUsuario {
  static final PreferenciasUsuario _instancia = new PreferenciasUsuario._internal();

  factory PreferenciasUsuario() {
    return _instancia;
  }

  PreferenciasUsuario._internal();

  SharedPreferences _prefs;

  void openPrefs() => initPrefs();

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
    return _prefs.getString('position') ?? null;
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

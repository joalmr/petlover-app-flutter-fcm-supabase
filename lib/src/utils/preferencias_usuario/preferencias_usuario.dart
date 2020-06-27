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

  static final PreferenciasUsuario _instancia = new PreferenciasUsuario._internal();

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

  set token( String value ) {
    _prefs.setString('token', value);
  }

  get position {
    return _prefs.getString('position') ?? '0';
  }

  set position( String value ) {
    _prefs.setString('position', value);
  }

  get myAddress {
    return _prefs.getString('address') ?? '';
  }

  set myAddress( String value ) {
    _prefs.setString('address', value);
  }

  get myAddressLatLng {
    return _prefs.getString('mylatlng') ?? '';
  }

  set myAddressLatLng( String value ) {
    _prefs.setString('mylatlng', value);
  }
  
}


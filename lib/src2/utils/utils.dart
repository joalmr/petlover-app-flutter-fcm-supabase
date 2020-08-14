import 'preferencias_usuario/preferencias_usuario.dart';

final _prefs = new PreferenciasUsuario();

fnGetVerify() {
  if (_prefs.verify != null && _prefs.verify.trim() != "")
    return true;
  else
    return false;
}

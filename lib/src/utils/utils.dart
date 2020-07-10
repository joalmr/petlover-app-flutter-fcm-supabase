import 'package:proypet/src/utils/preferencias_usuario/preferencias_usuario.dart';

final _prefs = new PreferenciasUsuario();

fnGetVerify() {
  print(_prefs.verify);
  if (_prefs.verify != null && _prefs.verify.trim() != "")
    return true;
  else
    return false;
}

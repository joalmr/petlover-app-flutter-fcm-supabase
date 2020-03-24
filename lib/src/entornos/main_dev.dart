import 'package:flutter/material.dart';
import 'package:proypet/main.dart';
import 'package:proypet/src/entornos/app_config.dart';
import 'package:proypet/src/preferencias_usuario/preferencias_usuario.dart';

void main() async {
  var configuredApp = new AppConfig(
    appName: 'Proypet DEV',
    apiBaseUrl: 'http://ce2019121721001.dnssw.net/api',
    child: new MyApp(),
  );
  
  WidgetsFlutterBinding.ensureInitialized();
  final prefs = new PreferenciasUsuario();
  await prefs.initPrefs();

  runApp(configuredApp);
}
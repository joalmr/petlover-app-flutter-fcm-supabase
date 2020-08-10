import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:get_it/get_it.dart';
import 'package:proypet/src/utils/preferencias_usuario/preferencias_usuario.dart';
import 'package:proypet/src/routes/routes.dart';
import 'package:proypet/src/views/pages/_navigation_pages/navigation_bar.dart';
import 'package:flutter/services.dart';

import 'config/global_variables.dart';
import 'src/provider/home_store.dart';
import 'src/provider/login_store.dart';
import 'src/provider/push_store.dart';
import 'src/theme/theme.dart';
import 'src/theme/themeDark.dart';

final _prefs = new PreferenciasUsuario();
void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await _prefs.initPrefs();
  GetIt getIt = GetIt.I;
  getIt.registerSingleton<PushStore>(PushStore());
  getIt.registerSingleton<HomeStore>(HomeStore());

  SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]).then((value) => runApp(MyApp()));
}

class MyApp extends StatefulWidget {
  _MyAppState createState() => _MyAppState();
}

LoginStore loginStore = LoginStore();

class _MyAppState extends State<MyApp> {
  @override
  void initState() {
    super.initState();
    final homeStore = GetIt.I.get<HomeStore>();
    loginStore.evaluaIngreso();
    if (loginStore.rutaInicio == 'navInicio') {
      homeStore.getSummary(); //ejecuto datos de pagina home
    }
  }

  @override
  Widget build(BuildContext context) {
    //com.example.user //prueba
    //com.proypet.user //produccion
    return MaterialApp(
      debugShowCheckedModeBanner: appPruebas,
      title: 'Proypet',
      theme: temaClaro,
      darkTheme: temaOscuro,
      localizationsDelegates: [
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
      ],
      supportedLocales: [
        const Locale('en', 'US'),
        const Locale('es', 'ES'), //PE
      ],
      routes: getRoutes(),
      initialRoute: loginStore.rutaInicio,
      onGenerateRoute: (RouteSettings settings) => MaterialPageRoute(
        builder: (BuildContext context) => NavigationBar(currentTabIndex: 0),
      ), //ruta general
    );
  }
}

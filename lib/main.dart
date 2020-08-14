import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:get/route_manager.dart';
import 'package:get_it/get_it.dart';
import 'package:get_storage/get_storage.dart';
import 'package:proypet/src2/routes/routes.dart';
import 'package:flutter/services.dart';

import 'package:get/get.dart';

import 'config/global_variables.dart';
import 'src/provider/home_store.dart';
import 'src/provider/login_store.dart';
import 'src/provider/push_store.dart';
import 'src2/app/theme/theme.dart';
import 'src2/app/theme/themeDark.dart';
import 'src/views/pages/_navigation_pages/navigation_bar.dart';
import 'src2/controllers/_global_controller.dart';

main() async {
  WidgetsFlutterBinding.ensureInitialized();
  // _prefs.openPrefs();
  await GetStorage.init();
  //
  GetIt getIt = GetIt.I;
  getIt.registerSingleton<LoginStore>(LoginStore());
  getIt.registerSingleton<PushStore>(PushStore());
  getIt.registerSingleton<HomeStore>(HomeStore());

  SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]).then(
    (value) => runApp(MyApp()),
  );
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    //com.example.user //prueba
    //com.proypet.user //produccion
    Get.put(GlobalController());
    return GetMaterialApp(
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
        const Locale('es', 'ES'),
        const Locale('en', 'US'),
      ],
      initialRoute: '/',
      defaultTransition: Transition.fadeIn,
      getPages: getRutas(),
      onGenerateRoute: (settings) => GetPageRoute(page: () => NavigationBar(currentTabIndex: 0)),
      // onGenerateRoute: (RouteSettings settings) => MaterialPageRoute(builder: (_) => NavigationBar(currentTabIndex: 0)),
    );
  }
}

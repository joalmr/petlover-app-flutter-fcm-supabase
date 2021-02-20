import 'package:flutter/material.dart';
import 'package:flutter_config/flutter_config.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:get/route_manager.dart';
import 'package:get_storage/get_storage.dart';

import 'package:proypet/routes/routes.dart';
import 'package:get/get.dart';
import 'package:proypet/source/home/controller/home_controller.dart';
import 'config/global_variables.dart';

import 'design/theme/theme.dart';
import 'design/theme/themeDark.dart';
import 'source/_navbar/view/navigation_bar.dart';
import 'source/_global/_global_controller.dart';
import 'source/veterinarias/controller/filtra_vets_controller.dart';
import 'source/veterinarias/controller/lista_vets_controller.dart';

// //proypet user
// FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin = FlutterLocalNotificationsPlugin();

main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await FlutterConfig.loadEnvVariables();
  await GetStorage.init();

  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    Get.put(HomeController());
    Get.put(GlobalController());
    Get.put(VeterinariasController());
    Get.put(FiltraVetsController());

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
      onGenerateRoute: (settings) => GetPageRoute(
        page: () => NavigationBar(currentTabIndex: 0),
      ),
    );
  }
}

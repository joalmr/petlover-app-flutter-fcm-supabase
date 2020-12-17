import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:get/route_manager.dart';
import 'package:get_storage/get_storage.dart';
import 'package:proypet/src/controllers/home_controller/home_controller.dart';
import 'package:proypet/src/routes/routes.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'config/global_variables.dart';
import 'src/controllers/veterinaria_controller/filtra_vets_controller.dart';
import 'src/controllers/veterinaria_controller/lista_vets_controller.dart';
import 'src/theme/theme.dart';
import 'src/theme/themeDark.dart';
import 'src/app/views/pages/_nav_bar/navigation_bar.dart';
import 'src/controllers/_global_controller.dart';

//proypet user
main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await GetStorage.init();
  SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]).then(
    (value) => runApp(MyApp()),
  );
}

class MyApp extends StatelessWidget {
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

import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:get_storage/get_storage.dart';
import 'package:proypet/routes/routes.dart';
import 'package:get/get.dart';
import 'config/variables_globales.dart';
import 'design/theme/theme.dart';
import 'design/theme/themeDark.dart';
import 'source/_global/_global_controller.dart';
import 'source/_navbar/presentation/view/navigation_bar.dart';
import 'source/home/domain/controller/home_controller.dart';
import 'source/veterinarias/domain/controller/filtra_vets_controller.dart';
import 'source/veterinarias/domain/controller/lista_vets_controller.dart';

//! push: probar todos los push
Future main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await dotenv.load(fileName: ".env");
  await Firebase.initializeApp();
  await GetStorage.init();

  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
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
      ],
      initialRoute: '/',
      defaultTransition: Transition.fadeIn,
      getPages: AppRoutes().getRutas(),
      onGenerateRoute: (settings) => GetPageRoute(
        page: () => NavigationBar(),
      ),
    );
  }
}
// const Locale('en', 'US'),

import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:proypet/src/providers/user_provider.dart';
import 'package:proypet/src/utils/preferencias_usuario/preferencias_usuario.dart';
import 'package:proypet/src/routes/routes.dart';
import 'package:proypet/src/utils/utils.dart';
import 'package:proypet/src/views/components/navigation_bar.dart';
import 'package:flutter/services.dart';
import 'package:proypet/src/styles/styles.dart';

final prefs = new PreferenciasUsuario();
void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await prefs.initPrefs();
  SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp])
      .then((value) => runApp(MyApp()));
  // runApp(MyApp());
}

class MyApp extends StatefulWidget {
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  final GlobalKey<NavigatorState> navigatorKey =
      new GlobalKey<NavigatorState>();

  final loginProvider = UserProvider();
  var rutaInicio = 'login';

  @override
  void initState() {
    if (prefs.token.trim() != null && prefs.token.trim() != '') {
      if (!fnGetVerify()) {
        print('== pasa log out ==');
        loginProvider.logOut();
      } else {
        print('== pasa ok ==');
        rutaInicio = 'navInicio';
      }
    }
    // if (!fnGetVerify()) {
    //   loginProvider.logOut();
    // } else {
    //   if (prefs.token.trim() != null && prefs.token.trim() != '') {
    //     // loginProvider.validateMain();
    //     rutaInicio = 'navInicio';
    //   }
    // }
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    const MaterialColor newteal = MaterialColor(
      0xFF00A48C,
      <int, Color>{
        50: Color(0xFF00A48C),
        100: Color(0xFF00A48C),
        200: Color(0xFF00A48C),
        300: Color(0xFF00A48C),
        400: Color(0xFF00A48C),
        500: Color(0xFF00A48C), //base
        600: Color(0xFF00A48C),
        700: Color(0xFF00A48C),
        800: Color(0xFF00A48C),
        900: Color(0xFF00A48C),
      },
    );

    //com.example.user //prueba
    //com.example.user //produccion
    return MaterialApp(
      debugShowCheckedModeBanner:
          true, // TODO: cambiar antes de lanzar y tambien cambiar el com.example.user para produccion es false
      navigatorKey: navigatorKey,
      title: 'Proypet',
      theme: ThemeData(
        fontFamily: 'Lato',
        brightness: Brightness.light,
        primarySwatch: newteal,
        backgroundColor: colorGray1,
        appBarTheme: AppBarTheme(
          textTheme: TextTheme(
            headline6: TextStyle(
              fontSize: 18.0,
            ),
          ),
        ),
        dialogTheme: DialogTheme(
          shape: shape10,
        ),
        cardTheme: CardTheme(shape: shape10, elevation: .05),
        inputDecorationTheme: InputDecorationTheme(
          filled: true,
          fillColor: colorGray1,
          contentPadding:
              EdgeInsets.symmetric(horizontal: 12.0, vertical: 12.0),
          hintStyle: TextStyle(fontSize: 14.0),
          border: new OutlineInputBorder(
            borderRadius: new BorderRadius.circular(10.0),
            borderSide: new BorderSide(style: BorderStyle.none, width: 0),
          ),
          focusedBorder: new OutlineInputBorder(
            borderRadius: new BorderRadius.circular(10.0),
            borderSide: new BorderSide(style: BorderStyle.none, width: 0),
          ),
        ),
        textTheme: TextTheme(
          headline1: TextStyle(color: Colors.black54),
          headline2: TextStyle(color: Colors.black54),
          headline3: TextStyle(color: Colors.black54),
          headline4: TextStyle(color: Colors.black54),
          headline5: TextStyle(color: Colors.black54, fontSize: 26.0),
          headline6: TextStyle(color: Colors.black54, fontSize: 20.0),
          subtitle1: TextStyle(color: Colors.black54, fontSize: 16.0),
          subtitle2: TextStyle(color: Colors.black54, fontSize: 14.0),
          bodyText1: TextStyle(color: Colors.black54, fontSize: 16.0),
          bodyText2: TextStyle(color: Colors.black54, fontSize: 14.0),
        ),
      ),
      darkTheme: ThemeData(
        fontFamily: 'Lato',
        brightness: Brightness.dark,
        primarySwatch: newteal,
        backgroundColor: colorDark3,
        floatingActionButtonTheme: FloatingActionButtonThemeData(
            backgroundColor: colorMain, foregroundColor: Colors.white),
        appBarTheme: AppBarTheme(
          textTheme: TextTheme(
            headline6: TextStyle(
              fontSize: 18.0,
            ),
          ),
        ),
        dialogBackgroundColor: colorDark3,
        dialogTheme: DialogTheme(
          shape: shape10,
        ),
        cardTheme: CardTheme(
          shape: shape10,
          elevation: .05,
          color: colorDark3,
        ),
        inputDecorationTheme: InputDecorationTheme(
          filled: true,
          fillColor: colorDark3,
          contentPadding:
              EdgeInsets.symmetric(horizontal: 12.0, vertical: 12.0),
          hintStyle: TextStyle(fontSize: 14.0, color: Colors.grey),
          border: new OutlineInputBorder(
            borderRadius: new BorderRadius.circular(10.0),
            borderSide: new BorderSide(style: BorderStyle.none, width: 0),
          ),
          focusedBorder: new OutlineInputBorder(
            borderRadius: new BorderRadius.circular(10.0),
            borderSide: new BorderSide(style: BorderStyle.none, width: 0),
          ),
        ),
        dividerColor: colorDark3,
        textTheme: TextTheme(
          headline1: TextStyle(color: Colors.white),
          headline2: TextStyle(color: Colors.white),
          headline3: TextStyle(color: Colors.white),
          headline4: TextStyle(color: Colors.white),
          headline5: TextStyle(color: Colors.white, fontSize: 26.0),
          headline6: TextStyle(color: Colors.white, fontSize: 20.0),
          subtitle1: TextStyle(color: Colors.white, fontSize: 16.0),
          subtitle2: TextStyle(color: Colors.white, fontSize: 14.0),
          bodyText1: TextStyle(color: Colors.white, fontSize: 16.0),
          bodyText2: TextStyle(color: Colors.white, fontSize: 14.0),
        ),
      ),
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
      initialRoute: rutaInicio,
      onGenerateRoute: (RouteSettings settings) => MaterialPageRoute(
          builder: (BuildContext context) =>
              NavigationBar(currentTabIndex: 0)), //ruta general
    );
  }
}

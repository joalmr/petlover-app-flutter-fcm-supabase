import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
// import 'package:proypet/src/bloc/provider.dart';
import 'package:proypet/src/preferencias_usuario/preferencias_usuario.dart';
// import 'package:proypet/src/push-providers/push_provider.dart';
import 'package:proypet/src/routes/routes.dart';
import 'package:proypet/src/shared/navigation_bar.dart';

import 'package:flutter/services.dart';
import 'package:proypet/src/styles/styles.dart';
 
 final prefs = new PreferenciasUsuario();
void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  
  await prefs.initPrefs();

  SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]).then((value) => runApp(MyApp()) );
  // runApp(MyApp());
} 

class MyApp extends StatefulWidget {

  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  
  final GlobalKey<NavigatorState> navigatorKey = new GlobalKey<NavigatorState>();
  
  @override
  void initState(){
    super.initState();

    // final pushProvider = new PushProvider();
    // pushProvider.initNotificaciones();

    // pushProvider.mensajes.listen((data) { 

    //   print('===== Notificacion =====');
    //   print(data);

    //   navigatorKey.currentState.pushNamed('mensaje', arguments: data);

    // });
  }


  @override
  Widget build(BuildContext context) {
   
    var rutaInicio='login';
    if(prefs.token!=''){
      // loginProvider.validateMain();
      rutaInicio='navInicio';
    }

    return MaterialApp(
        debugShowCheckedModeBanner: true, // TODO: cambiar antes de lanzar y tambien cambiar el com.example.user
        navigatorKey: navigatorKey,
        title: 'Proypet',
        theme: ThemeData(
          fontFamily: 'Lato',
          textTheme: TextTheme(
            headline1: TextStyle( color: Colors.black54),
            headline2: TextStyle( color: Colors.black54),
            headline3: TextStyle( color: Colors.black54),
            headline4: TextStyle( color: Colors.black54),
            headline5: TextStyle( color: Colors.black54, fontSize: 26.0 ),
            headline6: TextStyle( color: Colors.black54, fontSize: 20.0 ),

            subtitle1: TextStyle( color: Colors.black54, fontSize: 16.0),
            subtitle2: TextStyle( color: Colors.black54, fontSize: 14.0),

            bodyText1: TextStyle( color: Colors.black54, fontSize: 16.0),
            bodyText2: TextStyle( color: Colors.black54, fontSize: 14.0),            
          ),
          primarySwatch: Colors.teal,
          primaryColor: colorMain,
          accentColor: colorMain,
          cursorColor: colorMain,          
          backgroundColor: colorGray1,
          floatingActionButtonTheme: FloatingActionButtonThemeData(
            backgroundColor: colorMain,
            foregroundColor: Colors.white
          ),
          appBarTheme: AppBarTheme(
            textTheme: TextTheme(
              headline6: TextStyle( fontSize: 18.0 ),
            ),
          ),
          // dialogBackgroundColor: colorDark1,
          dialogTheme: DialogTheme(
            shape: shape10,
          ),
          cardTheme: CardTheme(
            shape: shape10,
            elevation: .05
          ),
          inputDecorationTheme: InputDecorationTheme(
            filled: true,
            fillColor: colorGray1,
            contentPadding: EdgeInsets.symmetric(horizontal: 12.0, vertical: 12.0),
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
          // indicatorColor: colorMain,
        ),
        darkTheme: ThemeData(
          fontFamily: 'Lato',
          textTheme: TextTheme(
            headline1: TextStyle( color: Colors.white),
            headline2: TextStyle( color: Colors.white),
            headline3: TextStyle( color: Colors.white),
            headline4: TextStyle( color: Colors.white),
            headline5: TextStyle( color: Colors.white, fontSize: 26.0 ),
            headline6: TextStyle( color: Colors.white, fontSize: 20.0 ),

            subtitle1: TextStyle( color: Colors.white, fontSize: 16.0),
            subtitle2: TextStyle( color: Colors.white, fontSize: 14.0),

            bodyText1: TextStyle( color: Colors.white, fontSize: 16.0),
            bodyText2: TextStyle( color: Colors.white, fontSize: 14.0),            
          ),
          primarySwatch: Colors.teal,
          primaryColor: colorMain,
          accentColor: colorMain,
          cursorColor: colorMain,
          backgroundColor: colorDark1,
          scaffoldBackgroundColor: colorDark2,
          floatingActionButtonTheme: FloatingActionButtonThemeData(
            backgroundColor: colorMain,
            foregroundColor: Colors.white
          ),
          appBarTheme: AppBarTheme(
            textTheme: TextTheme(
              headline6: TextStyle( fontSize: 18.0 ),
            ),
          ),
          dialogBackgroundColor: colorDark1,
          dialogTheme: DialogTheme(
            shape: shape10,
          ),
          cardTheme: CardTheme(
            shape: shape10,
            elevation: .05,
            color: colorDark1,
          ),
          inputDecorationTheme: InputDecorationTheme(
            filled: true,
            fillColor: colorDark3,
            contentPadding: EdgeInsets.symmetric(horizontal: 12.0, vertical: 12.0),
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
          // indicatorColor: colorMain,
          dividerColor: colorDark3,
        ),
        localizationsDelegates: [
          GlobalMaterialLocalizations.delegate,
          GlobalWidgetsLocalizations.delegate,
          GlobalCupertinoLocalizations.delegate,
        ],
        supportedLocales: [
            const Locale('en','US'),
            const Locale('es','ES'), //PE
          ],     
        routes: getRoutes(),
        initialRoute: rutaInicio,
        onGenerateRoute: (RouteSettings settings) => 
          MaterialPageRoute(builder: (BuildContext context)=>NavigationBar(currentTabIndex: 0)), //ruta general
      );
  }
}
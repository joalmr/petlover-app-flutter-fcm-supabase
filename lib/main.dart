import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:proypet/src/bloc/provider.dart';
import 'package:proypet/src/preferencias_usuario/preferencias_usuario.dart';
// import 'package:proypet/src/push-providers/push_provider.dart';
import 'package:proypet/src/routes/routes.dart';
import 'package:proypet/src/shared/navigation_bar.dart';

import 'package:flutter/services.dart';
 
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

    return Provider(
      child: MaterialApp(
        debugShowCheckedModeBanner: false, 
        navigatorKey: navigatorKey,
        title: 'Proypet',
        theme: ThemeData( 
          fontFamily: 'Lato',
          primarySwatch: Colors.teal,
          cursorColor: Colors.teal
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
      ),
    );
  }
}
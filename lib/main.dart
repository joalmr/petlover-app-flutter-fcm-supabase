import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:proypet/src/pages/shared/navigation_bar.dart';
import 'package:proypet/src/preferencias_usuario/preferencias_usuario.dart';
import 'package:proypet/src/push-providers/push_provider.dart';
import 'package:proypet/src/routes/routes.dart';
 
 final prefs = new PreferenciasUsuario();
void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  
  await prefs.initPrefs();

  runApp(MyApp());
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

    final pushProvider = new PushProvider();

    pushProvider.mensajes.listen((data) { 

      print('Argumento');
      print(data);


      navigatorKey.currentState.pushNamed('mensaje', arguments: data);

    });



  }

  @override
  Widget build(BuildContext context) {
    
    // final prefs = new PreferenciasUsuario();
    // final loginProvider = UserProvider();
    
    var rutaInicio='login';
    if(prefs.token!=''){
      // loginProvider.validateMain();
      rutaInicio='navInicio';
    }

    return MaterialApp(
      debugShowCheckedModeBanner: false, 
      navigatorKey: navigatorKey,
      title: 'Proypet',
      theme: ThemeData( 
        fontFamily: 'Lato', //GoogleFonts.lato(),//
        primarySwatch: Colors.teal,
      ),      
      localizationsDelegates: [
        // ... app-specific localization delegate[s] here
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
      ],
      supportedLocales: [
          const Locale('en','US'), // English
          const Locale('es','ES'), // Español
        ],     
      routes: getRoutes(),
      initialRoute: rutaInicio,
      onGenerateRoute: (RouteSettings settings){
        return MaterialPageRoute(
          builder: (BuildContext context)=>NavigationBar(currentTabIndex: 0) //ruta general
        );
      },
    );
  }
}
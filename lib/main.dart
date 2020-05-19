import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:proypet/src/pages/shared/navigation_bar.dart';
import 'package:proypet/src/preferencias_usuario/preferencias_usuario.dart';
import 'package:proypet/src/routes/routes.dart';
 
void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  final prefs = new PreferenciasUsuario();
  await prefs.initPrefs();

  runApp(MyApp());
} 

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    
    final prefs = new PreferenciasUsuario();
    // final loginProvider = UserProvider();
    
    var rutaInicio='login';
    if(prefs.token!=''){
      // loginProvider.validateMain();
      rutaInicio='navInicio';
    }

    return MaterialApp(
      title: 'Proypet',
      theme: ThemeData( 
        fontFamily: 'Lato', //GoogleFonts.lato(),//
        primarySwatch: Colors.teal,
      ) ,
      debugShowCheckedModeBanner: false, 
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
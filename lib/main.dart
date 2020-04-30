import 'package:flutter/material.dart';
import 'package:proypet/src/pages/auth/login_page.dart';
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
    
    var rutaInicio='login';
    if(prefs.token!=''){
      rutaInicio='navInicio';
    }
    
    // SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
    //   statusBarColor: colorMain
    // ));

    return MaterialApp(
      title: 'Proypet',
      theme: ThemeData( 
        fontFamily: 'Lato',
        primarySwatch: Colors.teal,
      ) ,
      debugShowCheckedModeBanner: false,      
      routes: getRoutes(),
      initialRoute: rutaInicio,
      onGenerateRoute: (RouteSettings settings){
        return MaterialPageRoute(
          builder: (BuildContext context)=>LoginPage() //cuando falle NavigationBar(currentTabIndex: 0)
        );
      },      
    );
  }
}



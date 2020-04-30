import 'package:flutter/material.dart';
import 'package:proypet/src/pages/auth/login_page.dart';
import 'package:proypet/src/preferencias_usuario/preferencias_usuario.dart';
import 'package:proypet/src/providers/user_provider.dart';
import 'package:proypet/src/routes/routes.dart';
 

// final prefs = new PreferenciasUsuario();

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  final prefs = new PreferenciasUsuario();
  await prefs.initPrefs();
  runApp(MyApp());
}

final loginProvider = UserProvider();
var rutaInicio='login';
dynamic resp;

_valida() async {
  resp = await loginProvider.getUserSummary();
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    
    final prefs = new PreferenciasUsuario();
    
    
    if(prefs.token!=''){
      _valida();
      if(resp != null) {
        rutaInicio='navInicio';
      }

      else{
        print("valor null");
        prefs.token = '';
        prefs.position='';
      }
    }

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



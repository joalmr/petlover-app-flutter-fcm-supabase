import 'package:flutter/material.dart';
import 'package:proypet/src/pages/auth/login_page.dart';
import 'package:proypet/src/preferencias_usuario/preferencias_usuario.dart';
import 'package:proypet/src/providers/user_provider.dart';
import 'package:proypet/src/routes/routes.dart';
 

final loginProvider = UserProvider();
final prefs = new PreferenciasUsuario();

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await prefs.initPrefs();
  runApp(MyApp());
}

var rutaInicio='login';

_validaStream() async {
  var resp = await loginProvider.getUserSummary();
  if(resp!=null) {
    rutaInicio='navInicio';
  }
  else{
    print("valor null");
    prefs.token = '';
    prefs.position='';
  }
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    
    _validaStream();

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



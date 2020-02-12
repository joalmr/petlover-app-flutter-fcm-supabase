import 'package:flutter/material.dart';
import 'package:proypet/src/pages/shared/navigation_bar.dart';
import 'package:proypet/src/pages/shared/styles/styles.dart';
//import 'package:proypet/src/pages/home_page.dart';
// import 'package:proypet/src/pages/login_page.dart';
import 'package:proypet/src/routes/routes.dart';
 
void main() => runApp(MyApp());




class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Proypet',
      theme: ThemeData( 
        primarySwatch: colorMain
      ),
      debugShowCheckedModeBanner: false,      
      routes: getRoutes(),
      initialRoute: 'login',
      onGenerateRoute: (RouteSettings settings){
        return MaterialPageRoute(
          builder: (BuildContext context)=>NavigationBar(currentTabIndex: 1) //cuando falle
        );
      },      
    );
  }
}

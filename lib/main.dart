import 'package:flutter/material.dart';
import 'package:proypet/src/pages/home_page.dart';
// import 'package:proypet/src/pages/login_page.dart';
import 'package:proypet/src/routes/routes.dart';
 
void main() => runApp(MyApp());

final colorMain = Colors.green;//Color.fromRGBO(1, 165, 141, 1.0)
final colorSec = Color.fromRGBO(125, 35, 75, 1);
final shapeBtn = RoundedRectangleBorder(borderRadius: BorderRadius.circular(100.0));


class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Proypet',
      debugShowCheckedModeBanner: false,      
      routes: getRoutes(),
      initialRoute: 'login',
      onGenerateRoute: (RouteSettings settings){
        return MaterialPageRoute(
          builder: (BuildContext context)=>HomePage(), //cuando falle
        );
      },      
    );
  }
}

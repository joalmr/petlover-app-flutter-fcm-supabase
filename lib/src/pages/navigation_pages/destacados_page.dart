import 'package:flutter/material.dart';
import 'package:proypet/src/model/destacado/destacado_model.dart';
import 'package:proypet/src/pages/shared/appbar_menu.dart';
import 'package:proypet/src/pages/shared/styles/styles.dart';
import 'package:proypet/src/providers/destacado_provider.dart';

class DestacadosPage extends StatefulWidget {
  @override
  _DestacadosPageState createState() => _DestacadosPageState();
}

class _DestacadosPageState extends State<DestacadosPage> {
  DestacadoProvider destacadoProvider = DestacadoProvider();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appbar(leadingH,'Destacados',null),
      body: _onDestacado(),
    );
  }

  _onDestacado(){
    return SingleChildScrollView(
      child: Column(
        children: <Widget>[
          _destacado(destacadoList[0])
        ],
      ),
    );
  }

  _destacado(destacado){
    return Container(
      margin: EdgeInsets.symmetric(vertical: 10.0,horizontal: 20.0),
      child: Material(
        color: Colors.white,
        borderRadius: BorderRadius.circular(10.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            ClipRRect(
              borderRadius: BorderRadius.circular(10.0),
              child: Image(
                fit: BoxFit.cover,
                height: 300,                
                image: AssetImage(destacado.image)
              ),
            ),
            Text(destacado.title, style: TextStyle(fontWeight: FontWeight.bold),),
            Text(destacado.text, maxLines: 3, textAlign: TextAlign.justify,),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: <Widget>[
                FlatButton(
                  onPressed: ()=>Navigator.pushNamed(context, 'detalledestacado', arguments: destacado), 
                  child: Text("Leer más", 
                    style: TextStyle(color: colorMain,),
                  )
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
import 'package:flutter/material.dart';
import 'package:proypet/src/model/destacado/destacado_model.dart';
import 'package:proypet/src/providers/destacado_provider.dart';
import 'package:proypet/src/shared/appbar_menu.dart';
import 'package:proypet/src/styles/styles.dart';


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
      child: InkWell(
        onTap: ()=>Navigator.pushNamed(context, 'detalledestacado', arguments: destacado),
        child: Card(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              ClipRRect(
                borderRadius: BorderRadius.circular(10.0),
                child: Image(
                  fit: BoxFit.cover,
                  height: 300,      
                  width: double.infinity,          
                  image: AssetImage(destacado.image)
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 10.0,right: 10.0,top:10.0),
                child: Text(destacado.title, style: 
                  Theme.of(context).textTheme.subtitle2.apply(fontWeightDelta: 2)
                // tituloH4clasico,
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 10.0),
                child: Text(destacado.text, maxLines: 3, textAlign: TextAlign.justify, ),
              ),
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
        )
        // Material(
        //   color: Theme.of(context).backgroundColor,
        //   borderRadius: BorderRadius.circular(10.0),
        //   child: ,
        // ),
      ),
    );
  }
}
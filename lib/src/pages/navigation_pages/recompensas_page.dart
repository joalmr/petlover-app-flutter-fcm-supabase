import 'package:animate_do/animate_do.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:proypet/src/model/bonificacion/bonificacion_model.dart';
import 'package:proypet/src/pages/shared/appbar_menu.dart';
import 'package:proypet/src/pages/shared/styles/styles.dart';
import 'package:proypet/src/providers/bonificacion_provider.dart';

class RecompensasPage extends StatelessWidget {
  final bonificacionProvider = BonificacionProvider();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appbar(leadingH,'Recompensas',null),
      body: _onPage(),
    );
  }

  Widget _onPage(){
    return FutureBuilder(
      future: bonificacionProvider.getBonificacion(),
      builder: (BuildContext context, AsyncSnapshot<BonificacionModel> snapshot) {
        if(!snapshot.hasData){
          return LinearProgressIndicator(
            backgroundColor: Colors.grey[200],
          );
        }
        else {
          BonificacionModel bonificacion = snapshot.data;
          return SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.start,
              children: <Widget>[
                FadeIn(
                  child: Padding(
                    padding: const EdgeInsets.symmetric(vertical: 20.0, horizontal: 30.0),
                    child: Row(
                      children: <Widget>[
                        Expanded(
                          // flex: 2,
                          child: Container(
                            padding: EdgeInsets.all(8.0),
                            height: 120.0,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10.0),
                              color: colorBlue,
                            ),
                            child: Padding(
                              padding: const EdgeInsets.symmetric(horizontal: 30.0),
                              child: Row(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: <Widget>[
                                  Icon(FontAwesomeIcons.coins, color: Colors.white, size: 50.0,),
                                  Align(
                                    alignment: Alignment.centerRight,
                                    child: Column(
                                      crossAxisAlignment: CrossAxisAlignment.end,
                                      mainAxisAlignment: MainAxisAlignment.center,
                                      children: <Widget>[
                                        Text('${bonificacion.points}',style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 30.0,),),
                                        Text('Puntos acumulados', style: TextStyle(color: Colors.white60, fontSize: 12.0, fontWeight: FontWeight.bold),),
                                      ],
                                    ),
                                  )
                                ],
                              ),
                            ),
                          )
                        ),
                      ],
                    ),
                  ),
                ),
                SizedBox(height: 20.0,),
                FadeIn(
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20.0),
                    child: Text('Últimos puntos ganados', style: TextStyle(fontSize: 14.0, fontWeight: FontWeight.bold)),
                  ),
                ),
                FadeIn(child: _listaBonificacion(bonificacion.bonifications)),                
              ],
            ),
          );

        }
        
      },
    );
  }

  Widget _listaBonificacion(List<Bonification> bonificados){
    if(bonificados.length<1)
    return Center(
      child: Text("No tiene puntos ganados"),
    );
    
    else
    return ListView.builder(
      physics: NeverScrollableScrollPhysics(),
      shrinkWrap: true,
      itemCount: bonificados.length,
      itemBuilder: (BuildContext context, int index) {
        return Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10.0),
          child: ListTile(
            title: Text('${bonificados[index].establishmentName}',style: TextStyle(fontSize: 14.0)),
            trailing: CircleAvatar(
              backgroundColor: colorBlue,
              foregroundColor: Colors.white,
              child: Text('+${bonificados[index].points}', style: TextStyle(fontSize: 12.0, fontWeight: FontWeight.bold),)
            ),
            // trailing: Text('+15', style: TextStyle(fontSize: 14.0),),
          ),
        );
     },
    );

  }
}
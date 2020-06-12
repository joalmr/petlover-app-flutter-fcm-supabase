import 'dart:async';
import 'package:animate_do/animate_do.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:proypet/src/model/bonificacion/bonificacion_model.dart';
import 'package:proypet/src/providers/bonificacion_provider.dart';
import 'package:proypet/src/shared/appbar_menu.dart';
import 'package:proypet/src/styles/styles.dart';
import 'package:proypet/src/styles/titulos.dart';
import 'package:proypet/src/utils/error_internet.dart';


class RecompensasPage extends StatefulWidget {
  @override
  _RecompensasPageState createState() => _RecompensasPageState();
}

class _RecompensasPageState extends State<RecompensasPage> {
  final bonificacionProvider = BonificacionProvider();
  var refreshKey = GlobalKey<RefreshIndicatorState>();
  var stream;

  Future<BonificacionModel> newFuture() => bonificacionProvider.getBonificacion();

  Future<Null> _onRefresh() async {
    refreshKey.currentState?.show();
    await Future.delayed(Duration(milliseconds: 2));
    setState(() {
      stream = newFuture();        
    });
    return null;
  }

  @override
  void initState() {
    //implement initState
    super.initState();
    _onRefresh();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appbar(leadingH,'Puntos',null),
      body: RefreshIndicator(
        key: refreshKey,
        onRefresh: _onRefresh,
        child: _onPage()
      ),
    );
  }

  Widget _onPage(){
    return FutureBuilder(
      future: stream,//bonificacionProvider.getBonificacion(),
      builder: (BuildContext context, AsyncSnapshot<BonificacionModel> snapshot) {
        if(snapshot.connectionState != ConnectionState.done){
          return LinearProgressIndicator(
            backgroundColor: Colors.grey[200],
          );
        }
        else {
          if(snapshot.hasError){
            return errorInternet();
          }
          
          BonificacionModel bonificacion = snapshot.data;
          return ListView(
            // padding: ,
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
                            color: colorMain,
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
                                      Text('Puntos acumulados', style: TextStyle(color: Colors.white60, fontSize: sizeH5, fontWeight: FontWeight.bold),),
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
                  child: Text('Últimos puntos ganados', style: tituloH4),
                ),
              ),
              FadeIn(child: _listaBonificacion(bonificacion.bonifications)),                
            ],
          );

        }
        
      },
    );
  }

  Widget _listaBonificacion(List<Bonification> bonificados){
    if(bonificados.length<1)
    return Center(
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 10.0),
        child: Text("No tiene puntos ganados", ),
      ),
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
            title: Text('${bonificados[index].establishmentName}',style: TextStyle(fontSize: sizeH4)),
            trailing: CircleAvatar(
              backgroundColor: colorMain,
              foregroundColor: Colors.white,
              child: Text('+${bonificados[index].points}', style: TextStyle(fontSize: sizeH5, fontWeight: FontWeight.bold),)
            ),
          ),
        );
     },
    );

  }
}
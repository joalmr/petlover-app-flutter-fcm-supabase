import 'package:flutter/material.dart';
import 'package:proypet/src/pages/reserva/reserva_lista_page.dart';
import 'package:proypet/src/pages/reserva/reserva_mapa_page.dart';

import 'package:proypet/src/pages/shared/appbar_menu.dart';
import 'package:proypet/src/pages/shared/enddrawer/filtros_mapa.dart';
import 'package:proypet/src/providers/establecimiento_provider.dart';


class ReservaPage extends StatefulWidget {
  @override
  _ReservaPageState createState() => _ReservaPageState();
}

class _ReservaPageState extends State<ReservaPage> {
  final GlobalKey<ScaffoldState> _key = GlobalKey<ScaffoldState>();

  EstablecimientoProvider vetProvider = EstablecimientoProvider();

  @override
  Widget build(BuildContext context) {
    
    return _onTab();
    // return FutureBuilder(
    //   future: vetProvider.getVets(),
    //   builder: (BuildContext context, AsyncSnapshot<List<EstablecimientoModel>> snapshot){
    //     final mydata=snapshot.data[0];
    //     print(mydata);
    //   }
    // );

    
  }

  _onTab(){
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        key: _key,
        endDrawer: FiltrosMapa(),
        appBar: appbar2(
          leadingH,
          titleH,
          <Widget>[
            IconButton(
              icon: Icon(Icons.filter_list),
              onPressed: (){ _key.currentState.openEndDrawer(); },
            ),
          ],
          TabBar(            
            tabs: [
              Text('Lista',style: TextStyle(fontSize: 16.0),),
              Text('Mapa',style: TextStyle(fontSize: 16.0),),
            ]
          ),
        ),     
        body: TabBarView(
          children: <Widget>[
            ReservaListaPage(),
            ReservaMapaPage()
          ],
        )
        
        // floatingActionButton: FloatingActionButton(
        //   onPressed: ()=>Navigator.push(context, MaterialPageRoute(
        //     builder: (_)=>ReservaMapaPage(),
        //   )),
        //   child: Icon(Icons.location_on),
        //   backgroundColor: colorMain,
        // ),
        // floatingActionButtonLocation: FloatingActionButtonLocation.endFloat

      ),
    );
  }
}
import 'package:flutter/material.dart';
import 'package:proypet/src/model/establecimiento/establecimiento_model.dart';
import 'package:proypet/src/pages/reserva/buildVets/buildVet.dart';
import 'package:proypet/src/pages/reserva/reserva_mapa_page.dart';
import 'package:proypet/src/pages/shared/appbar_menu.dart';
import 'package:proypet/src/pages/shared/enddrawer/filtros_mapa.dart';
import 'package:proypet/src/pages/shared/styles/styles.dart';
import 'package:proypet/src/providers/establecimiento_provider.dart';

class ReservaList extends StatefulWidget {
  @override
  _ReservaListState createState() => _ReservaListState();
}

class _ReservaListState extends State<ReservaList> {
  final GlobalKey<ScaffoldState> _key = GlobalKey<ScaffoldState>();
  EstablecimientoProvider vetProvider = EstablecimientoProvider();

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
        future: vetProvider.getVets(),
        builder: (BuildContext context, AsyncSnapshot<List<EstablecimientoModel>> snapshot){
          if(!snapshot.hasData)
            return Center(child: CircularProgressIndicator());
          else{
            return Scaffold(
              key: _key,
              endDrawer: FiltrosMapa(),
              body: _onTab(snapshot.data),
            );
          }
            
        }
      );
  }

  _onTab(List<EstablecimientoModel> vetLocales) {    
    return Stack(
      children: <Widget>[
        CustomScrollView(
          slivers: <Widget>[
            SliverAppBar(
              backgroundColor: colorMain,
              leading: leadingH,
              title: Text('Establecimientos', style: TextStyle(fontSize: 18.0,)),
              actions: <Widget>[
                IconButton(
                  icon: Icon(Icons.filter_list),
                  onPressed: (){ _key.currentState.openEndDrawer(); },
                ),
              ],
              floating: true,
              pinned: true,
              expandedHeight: 100.0,
              flexibleSpace: Container(
                padding: EdgeInsets.only(top: 40.0),
                child: Padding(
                    padding: const EdgeInsets.only(top: 50.0),
                    child: FlatButton(
                      child: Text('Ver Mapa', style: TextStyle(color: Colors.white)),
                      onPressed: ()=>Navigator.push(
                        context,MaterialPageRoute(builder: (context) => ReservaMapaPage(establecimientos: vetLocales))
                      ),
                    ),
                  ),

              ),
            ),
            SliverList(
              delegate: SliverChildBuilderDelegate(
                (BuildContext context, int index){
                  return buildVets(context,index, vetLocales);
                },
                childCount: vetLocales.length
              ),
            ),
            SliverToBoxAdapter(
              child: SizedBox(height: 50.0),
            ),
          ],
        ),
      ],
    );
  }
}
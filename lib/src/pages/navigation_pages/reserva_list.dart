import 'package:flutter/material.dart';
import 'package:proypet/icon_proypet_icons.dart';
import 'package:proypet/src/model/establecimiento/establecimiento_model.dart';
import 'package:proypet/src/pages/reserva/buildVets/buildVet.dart';
import 'package:proypet/src/pages/reserva/buildVets/futureVet.dart';
import 'package:proypet/src/pages/reserva/reserva_mapa_page.dart';
import 'package:proypet/src/pages/shared/appbar_menu.dart';
import 'package:proypet/src/pages/shared/enddrawer/filtros_mapa.dart';
import 'package:proypet/src/pages/shared/icons_map.dart';
import 'package:proypet/src/pages/shared/styles/styles.dart';
import 'package:proypet/src/preferencias_usuario/preferencias_usuario.dart';
import 'package:proypet/src/providers/establecimiento_provider.dart';

class ReservaList extends StatefulWidget {
  final int marcar;
  ReservaList({this.marcar});
  @override
  _ReservaListState createState() => _ReservaListState(marcar: marcar);
}

class _ReservaListState extends State<ReservaList> {
  int marcar;
  _ReservaListState({this.marcar});
  final GlobalKey<ScaffoldState> _key = GlobalKey<ScaffoldState>();
  EstablecimientoProvider vetProvider = EstablecimientoProvider();
  List<dynamic> listaFiltros=[];
  final _prefs = new PreferenciasUsuario();
  
  @override
  Widget build(BuildContext context) {
  
    print(_prefs.position);
    // print(marcar);
    if(marcar!=null){
      listaFiltros.clear();
      if(marcar==1) listaFiltros.add({"name":"Consulta","icon":"consultation"});
      if(marcar==2) listaFiltros.add({"name":"Vacunas","icon":"vaccination"});
      if(marcar==3) listaFiltros.add({"name":"Baños","icon":"grooming"});
      if(marcar==4) listaFiltros.add({"name":"Desparasitaciones","icon":"deworming"});
    }
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
              floatingActionButton: FloatingActionButton(
                onPressed: ()=>Navigator.push(context,MaterialPageRoute(builder: (context) => ReservaMapaPage(establecimientos: snapshot.data))),
                child: Icon(Icons.location_on),
                backgroundColor: colorMain,
              ),
              floatingActionButtonLocation: FloatingActionButtonLocation.endFloat
            );
          }    
        }
      );
  }

  _onTab(List<EstablecimientoModel> vetLocales) {    
    // vetLocales.sort((a,b)=>a.distancia.compareTo(b.distancia));
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
                    padding: const EdgeInsets.only(top: 50.0,bottom: 5.0),
                    child: SingleChildScrollView(
                      scrollDirection: Axis.horizontal,
                      child: _listarChip(listaFiltros),
                    )
                    // FlatButton(
                    //   child: Text('Ver Mapa', style: TextStyle(color: Colors.white)),
                    //   onPressed: ()=>Navigator.push(
                    //     context,MaterialPageRoute(builder: (context) => ReservaMapaPage(establecimientos: vetLocales))
                    //   ),
                    // ),
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

  _listarChip(List<dynamic> chips){
    return ListView.builder(
      shrinkWrap: true,
      scrollDirection: Axis.horizontal,
      itemCount: chips.length,
      itemBuilder: (BuildContext context, int index) => _chip(chips[index]),
    );
  }

  _chip(dynamic servicio){
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 5.0),
      child: Chip(
        labelStyle: TextStyle(fontSize: 10.0, color: Colors.black54),
        labelPadding: EdgeInsets.only(left: 5.0,right: 2.5),
        // padding: EdgeInsets.zero,
        avatar: CircleAvatar(
          radius: 12.5,
          backgroundColor: colorBlue, //Colors.grey.shade800,
          child: Icon(iconMap[servicio['icon']], size: 12.0,),
        ),
        label: Text(servicio['name']),
      ),
    );  
  }
}
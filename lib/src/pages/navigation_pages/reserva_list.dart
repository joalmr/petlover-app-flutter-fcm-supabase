import 'package:flutter/material.dart';
import 'package:proypet/src/model/establecimiento/establecimiento_model.dart';
import 'package:proypet/src/pages/reserva/buildVets/buildVet.dart';
import 'package:proypet/src/pages/reserva/reserva_mapa_page.dart';
import 'package:proypet/src/pages/shared/appbar_menu.dart';
import 'package:proypet/src/pages/shared/enddrawer/filtros_mapa.dart';
import 'package:proypet/src/pages/shared/icons_map.dart';
import 'package:proypet/src/pages/shared/styles/styles.dart';
import 'package:proypet/src/providers/establecimiento_provider.dart';

class ReservaList extends StatefulWidget {
  @override
  _ReservaListState createState() => _ReservaListState();
}

class _ReservaListState extends State<ReservaList> {

  final GlobalKey<ScaffoldState> _key = GlobalKey<ScaffoldState>();
  EstablecimientoProvider vetProvider = EstablecimientoProvider();
  List<int> listaFiltros=[];
  // final _prefs = new PreferenciasUsuario();
  // String val="";

  @override
  Widget build(BuildContext context) {
    final dynamic filtrosData = ModalRoute.of(context).settings.arguments;
    
    if(filtrosData!=null){
      print(filtrosData["filtros"]);
      listaFiltros=filtrosData["filtros"];
    }
    

    return FutureBuilder(
      future: vetProvider.getVets(listaFiltros),
      builder: (BuildContext context, AsyncSnapshot<List<EstablecimientoModel>> snapshot){
        if(!snapshot.hasData)
          return Center(child: CircularProgressIndicator());
        else{
          return Scaffold(
            key: _key,            
            endDrawer: FiltrosMapa(filtros: listaFiltros,),//listaFiltros
            body: _onTab(snapshot.data),
            appBar: appbar(leadingH,'Establecimientos',
              <Widget>[
                // IconButton(
                //   icon: Icon(Icons.search),
                //   onPressed: (){
                //     showSearch(context: context, delegate: null);
                //   },
                // ),
                IconButton(
                  icon: Icon(Icons.filter_list),
                  onPressed: ()=>_key.currentState.openEndDrawer(),
                ),
              ]
            ),
            floatingActionButton: FloatingActionButton(
              onPressed: (snapshot.data.length==0) 
                ? null
                : ()=>Navigator.push(context,MaterialPageRoute(builder: (context) => ReservaMapaPage(establecimientos: snapshot.data))),
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
            SliverToBoxAdapter(
              child: FlatButton(onPressed: ()=>_key.currentState.openEndDrawer(), child: Text('Filtros', style: TextStyle(color: colorMain, fontWeight: FontWeight.bold),)),
            ),
            _listarChip(listaFiltros),
            SliverList(
              delegate: SliverChildBuilderDelegate(
                (BuildContext context, int index){
                  return buildVets(context,index, vetLocales);
                },
                childCount: vetLocales.length,
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

  _listarChip(dynamic chips){
    if(chips!=null){
      return SliverToBoxAdapter(
        child: SizedBox(
          height: 35.0,
          child: SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            padding: EdgeInsets.symmetric(horizontal: 20.0),
            child: ListView.builder(
              shrinkWrap: true,
              scrollDirection: Axis.horizontal,
              itemCount: chips.length,              
              itemBuilder: (BuildContext context, int index) => _chip(chips[index]),
            ),
          ),
        ),
      );
    }
    else{
      return SliverToBoxAdapter(
        child: SizedBox(
          height: 0.0,
        ),
      );
    }    
  }

  _chip(int servicio){
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 5.0,),
      child: Chip(
        labelStyle: TextStyle(fontSize: 10.0, color: Colors.black54),
        labelPadding: EdgeInsets.only(left: 5.0,right: 2.5),
        // padding: EdgeInsets.zero,
        avatar: CircleAvatar(
          radius: 12.5,
          backgroundColor: colorMain,//colorBlue, //Colors.grey.shade800,
          child: Icon(iconNum[servicio], size: 12.0,),
        ),
        label: Text(textMap[servicio]),
      ),
    );  
  }
}
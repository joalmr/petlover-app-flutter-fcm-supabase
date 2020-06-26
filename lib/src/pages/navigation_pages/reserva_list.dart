import 'package:flutter/material.dart';
import 'package:proypet/src/model/establecimiento/establecimiento_model.dart';
import 'package:proypet/src/pages/reserva/buildVets/buildVet.dart';
import 'package:proypet/src/pages/reserva/vet_mapa_page.dart';
import 'package:proypet/src/providers/establecimiento_provider.dart';
import 'package:proypet/src/shared/appbar_menu.dart';
import 'package:proypet/src/shared/enddrawer/filtros_mapa.dart';
import 'package:proypet/src/styles/styles.dart';
import 'package:proypet/src/utils/error_internet.dart';
import 'package:proypet/src/utils/icons_map.dart';
import 'package:proypet/src/utils/posicion.dart';


class ReservaList extends StatefulWidget {
  @override
  _ReservaListState createState() => _ReservaListState();
}

class _ReservaListState extends State<ReservaList> {

  final GlobalKey<ScaffoldState> _key = GlobalKey<ScaffoldState>();
  var refreshKey = GlobalKey<RefreshIndicatorState>();
  EstablecimientoProvider vetProvider = EstablecimientoProvider();
  // final _prefs = new PreferenciasUsuario();
  List<int> listaFiltros=[];
  var stream;
  
  Future<List<EstablecimientoModel>> newFuture() => vetProvider.getVets(listaFiltros);//, _prefs.position

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
    _onRefresh();
    super.initState();    
  }

  @override
  void dispose() {
    fnGetPosition();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final dynamic filtrosData = ModalRoute.of(context).settings.arguments;
    
    if(filtrosData!=null){
      listaFiltros=filtrosData["filtros"];
    }  

    return FutureBuilder(
      future: stream,
      builder: (BuildContext context, AsyncSnapshot<List<EstablecimientoModel>> snapshot){
        if(snapshot.connectionState != ConnectionState.done)
          return Scaffold(
            appBar: appbar(leadingH,'Buscar veterinarias',
              null
            ),
            body: LinearProgressIndicator(),
          );
        else{
          if(snapshot.hasError){
            return errorInternet();
          }
          
          return Scaffold(
            key: _key,            
            endDrawer: FiltrosMapa(filtros: listaFiltros,),//listaFiltros
            appBar: appbar(leadingH,'Buscar veterinarias',
              <Widget>[
                IconButton(
                  icon: Icon(Icons.filter_list),
                  onPressed: ()=>_key.currentState.openEndDrawer(),
                ),
              ]
            ),
            body: _onTab(snapshot.data),
            floatingActionButton: FloatingActionButton(
              onPressed: (snapshot.data.length==0) 
                ? null
                : ()=>Navigator.push(context,MaterialPageRoute(builder: (context) => VetMapaPage(establecimientos: snapshot.data))),
              child: Icon(Icons.location_on),
              // backgroundColor: Theme.of(context).primaryColor,
            ),
            floatingActionButtonLocation: FloatingActionButtonLocation.endFloat
          );
        }    
      }
    );
  }



  _onTab(List<EstablecimientoModel> vetLocales) {
    return Stack(
      children: <Widget>[
        RefreshIndicator(
          key: refreshKey,
          onRefresh: _onRefresh,
          child: CustomScrollView(
            slivers: <Widget>[
              _listarChip(listaFiltros),
              (vetLocales.length<1)?
              SliverToBoxAdapter(
                child: SizedBox(height: 50.0,
                  child: Center(
                    child: Padding(
                      padding: const EdgeInsets.symmetric(vertical: 10.0),
                      child: Text("No se encontró veterinarias"),
                    ),
                  ),
                ),
              )
              :
              SliverList(
                delegate: SliverChildBuilderDelegate(
                  (BuildContext context, int index){                  
                    return buildVets(context, vetLocales[index]);               
                  },
                  childCount: vetLocales.length,
                ),
              ),
              SliverToBoxAdapter(
                child: SizedBox(height: 50.0),
              ),
            ],
          ),
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
        labelStyle: TextStyle(fontSize: sizeLite, color: Colors.black54),
        labelPadding: EdgeInsets.only(left: 5.0,right: 2.5),
        // padding: EdgeInsets.zero,
        avatar: CircleAvatar(
          radius: 12.5,
          backgroundColor: colorMain,//colorBlue, //Colors.grey.shade800,
          child: Icon(iconNum[servicio], size: sizeSmall, color: Colors.white),
        ),
        label: Text(textMap[servicio], style: TextStyle(color: Theme.of(context).textTheme.subtitle2.color)),
      ),
    );  
  }
}
import 'dart:async';
import 'package:animate_do/animate_do.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_swiper/flutter_swiper.dart';
import 'package:proypet/src/model/booking/booking_home.dart';
import 'package:proypet/src/model/home_model.dart';
import 'package:proypet/src/model/home_model.dart' as hoModel ;
import 'package:proypet/src/model/mascota/mascota_model.dart';
import 'package:proypet/src/providers/booking_provider.dart';
import 'package:proypet/src/providers/user_provider.dart';
import 'package:proypet/src/shared/enddrawer/config_drawer.dart';
import 'package:proypet/src/shared/form_control/button_primary.dart';
import 'package:proypet/src/shared/navigation_bar.dart';
import 'package:proypet/src/shared/snackbar.dart';
import 'package:proypet/src/styles/styles.dart';
import 'package:proypet/src/utils/calcula_edad.dart';
import 'package:proypet/src/utils/error_internet.dart';
import 'package:proypet/src/utils/posicion.dart';


class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey<ScaffoldState>();
  final loginProvider = UserProvider();
  final bookingProvider = BookingProvider();
  var refreshKey = GlobalKey<RefreshIndicatorState>();
  var stream;

  Future<HomeModel> newFuture() => loginProvider.getUserSummary();

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
    fnGetPosition();
    _onRefresh();  
    
    super.initState();    
  }


  @override
  Widget build(BuildContext context) {    
    return Scaffold(
      key: _scaffoldKey,
      endDrawer: ConfigDrawer(),
      body: inUser()
    );
  }
  
  Widget inUser(){
    return RefreshIndicator(
      key: refreshKey,
      onRefresh: _onRefresh,
      child: FutureBuilder(
        future: stream,
        builder: (BuildContext context, AsyncSnapshot<HomeModel> snapshot){
          final mydata=snapshot.data;
          if(snapshot.connectionState != ConnectionState.done){
            return LinearProgressIndicator(
              backgroundColor: Colors.grey[200],
            );
          }
          else{ 
            if(snapshot.hasError){
              return errorInternet();
            }           
            return ListView(
              padding: EdgeInsets.symmetric(horizontal: 20.0),
              children: <Widget>[
                SizedBox(height: 35.0,),
                FadeIn(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      Text(
                        "Hola,",
                        style: Theme.of(context).textTheme.headline4
                            .copyWith(fontWeight: FontWeight.normal),
                      ),
                      IconButton(
                        icon: Icon(Icons.settings, color: Colors.black54,),
                        onPressed: ()=>_scaffoldKey.currentState.openEndDrawer()
                      )
                    ],
                  ),
                ),
                FadeIn(child: _usuario(mydata.user)),
                SizedBox(height: 25.0,),
                FadeIn(child: _mascotas(mydata.pets)),
                FadeIn(
                  child: Container(
                    margin: EdgeInsets.symmetric(vertical: 25.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: <Widget>[
                        Text(' Servicios frecuentes', style: 
                          Theme.of(context).textTheme.headline6.apply(fontWeightDelta: 2,),
                        ),
                        SizedBox(height: 15.0),
                        SingleChildScrollView(
                          physics: BouncingScrollPhysics(),
                          scrollDirection: Axis.horizontal,
                          child: Row(
                            children: <Widget>[
                              _emergencia(),
                              SizedBox(width: 15.0),
                              _banio(),                              
                              SizedBox(width: 15.0),
                              _vacuna(),
                              SizedBox(width: 15.0),
                              _desparasita(),                              
                              SizedBox(width: 15.0),
                              _consulta(),
                            ],
                          ),
                        )
                      ],
                    ),
                  ),
                ),
                SizedBox(height: 10.0),
                FadeIn(
                  child: Row(
                    children: <Widget>[
                      Expanded(
                        child: Text("Reservas", style: 
                          Theme.of(context).textTheme.headline6.apply(fontWeightDelta: 2,),
                        ),
                      ),
                      Icon(Icons.timelapse, color: Colors.black54),
                    ],
                  ),
                ),
                FadeIn(child: _atenciones(mydata.bookings,mydata.pets)),
              ],
            );
          }
        },
      ),
    )
    ;
  }

  Widget _usuario(hoModel.UserHome usuario){
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: <Widget>[
        Text(
          usuario.name,
          style: Theme.of(context)
              .textTheme.headline4.apply(fontWeightDelta: 2)
        ),
      ],
    );
  }

  Widget _mascotas(List<MascotaModel> mascotas){
    if(mascotas.length>0)
      return Container(
        height: 250.0,
        width: double.infinity,
        child: Stack(
          children: <Widget>[
            Swiper(
              physics: BouncingScrollPhysics(),
              itemCount: mascotas.length,//mascotaList.length,
              itemBuilder: (BuildContext context, int index){
                return ClipRRect(
                  borderRadius: BorderRadius.circular(15.0),
                  child: Stack(
                    children: <Widget>[
                      Container(
                        height: 250.0,
                        width: double.infinity,
                        foregroundDecoration: BoxDecoration(
                          color: Colors.black.withOpacity(0.15),
                        ),
                        child: Image(
                          image: mascotas[index].picture == 'http://ce2019121721001.dnssw.net/storage/'
                            ? AssetImage('images/proypet.png')
                            : CachedNetworkImageProvider(mascotas[index].picture),
                          fit: BoxFit.cover,
                        ),
                      ),

                      Positioned(
                        top: 15.0,
                        left: 10.0,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: <Widget>[
                            Text(
                              mascotas[index].name,
                              style: Theme.of(context)
                                .textTheme.headline6
                                .apply(color: Colors.white, fontWeightDelta: 2)
                            ),
                            Text(
                              mascotas[index].breedName,
                              style: Theme.of(context)
                                .textTheme.subtitle2
                                .apply(color: Colors.white)
                            ),
                          ],
                        ),
                      ),

                      Positioned(
                        bottom: 10.0,
                        left: 10.0,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: <Widget>[
                            RichText(
                              text: TextSpan(
                                children: [
                                  TextSpan(
                                    text: mascotas[index].weight.toString(),
                                    style: 
                                    Theme.of(context)
                                      .textTheme.headline4
                                      .apply(color: Colors.white, fontWeightDelta: 2),
                                  ),
                                  TextSpan(text: " kg.")
                                ],
                              ),
                            ),
                            Row(
                              children: <Widget>[
                                (mascotas[index].status==0) 
                                  ? Icon(Icons.bookmark, color: colorGray2) 
                                  : Icon(Icons.cake, color: colorGray2),
                                SizedBox(width: 5.0),
                                (mascotas[index].status==0) 
                                ? Text("Fallecido",
                                  style: TextStyle(color: colorGray2,),
                                )
                                : Text(
                                  calculateAge(DateTime.parse(mascotas[index].birthdate)),
                                  style: Theme.of(context).textTheme.subtitle2.apply(color: colorGray2),
                                )
                              ],
                            ),
                          ],
                        ),
                      ),

                      Positioned(
                        bottom: 10.0,
                        right: 10.0,
                        child: RaisedButton(
                          padding: EdgeInsets.symmetric(horizontal: 15.0, vertical: 11.0),
                          color: Colors.black.withOpacity(0.15),
                          onPressed: ()=>Navigator.pushNamed(context, 'detallemascota', arguments: mascotas[index].id),
                          child: Text('Ver más',style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold),),
                          shape: RoundedRectangleBorder(
                            borderRadius: new BorderRadius.circular(9.0),
                            side: BorderSide(color: Colors.white)),
                        ),
                      ),
                    ],

                  ),
                );
              },
              viewportFraction: 0.79,
              scale: 0.77,
              loop: false,
            ),
            Positioned(
              top: 0.0,
              right: 0.0,
              child: FloatingActionButton(                
                onPressed: ()=>Navigator.pushNamed(context, 'agregarmascota'),
                child: Icon(Icons.playlist_add),
                // backgroundColor: Theme.of(context).primaryColor,
              ),
            ),
          ],
        ),
      );
    else
      return Container(
        height: 250.0,
        width: double.infinity,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text('Se parte de la comunidad responsable',
              textAlign: TextAlign.center,
            ),
            SizedBox(height: 10.0,),
            buttonPri('Agregar mascota', ()=>Navigator.pushNamed(context, 'agregarmascota'),),
          ],
        ),
      );
  }

  Widget _atenciones(List<BookingHome> atenciones, List<MascotaModel> pets){
    int petLength = pets.length;
    if(atenciones.length>0)
      return ListView.builder(
        padding: EdgeInsets.only(top: 5.0),
        physics: NeverScrollableScrollPhysics(),
        shrinkWrap: true,
        itemCount: atenciones.length,
        itemBuilder: (BuildContext context, int index) {
          DateTime now = DateTime.now();
          var fechaAt = atenciones[index].date.split('-');
          bool vencido=false;
          if( int.parse(fechaAt[0])<now.day && int.parse(fechaAt[1])==now.month && int.parse(fechaAt[2])==now.year){
            vencido=true;
          }

          var dismissible = Dismissible(
            key: UniqueKey(),
            background: Container(
              color: colorRed,
            ),
            direction: DismissDirection.endToStart,
            confirmDismiss: (fn)=>showDialog(
              context: context,
              builder: (BuildContext context){
                return FadeIn(
                  child: AlertDialog(
                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10.0)),
                    title: Text('Eliminar'),
                    content: Text('Seguro que desea eliminar esta reserva?'),
                    actions: <Widget>[
                      FlatButton(
                        onPressed: ()=>Navigator.pop(context),
                        child: Text('Cancelar')
                      ),
                      FlatButton(
                        onPressed: ()=>_deleteBooking(atenciones[index].id),
                        child: Text('Sí, eliminar')
                      )
                    ],
                  ),
                );
              }
            ),
            child: FlatButton(
              onPressed: ()=> Navigator.pushNamed(context, 'detallereservado', arguments: atenciones[index]),
              child: Column(
                children: <Widget>[
                  ListTile(
                    leading: CircleAvatar(
                      backgroundColor: colorMain,
                      backgroundImage: CachedNetworkImageProvider(atenciones[index].petPicture),
                      radius: 25.0,
                    ),
                    title: Text(atenciones[index].establishmentName), //(!vencido) ? 
                      // : Text(atenciones[index].establishmentName, style: TextStyle(color: colorRed),),
                    subtitle: Text((!vencido) 
                      ? atenciones[index].status
                      : '${atenciones[index].status} - Vencido', 
                      style: (!vencido) ? (atenciones[index].statusId==3 || atenciones[index].statusId==6) 
                        ? TextStyle(fontWeight: FontWeight.bold, color: colorMain ) 
                        : TextStyle(fontWeight: FontWeight.bold) 
                      : TextStyle(fontWeight: FontWeight.bold, color: colorRed) , //vencido
                    ),
                    trailing: Column(
                      children: <Widget>[
                        Text(
                          atenciones[index].date,//" Mañana",
                          style: 
                          Theme.of(context).textTheme.subtitle2.copyWith(fontSize: 12.0).apply(fontWeightDelta: 2)
                        ),
                        Text(
                          atenciones[index].time,//"17:00",
                          style: 
                          Theme.of(context).textTheme.subtitle2.apply(fontWeightDelta: 2, color: colorMain),
                          // TextStyle(color: colorMain,fontSize: sizeH4,fontWeight: FontWeight.w600),
                          textAlign: TextAlign.center,
                        ),
                      ],
                    ),
                    contentPadding: EdgeInsets.symmetric(horizontal: 0,vertical: 0),
                  ),
                  Divider(),
                ],
              ),
            ),
          );
          return dismissible;
        },
      );
    else
      if(petLength>0)
        return Container(
          padding: EdgeInsets.symmetric(vertical: 30.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Text('Haz una reserva en la veterinaria de tu agrado',
                textAlign: TextAlign.center,
              ),
              SizedBox(height: 10.0,),
              buttonPri('Reservar', ()=>Navigator.push(context, MaterialPageRoute(
                    builder: (_)=>NavigationBar(currentTabIndex: 2),
                  )),)
            ],
          ),
        );
      else
        return Container(
        padding: EdgeInsets.symmetric(vertical: 30.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text('Vamos, agrega a tu mascota y se parte de la comunidad responsable',
              textAlign: TextAlign.center,
            ),
            SizedBox(height: 10.0,),
            buttonPri('Agregar mascota', ()=>Navigator.pushNamed(context, 'agregarmascota'),),
          ],
        ),
      );
  }

  _deleteBooking(String id) async {
    bool resp = await bookingProvider.deleteBooking(id);
    Navigator.pop(context);
    if(resp){
      mostrarSnackbar("Atención eliminada", colorMain, _scaffoldKey);
      Navigator.of(context).pushNamedAndRemoveUntil('/nav', ModalRoute.withName('/nav')); //
    }
    else{
      mostrarSnackbar("No se eliminó la atención", colorRed, _scaffoldKey);
    }
  }

  _emergencia(){
    return InkWell(
      borderRadius: BorderRadius.circular(15.0),
      onTap: ()=>Navigator.pushNamed(context, 'navLista', arguments:{ "filtros":[8] } ),
      child: Stack(
        children: <Widget>[
          Container(
            width: 120.0,
            height: 100.0,
            padding: EdgeInsets.all(15.0),
            foregroundDecoration: BoxDecoration(
              color: Colors.red.withOpacity(0.5),
              borderRadius: BorderRadius.circular(15.0),
            ),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(15.0),
              image: DecorationImage(
                fit: BoxFit.cover,
                image: AssetImage('images/fre-emergencia.jpg'),
              )
            ),
          ),
          Container(
            width: 120.0,
            height: 100.0,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  Text('Emergencia',style: TextStyle(color: Colors.white)),
                  Text('24 horas',style: TextStyle(color: Colors.white, fontSize: sizeCuerpoLite)),
                ],
              ),
          )
        ],
      ),
    );
  }

  _consulta(){
    return InkWell(
      borderRadius: BorderRadius.circular(15.0),
      onTap: ()=>Navigator.pushNamed(context, 'navLista', arguments:{ "filtros":[2] } ),
      child: Stack(
        children: <Widget>[
          Container(
            width: 120.0,
            height: 100.0,
            padding: EdgeInsets.all(15.0),
            foregroundDecoration: BoxDecoration(
              color: Colors.black.withOpacity(0.25),
              borderRadius: BorderRadius.circular(15.0),
            ),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(15.0),
              image: DecorationImage(
                fit: BoxFit.cover,
                image: AssetImage('images/fre-consulta.jpg'),
              )
            ),
          ),
          Container(
            width: 120.0,
            height: 100.0,
            child: Center(
              child: Text('Consulta',style: TextStyle(color: Colors.white)),
            ),
          )
        ],
      ),
    );
  }

  _vacuna(){
    return InkWell(
      borderRadius: BorderRadius.circular(15.0),
      onTap: ()=>Navigator.pushNamed(context, 'navLista', arguments:{ "filtros":[4] } ),
      child: Stack(
        children: <Widget>[
          Container(
            width: 120.0,
            height: 100.0,
            padding: EdgeInsets.all(15.0),
            foregroundDecoration: BoxDecoration(
              color: Colors.black.withOpacity(0.25),
              borderRadius: BorderRadius.circular(15.0),
            ),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(15.0),
              image: DecorationImage(
                fit: BoxFit.cover,
                image: AssetImage('images/fre-vacuna.jpeg'),
              )
            ),
          ),
          Container(
            width: 120.0,
            height: 100.0,
            child: Center(
              child: Text('Vacuna',style: TextStyle(color: Colors.white)),
            ),
          )
        ],
      ),
    );
  }

  _banio(){
    return InkWell(
      borderRadius: BorderRadius.circular(15.0),
      onTap: ()=>Navigator.pushNamed(context, 'navLista', arguments:{ "filtros":[1] } ),
      child: Stack(
        children: <Widget>[
          Container(
            width: 120.0,
            height: 100.0,
            padding: EdgeInsets.all(15.0),
            foregroundDecoration: BoxDecoration(
              color: Colors.black.withOpacity(0.25),
              borderRadius: BorderRadius.circular(15.0),
            ),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(15.0),
              image: DecorationImage(
                fit: BoxFit.cover,
                image: AssetImage('images/fre-banio.jpg'),
              )
            ),
          ),
          Container(
            width: 120.0,
            height: 100.0,
            child: Center(
              child: Text('Baño',style: TextStyle(color: Colors.white)),
            ),
          )
        ],
      ),
    );
  }

  _desparasita(){
    return InkWell(
      borderRadius: BorderRadius.circular(15.0),
      onTap: ()=>Navigator.pushNamed(context, 'navLista', arguments:{ "filtros":[11] } ),
      child: Stack(
        children: <Widget>[
          Container(
            width: 120.0,
            height: 100.0,
            padding: EdgeInsets.all(15.0),
            foregroundDecoration: BoxDecoration(
              color: Colors.black.withOpacity(0.25),
              borderRadius: BorderRadius.circular(15.0),
            ),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(15.0),
              image: DecorationImage(
                fit: BoxFit.cover,
                image: AssetImage('images/fre-desparacita.jpg'),
              )
            ),
          ),
          Container(
            width: 120.0,
            height: 100.0,
            child: Center(
              child: Text('Desparasitación',style: TextStyle(color: Colors.white)),
            ),
          )
        ],
      ),
    );
  }
}

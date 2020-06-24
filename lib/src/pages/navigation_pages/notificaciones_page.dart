import 'dart:async';
import 'package:animate_do/animate_do.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_swiper/flutter_swiper.dart';
import 'package:proypet/src/model/notificacion/notificacion_model.dart';
import 'package:proypet/src/pages/notificaciones/buildNoti.dart';
import 'package:proypet/src/pages/notificaciones/buildTip.dart';
import 'package:proypet/src/pages/reserva/vet_detalle_page.dart';
import 'package:proypet/src/providers/establecimiento_provider.dart';
import 'package:proypet/src/providers/notificacion_provider.dart';
import 'package:proypet/src/shared/appbar_menu.dart';
import 'package:proypet/src/utils/error_internet.dart';
import 'package:proypet/src/utils/icons_map.dart';


final List imagen = ['images/elegante1.jpg','images/royal1.jpg'];
final List imagen2 = ['images/royal1.jpg','images/elegante1.jpg'];
class NotificacionesPage extends StatefulWidget {

  @override
  _NotificacionesPageState createState() => _NotificacionesPageState();
}

class _NotificacionesPageState extends State<NotificacionesPage> {
  NotificacionProvider notificacionProvider = NotificacionProvider();
  var refreshKey = GlobalKey<RefreshIndicatorState>();
  var stream;

  Future<NotificacionModel> newFuture() => notificacionProvider.getNotificacion();

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
      appBar: appbar(leadingH,'Notificaciones',null),
      body: Container(
        child: RefreshIndicator(
          onRefresh: _onRefresh,
          child: ListView(
            children: <Widget>[
              _onFuture(),
            ],
          ),
        ),
      ),
    );
  }

  _onFuture(){
    return FutureBuilder(
      future: stream,//notificacionProvider.getNotificacion(),
      builder: (BuildContext context, AsyncSnapshot<NotificacionModel> snapshot) {
        if(snapshot.connectionState != ConnectionState.done){
          return LinearProgressIndicator();
        }
        else{
          if(snapshot.hasError){
            return errorInternet();
          } 

          List<Notificacion> notification = snapshot.data.notifications;
          if(notification.length<1){
            return Center(
              child: Padding(
                padding: const EdgeInsets.symmetric(vertical: 10.0),
                child: Text("No tiene notificaciones"),
              ),
            );
          }
          else{
            return 
            Column(
              children: <Widget>[
                Container(
                  height: 280,
                  child: Swiper(
                    itemCount: notification.length,
                    itemBuilder: (BuildContext context, int index) {
                      return buildNoti(notification[index]);
                    },
                    viewportFraction: 1,
                    // scale: 0.8,
                    loop: false,
                    physics: BouncingScrollPhysics(),
                    
                  ),
                ),
                Container(
                  height: 260,
                  child: Swiper(
                    itemCount: 2,
                    itemBuilder: (BuildContext context, int index) {
                      return buildTip(context);
                    },
                    viewportFraction: 1,
                    // scale: 0.8,
                    loop: false,
                    physics: BouncingScrollPhysics(),
                  ),
                ),
              ],
            );
          }
        }
      },
    );
  }

  _notificacionCase(Notificacion notificacion){
    switch(notificacion.type) {
      case "ComingBooking":
        return _comingBooking(notificacion);
        break;
      case "NextDate":
        return _nextDate(notificacion);
        break;
      case "Recordatory":
        return _recordatory(notificacion);
        break;
      default:
        return SizedBox(height: 0.0,);
        break;
    }
  }

  //reserva cercana
  _comingBooking(notificacion){
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20.0),
      child: Column(
        children: <Widget>[
          ListTile(
            contentPadding: EdgeInsets.symmetric(vertical: 5.0, horizontal: 0.0), //horizontal: 20.0
            leading: CircleAvatar(radius: 25.0 ,backgroundImage: CachedNetworkImageProvider(notificacion.petPicture),),
            title: Text(notificacion.message,
              style: Theme.of(context).textTheme.subtitle2,
              maxLines: 3,
            ),
            
          ),
          Divider(),
        ],
      ),
    );
  }

  //proxima cita
  _nextDate(notificacion){
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20.0),
      child: Column(
        children: <Widget>[
          ListTile(
            contentPadding: EdgeInsets.symmetric(vertical: 5.0, horizontal: 0.0),
            leading: CircleAvatar(radius: 25.0 ,backgroundImage: CachedNetworkImageProvider(notificacion.petPicture),),
            title: Text(notificacion.message,
              style: Theme.of(context).textTheme.subtitle2,
              maxLines: 3,
            ),
            
            onTap: ()=>_fnEstablecimiento(notificacion.options["establishment_id"]),
          ),
          Divider(),
        ],
      ),
    );
  }

  //vacuna, desparasitacion
  _recordatory(notificacion){
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20.0),
      child: Column(
        children: <Widget>[
          ListTile(
            contentPadding: EdgeInsets.symmetric(vertical: 5.0, horizontal: 0.0),
            leading: CircleAvatar(radius: 25.0 ,backgroundImage: CachedNetworkImageProvider(notificacion.petPicture),),
            title: Text(notificacion.message,
              style: Theme.of(context).textTheme.subtitle2,
              maxLines: 3,
            ),
            onTap: ()=>_fnRecordatorio(notificacion.options["slug"]),
          ),
          Divider(),
        ],
      ),
    );
  }

  _fnEstablecimiento(id) async {
    final establecimientoProvider = EstablecimientoProvider();
    Map veterinaria = await establecimientoProvider.getVet(id);
    if(veterinaria['status']==200){
      Navigator.push(
        context,MaterialPageRoute(
          builder: (context) => VetDetallePage(vet: veterinaria['establishment']),
      ));
    }
    else{
      showDialog(
        context: context,
        builder: (BuildContext context){
          return FadeIn(
            child: SimpleDialog(
              contentPadding: EdgeInsets.all(20.0),
              // shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10.0)),
              children: <Widget>[
                SizedBox(height: 10.0),
                  Text('Lo sentimos, esta veterinaria ya no forma parte de proypet'),
                  Center(
                    child: Image(
                      height: 200,      
                      width: 200, 
                      image: AssetImage("images/gato-error.png")
                    ),
                  ),
              ],
              
            ),
          );
        }
      );
    }
  }

  _fnRecordatorio(String slug){
    Navigator.pushNamed(context, 'navLista', arguments:{ "filtros": [ slugNum[slug] ] } );
  }

}


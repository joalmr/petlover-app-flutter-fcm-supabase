import 'package:animate_do/animate_do.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:map_launcher/map_launcher.dart';
import 'package:proypet/src/model/booking/booking_home.dart';
import 'package:proypet/src/shared/appbar_menu.dart';
import 'package:proypet/src/shared/form_control/button_primary.dart';
import 'package:proypet/src/shared/snackbar.dart';
import 'package:proypet/src/providers/booking_provider.dart';
import 'package:proypet/src/utils/styles/styles.dart';
import 'package:url_launcher/url_launcher.dart';

class DetalleReservado extends StatelessWidget {
  final GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey<ScaffoldState>();
  final bookingProvider = BookingProvider();

  @override
  Widget build(BuildContext context) {
    
    final BookingHome arg = ModalRoute.of(context).settings.arguments;
    
    return Scaffold(
      key: _scaffoldKey,
      appBar: appbar(null,'Detalle de reserva',null),
      body: Stack(
        children: <Widget>[
          Container(
            height: MediaQuery.of(context).size.height,
          ),
          Container(
            child: Image(
              image: CachedNetworkImageProvider(arg.petPicture),
              height: 320,
              width: double.infinity,
              fit: BoxFit.cover,
            ),
          ),
          Container(
            margin: EdgeInsets.only(top: 280.0,left: 5.0,right: 5.0),
            decoration: BoxDecoration(
              borderRadius: borderRadius,
              color: Colors.white,                            
            ),
            child: _listaDatos(arg,context),
          )
        ],

      ),
    );
  }

  _listaDatos(arg, context){
    return SingleChildScrollView(
      physics: BouncingScrollPhysics(),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.start,
        children: <Widget>[
          Container(
            padding: EdgeInsets.symmetric(horizontal: 20.0, vertical: 10.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.start,
              children: <Widget>[
                Text(arg.petName, style: TextStyle(fontSize: sizeH1, fontWeight: FontWeight.bold),),
                SizedBox(height: 20.0,),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Text("Estado de la reserva", style: TextStyle(fontSize: sizeH4, fontWeight: FontWeight.bold, color: Colors.black54),),
                        Text(arg.status, style: (arg.statusId==3 || arg.statusId==6) 
                          ? TextStyle(fontSize: sizeH3, fontWeight: FontWeight.bold, color: colorMain ) 
                          : TextStyle(fontSize: sizeH3, fontWeight: FontWeight.bold) ,),  
                      ],
                    ),
                    Padding(
                      padding: const EdgeInsets.only(right: 15.0),
                      child: FloatingActionButton(
                        mini: true,
                        backgroundColor: colorMain,
                        child: Icon(Icons.phone, color: Colors.white,),
                        onPressed: ()=>_launchPhone('993926739'), 
                      ),
                    )
                  ],
                ),
                SizedBox(height: 10.0,),
                Text("Veterinaria", style: TextStyle(fontSize: sizeH4, fontWeight: FontWeight.bold, color: Colors.black54),),
                Text(arg.establishmentName, style: TextStyle(fontSize: sizeH3),),
                SizedBox(height: 10.0,),
                Text("Dirección", style: TextStyle(fontSize: sizeH4, fontWeight: FontWeight.bold, color: Colors.black54),),
                Text(arg.address),
                SizedBox(height: 10.0,),
                Text("Fecha y hora", style: TextStyle(fontSize: sizeH4, fontWeight: FontWeight.bold, color: Colors.black54),),
                Text('${arg.date} ${arg.time}'),

                SizedBox(height: 20.0,),
                Center(
                  child: buttonPri("Ver en mapa", ()=>_openMapsSheet(context, arg.establishmentName, arg.address, arg.establishmentLat, arg.establishmentLng) )
                ),
                SizedBox(height: 35.0,),
                Center(
                  child: OutlineButton(
                    onPressed: ()=>_alertaEliminar(arg.id,context),
                    child: Text("Eliminar reserva",style: TextStyle(
                      fontSize: sizeH4,
                      fontWeight: FontWeight.w700
                    ),),
                    shape: shapeB,
                    color: colorRed,
                    textColor: colorRed,
                    highlightedBorderColor: colorRed,
                    padding: EdgeInsets.symmetric(vertical: 16.0,horizontal: 10.0),
                  )
                ),
                SizedBox(height: 10.0,),
              ],
            ),
          )
          
        ],
      ),
    );
  }
  _alertaEliminar(id, context){
    return showDialog(
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
                onPressed: ()=>_deleteBooking(id,context),
                child: Text('Sí, eliminar')
              )
            ],
          ),
        );
      }
    );
  }

  _deleteBooking(String id,context) async {
    bool resp = await bookingProvider.deleteBooking(id);
    Navigator.pop(context);
    if(resp){
      Navigator.of(context).pushNamedAndRemoveUntil('/nav', ModalRoute.withName('/nav')); //
    }
    else{
      mostrarSnackbar("No se eliminó la atención", colorRed, _scaffoldKey);
    }
  }

  _launchPhone(String phone) async {
    var url = 'tel:$phone';
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      throw 'No se pudo llamar $url';
    }
  }

  _openMapsSheet(context, vet, direccion, lat, lng) async {
    try {
      final title = vet;
      final description = direccion;
      final coords = Coords(lat,lng);
      final availableMaps = await MapLauncher.installedMaps;

      showModalBottomSheet(
        context: context,
        builder: (BuildContext context) {
          return SafeArea(
            child: SingleChildScrollView(
              child: Container(
                child: Wrap(
                  children: <Widget>[
                    for (var map in availableMaps)
                      ListTile(
                        onTap: () => map.showMarker(
                          coords: coords,
                          title: title,
                          description: description,
                        ),
                        title: Text(map.mapName),
                        leading: Image(
                          image: map.icon,
                          height: 30.0,
                          width: 30.0,
                        ),
                      ),
                  ],
                ),
              ),
            ),
          );
        },
      );
    } catch (e) {
      print(e);
    }
  }

}
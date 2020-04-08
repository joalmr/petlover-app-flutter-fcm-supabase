import 'package:flutter/material.dart';
import 'package:proypet/src/pages/reserva/reserva_detalle_page.dart';
import 'package:proypet/src/pages/shared/appbar_menu.dart';

final List imagen = ['images/elegante1.jpg','images/royal1.jpg'];
final List imagen2 = ['images/royal1.jpg','images/elegante1.jpg'];
class NotificacionesPage extends StatefulWidget {

  @override
  _NotificacionesPageState createState() => _NotificacionesPageState();
}

class _NotificacionesPageState extends State<NotificacionesPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appbar(leadingH,'Notificaciones',null),
      body: Container(
        // child: Center(
        //   child: Text('No cuenta con notificaciones'),
        // ),
        child: SingleChildScrollView(
          padding: EdgeInsets.symmetric(vertical: 20.0, horizontal: 5.0),
          child: Column(
            children: <Widget>[
              ListTile(
                leading: CircleAvatar(radius: 25.0 ,backgroundImage: AssetImage('images/greco.png'),),
                title: Text('Hola, tengo una próxima atención el 8 de abril en VetPrueba, no me descuides',
                  style: TextStyle(color: Colors.black54),),
              ),
              Divider(),
              ListTile(
                leading: CircleAvatar(radius: 25.0 ,backgroundImage: AssetImage('images/greco.png'),),
                title: Text('Alonso, VetPrueba nos recomendó una cita para el día 8 de abril, no olvides reservarla',
                  style: TextStyle(color: Colors.black54),),
                onTap: ()=>Navigator.push(
                  context,MaterialPageRoute(
                    builder: (context) => ReservaDetallePage(vetID: "123ce6d0-e0d4-466f-b64a-deaca88fab10",),
                )),
              ),
              Divider(),
              ListTile(
                leading: CircleAvatar(radius: 25.0 ,backgroundImage: AssetImage('images/greco.png'),),
                title: Text('Ay ya me toca desparasitación el 8 de abril, quiero estar limpio',
                  style: TextStyle(color: Colors.black54),),
                onTap: ()=>Navigator.pushNamed(context, 'navLista', arguments:{ "filtros":[11] } ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
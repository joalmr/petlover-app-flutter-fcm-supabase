import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:proypet/src/model/mascota/mascota_model.dart';
import 'package:proypet/src/providers/mascota_provider.dart';
import 'package:proypet/src/utils/styles/styles.dart';


class MascotaDrawer extends StatefulWidget {
  final MascotaModel modelMascota;
  MascotaDrawer({@required this.modelMascota});

  @override
  _MascotaDrawerState createState() => _MascotaDrawerState(mascota: modelMascota);
}

class _MascotaDrawerState extends State<MascotaDrawer> {
  MascotaModel mascota;
  _MascotaDrawerState({@required this.mascota});
  final Color primary = Colors.white;
  final Color active = Colors.grey.shade800;
  final Color divider = Colors.grey.shade600;
  final mascotaProvider = MascotaProvider();

  @override
  Widget build(BuildContext context) {
    return ClipPath(
      child: Drawer(
        child: Container(
          padding: const EdgeInsets.only(left: 16.0, right: 32.0),
          decoration: BoxDecoration(
              color: primary, boxShadow: [BoxShadow(color: Colors.black45)]),
          width: 300,
          child: SafeArea(
            child: SingleChildScrollView(
              child: dataList(),
            ),
          ),
        ),
      ),
    );
  }

  dataList(){
    return Column(
      children: <Widget>[                  
        SizedBox(height: 40.0,),
        Text(mascota.name,
          style: TextStyle(
            fontWeight: FontWeight.w400,
            fontSize: 24.0,
            letterSpacing: 3.0,
            color: Colors.black54,                      
          ),
        ),
        SizedBox(height: 20.0,),
        Divider(),        
        ListTile(
          leading: Icon(Icons.edit),
          title: Text('Editar datos', style: TextStyle(
            fontWeight: FontWeight.w400,
          ),),
          onTap: ()=>Navigator.pushNamed(context, 'agregarmascota', arguments: mascota),
        ),
        ListTile(
          leading: Icon(Icons.bookmark),
          title: Text('Fallecido', style: TextStyle(
            fontWeight: FontWeight.w400,
          ),),
          onTap: ()=>showDialog(
            context: context,
            builder: (BuildContext context){
              return (mascota.status!=0) ? _fallecido() : _errorFallecido() ;
            }
          ),
        ),
        ListTile(
          leading: Icon(Icons.delete_forever, color: colorRed,),
          title: Text('Eliminar mascota', style: TextStyle(
            color: colorRed,
            fontWeight: FontWeight.w400,
          ),),
          onTap: ()=>showDialog(
            context: context,
            builder: (BuildContext context){
              return FadeIn(
                child: AlertDialog(
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10.0)),
                  title: Text('Eliminar'),
                  content: Text('Seguro que desea eliminar a ${mascota.name}?'),
                  actions: <Widget>[
                    FlatButton(
                      onPressed: ()=>Navigator.pop(context), 
                      child: Text('Cancelar')
                    ),
                    FlatButton(
                      onPressed: () async {
                        bool resp = await mascotaProvider.deletePet(mascota.id);
                        if(resp){
                          Navigator.of(context).pushNamedAndRemoveUntil('/nav', ModalRoute.withName('/nav'));
                        }
                        else{
                          Navigator.pop(context);
                        }
                      },
                      child: Text('Sí, eliminar')
                    )
                  ],
                ),
              );
            }
          )
        )
      ],
    );
  }


/////////////////////////////////////////////////
  _fallecido(){
    return FadeIn(
      child: AlertDialog(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10.0)),
        title: Text('Fallecido'),
        content: Text('Lamentamos la perdida de tu ser querido.'),
        actions: <Widget>[
          FlatButton(
            onPressed: ()=>Navigator.pop(context), 
            child: Text('No, cancelar')
          ),
          FlatButton(
            onPressed: () async {
              mascota.status=0;
              bool resp = await mascotaProvider.muerePet(mascota);
              if(resp){
                // Navigator.popUntil(context, ModalRoute.withName("/detallemascota"));
                Navigator.of(context).popUntil((route) => route.isFirst);
                Navigator.pushNamed(context, 'detallemascota', arguments: mascota);
              }
              else{
                Navigator.pop(context);
              }
            },
            child: Text('Sí, falleció mi mascota',
              style: TextStyle(fontWeight: FontWeight.bold, color: Colors.black),)
          )
        ],
      ),
    );
  }

  _errorFallecido(){
    return FadeIn(
      child: AlertDialog(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10.0)),
        title: Text('Fallecido'),
        content: Text('Cometiste un error?'),
        actions: <Widget>[
          FlatButton(
            onPressed: ()=>Navigator.pop(context), 
            child: Text('No, cancelar')
          ),
          FlatButton(
            onPressed: () async {
              mascota.status=1;
              bool resp = await mascotaProvider.muerePet(mascota);
              if(resp){
                // Navigator.popUntil(context, ModalRoute.withName("/detallemascota"));
                Navigator.of(context).popUntil((route) => route.isFirst);
                Navigator.pushNamed(context, 'detallemascota', arguments: mascota);
                // Navigator.pushReplacementNamed(context, 'detallemascota', arguments: mascota);
              }
              else{
                Navigator.pop(context);
              }
            },
            child: Text('Sí, cometí un error',
              style: TextStyle(fontWeight: FontWeight.bold, color: colorMain),)
          )
        ],
      ),
    );
  }
/////////////////////////////////////////////////
}

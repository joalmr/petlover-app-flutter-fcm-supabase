import 'package:flutter/material.dart';
import 'package:proypet/src/preferencias_usuario/preferencias_usuario.dart';



class ConfigDrawer extends StatelessWidget {
  final Color primary = Colors.white;
  final Color active = Colors.grey.shade800;
  final Color divider = Colors.grey.shade600;
  final _prefs = new PreferenciasUsuario();

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
              child: Column(
                children: <Widget>[                  
                  SizedBox(height: 40.0,),
                  Text('Configuración',
                    style: TextStyle(
                      fontWeight: FontWeight.w400,
                      fontSize: 24.0,
                      letterSpacing: 3.0,
                      color: Colors.black54,                      
                    ),
                  ),
                  SizedBox(height: 20.0,),
                  //FormControl().buttonSec('Buscar',(){})
                  //buttonPri('Agregar mascota',()=>{}),
                  ListTile(
                    leading: Icon(Icons.person_outline, color: Colors.red[300],),
                    title: Text('Cerrar sesión', style: TextStyle(
                      color: Colors.red[300],
                      fontWeight: FontWeight.w400,
                    ),),
                    onTap: ()=>_outToken(context),
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

    void _outToken(BuildContext context) async {
    
      _prefs.token = '';
    
      Navigator.pushReplacementNamed(context, 'login'); //.popAndPushNamed(context, 'login');
        
  }
}
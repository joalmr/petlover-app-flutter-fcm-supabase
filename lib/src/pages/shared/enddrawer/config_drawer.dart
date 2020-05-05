import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:proypet/src/pages/atenciones/atenciones_page.dart';
import 'package:proypet/src/pages/usuario/changepassword_page.dart';
import 'package:proypet/src/pages/usuario/user_page.dart';
import 'package:proypet/src/preferencias_usuario/preferencias_usuario.dart';
import 'package:proypet/src/providers/user_provider.dart';
import 'package:proypet/src/utils/styles/styles.dart';
import 'package:share/share.dart';



class ConfigDrawer extends StatelessWidget {
  final Color primary = Colors.white;
  final Color active = Colors.grey.shade800;
  final Color divider = Colors.grey.shade600;
  final _prefs = new PreferenciasUsuario();
  final loginProvider = UserProvider();

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Container(
        padding: const EdgeInsets.only(left: 16.0, right: 32.0),
        decoration: BoxDecoration(
          color: primary, 
          boxShadow: [BoxShadow(color: Colors.black45)]
        ),
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
                  leading: Icon(Icons.star,),
                  title: Text('Calificar atenciones', style: TextStyle(
                    fontWeight: FontWeight.w400,
                  ),),
                  onTap: ()=>Navigator.push(context, 
                    MaterialPageRoute(builder: (context) => AtencionesPage())
                  )
                ),
                ListTile(
                  leading: Icon(Icons.person,),
                  title: Text('Editar usuario', style: TextStyle(
                    fontWeight: FontWeight.w400,
                  ),),
                  onTap: ()=>Navigator.push(context, 
                    MaterialPageRoute(builder: (context) => UserPage())
                  )
                ),
                ListTile(
                  leading: Icon(Icons.lock),
                  title: Text('Cambiar contraseña', style: TextStyle(
                    fontWeight: FontWeight.w400,
                  ),),
                  onTap: ()=>Navigator.push(context, 
                    MaterialPageRoute(builder: (context) => ChangePasswordPage())
                  )
                ),
                ListTile(
                  leading: Icon(Icons.share),
                  title: Text('Compartir con mis amigos', style: TextStyle(
                    fontWeight: FontWeight.w400,
                  ),),
                  onTap: ()=>Share.share('Registrate a Proypet, no más cartillas perdidas, tu mascota gozará de buena salud gracias a las notificaciones de Proypet. Ingresa ya y se parte de la comunidad responsable Proypet http://www.proypet.com',
                    subject: 'Registrate hoy a Proypet',
                  ),
                ),
                ListTile(
                  leading: Icon(Icons.person_outline, color: colorRed,),
                  title: Text('Cerrar sesión', style: TextStyle(
                    color: colorRed,
                    fontWeight: FontWeight.w400,
                  ),),
                  onTap: ()=>_cerrarSesion(context),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }

  _cerrarSesion(context){
    showDialog(
      context: context,
      builder: (BuildContext context){
        return FadeIn(
          child: AlertDialog(
            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10.0)),
            title: Text('Cerrar sesión'),
            contentPadding: EdgeInsets.symmetric(horizontal: 20.0, vertical: 10.0),
            titlePadding: EdgeInsets.symmetric(vertical: 10.0, horizontal: 10.0),
            content: Text("Desea cerrar sesión?"),
            actions: <Widget>[
              FlatButton(
                onPressed: ()=>Navigator.pop(context),  
                child: Text('Cancelar',style: TextStyle(color: colorMain),)
              ),
              FlatButton(
                onPressed: ()=>_outToken(context), 
                child: Text('Cerrar sesión',style: TextStyle(color: colorMain),)
              ),
            ],
          ),
        );
      }
    );
  }

  void _outToken(BuildContext context) async {
    loginProvider.logOut();
    _prefs.token = '';
    _prefs.position='';    
    Navigator.pushNamedAndRemoveUntil(context, 'login', ModalRoute.withName('/'));    
  }

}


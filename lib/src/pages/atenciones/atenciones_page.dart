import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
// import 'package:flutter_simple_rating_bar/flutter_simple_rating_bar.dart';
import 'package:proypet/src/pages/atenciones/calificar_page.dart';
import 'package:proypet/src/pages/shared/appbar_menu.dart';
import 'package:proypet/src/pages/shared/form_control/text_field.dart';
import 'package:proypet/src/pages/shared/styles/styles.dart';
import 'package:smooth_star_rating/smooth_star_rating.dart';

class AtencionesPage extends StatefulWidget {
  // const AtencionesPage({Key key}) : super(key: key);
  @override
  _AtencionesPageState createState() => _AtencionesPageState();
}

class _AtencionesPageState extends State<AtencionesPage> {
  TextEditingController _inputComentController=new TextEditingController();
  double myrating= 0.0;

  @override
  Widget build(BuildContext context) {
    
    return Scaffold(
      appBar: appbar(leadingH,'Calificar Atenciones',null),
      body: Padding(padding: EdgeInsets.symmetric(vertical: 20.0),
        child: _listaAtenciones(),
      ),
    );
  }

  Widget _listaAtenciones(){
    return ListView.builder(
        physics: NeverScrollableScrollPhysics(),
        shrinkWrap: true,
        itemCount: 3,
        itemBuilder: (BuildContext context, int index) {
          return Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20.0),
            child: Column(
              children: <Widget>[
                ListTile(
                  leading: CircleAvatar(
                    backgroundColor: colorMain,
                    backgroundImage: NetworkImage('http://52.170.234.215/storage/logos/default.jpg'), //AssetImage('images/greco.png'),//
                    radius: 25.0,
                  ),
                  title: Text('Nombre de establecimiento'),
                  subtitle: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: <Widget>[
                      Text('Nombre de mascota'),
                      Text('2020-03-25',style: TextStyle(color: colorMain,fontSize: 12.0,fontWeight: FontWeight.w600),),
                    ],
                  ),
                  trailing: IconButton(icon: Icon(Icons.star_border), onPressed: ()=>_calificar(context)),
                  // trailing: IconButton(icon: Icon(Icons.star_border), onPressed: ()=>Navigator.push(context, 
                  //   MaterialPageRoute(builder: (context) => CalificarPage())
                  // )),
                  contentPadding: EdgeInsets.symmetric(horizontal: 0,vertical: 0),
                ),
                Divider(),
              ],
            ),
          );
        },
      );
  }

  _calificar(context){
    myrating=0;
    _inputComentController.text='';
    showDialog(
      context: context,
      builder: (BuildContext context){
        return SimpleDialog(
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10.0)),
          title: Text('Calificar atención'),
          contentPadding: EdgeInsets.symmetric(horizontal: 20.0, vertical: 10.0),
          titlePadding: EdgeInsets.symmetric(vertical: 10.0, horizontal: 10.0),
          children: <Widget>[
            Text('Nombre vet'),
            SizedBox(height: 10.0,),
            RatingBar(
              initialRating: myrating,
              minRating: 0,
              direction: Axis.horizontal,
              allowHalfRating: false,
              itemCount: 5,
              itemPadding: EdgeInsets.symmetric(horizontal: 2.0),
              glow: false,
              itemBuilder: (context, _) => Icon(Icons.star, color: colorMain,),
              onRatingUpdate: (rating) {
                // print(rating);
                myrating=rating;
              },
            ),
            SizedBox(height: 10.0,),
            textfieldArea(_inputComentController,"Ingrese comentario de la atención recibida",250,3),
            Row(
              crossAxisAlignment: CrossAxisAlignment.end,
              mainAxisAlignment: MainAxisAlignment.end,
              children: <Widget>[
                FlatButton(
                  onPressed: ()=>Navigator.pop(context),  
                  child: Text('Cancelar',style: TextStyle(color: colorMain),)
                ),
                FlatButton(
                  onPressed: (){}, 
                  child: Text('Calificar',style: TextStyle(color: colorMain),)
                ),
              ],
            ),
          ],
        );
      }
    );
  }
}
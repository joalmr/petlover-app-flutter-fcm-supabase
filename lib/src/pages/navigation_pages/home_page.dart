import 'package:animate_do/animate_do.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_swiper/flutter_swiper.dart';
import 'package:proypet/src/model/booking/booking_home.dart';
import 'package:proypet/src/model/home_model.dart';
import 'package:proypet/src/model/mascota/mascota_model.dart';
import 'package:proypet/src/pages/shared/enddrawer/config_drawer.dart';
import 'package:proypet/src/pages/shared/form_control/button_primary.dart';
import 'package:proypet/src/pages/shared/navigation_bar.dart';
import 'package:proypet/src/pages/shared/snackbar.dart';
import 'package:proypet/src/pages/shared/styles/styles.dart';
import 'package:proypet/src/preferencias_usuario/preferencias_usuario.dart';
import 'package:proypet/src/providers/booking_provider.dart';
import 'package:proypet/src/model/home_model.dart' as hoModel ;
import 'package:proypet/src/providers/user_provider.dart';
import 'package:proypet/src/utils/utils.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey<ScaffoldState>();
  final loginProvider = UserProvider();
  final bookingProvider = BookingProvider();

  final _prefs = new PreferenciasUsuario();

  fnGetPosition() async {
    final datoPosicion = await fnPosition();
    _prefs.position = '${datoPosicion.latitude},${datoPosicion.longitude}';
  }

  @override
  void initState() {
    //implement initState
    fnGetPosition();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {    
    return Scaffold(
      key: _scaffoldKey,
      backgroundColor: Colors.white,
      endDrawer: ConfigDrawer(),
      body: onUser()
    );
  }

  Widget onUser() {
    return FutureBuilder(
      future: loginProvider.getUserSummary(),
      builder: (BuildContext context, AsyncSnapshot<HomeModel> snapshot) {
        final mydata=snapshot.data;
        if(!snapshot.hasData){
          return LinearProgressIndicator(
            backgroundColor: Colors.grey[200],
          );
        }
        else{
          return SingleChildScrollView(
            //physics: BouncingScrollPhysics(),
            padding: EdgeInsets.symmetric(horizontal: 20.0),
            child: Column(
              children: <Widget>[
                SizedBox(height: 35.0,),
                FadeIn(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      Text(
                        "Hola,", // + mascotas.length.toString(),
                        style: Theme.of(context)
                            .textTheme
                            .display1
                            .apply(color: Colors.grey[500]),
                      ),
                      IconButton(
                        icon: Icon(Icons.settings),
                        onPressed: ()=>_scaffoldKey.currentState.openEndDrawer()
                      )
                    ],
                  ),
                ),
                //onUser(),
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
                        Text(' Qué estás buscando?',
                        style: TextStyle(
                          color: Colors.black87,
                          fontSize: 24.0,
                          fontWeight: FontWeight.w300),),
                        SizedBox(height: 15.0),
                        SingleChildScrollView(
                          physics: BouncingScrollPhysics(),
                          scrollDirection: Axis.horizontal,
                          child: Row(
                            children: <Widget>[
                              InkWell(
                                borderRadius: BorderRadius.circular(15.0),
                                onTap: ()=>Navigator.pushNamed(context, 'navLista', arguments:{ "filtros":[2] } ),
                                // onTap: ()=>Navigator.push(
                                //   context,MaterialPageRoute(
                                //     builder: (context) => NavigationBar(currentTabIndex: 2, filtros: { "filtros":[1] }, ),
                                // )),
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
                                      //padding: EdgeInsets.all(25.0),
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(15.0),
                                        image: DecorationImage(
                                          fit: BoxFit.cover,
                                          image: AssetImage('images/v_consulta.jpg'),
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
                              ),
                              SizedBox(width: 15.0),
                              InkWell(
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
                                      //padding: EdgeInsets.all(25.0),
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(15.0),
                                        image: DecorationImage(
                                          fit: BoxFit.cover,
                                          image: AssetImage('images/v_vacuna.jpeg'),
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
                              ),
                              SizedBox(width: 15.0),
                              InkWell(
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
                                      //padding: EdgeInsets.all(25.0),
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(15.0),
                                        image: DecorationImage(
                                          fit: BoxFit.cover,
                                          image: AssetImage('images/v_banio.jpg'),
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
                              ),
                              SizedBox(width: 15.0),
                              InkWell(
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
                                      //padding: EdgeInsets.all(25.0),
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(15.0),
                                        image: DecorationImage(
                                          fit: BoxFit.cover,
                                          image: AssetImage('images/v_desparacita.jpg'),
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
                              ),
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
                        child: Text(
                          "Próxima atención",
                          style: Theme.of(context)
                              .textTheme
                              .title
                              .apply(color: Colors.black87, fontWeightDelta: 1),
                        ),
                      ),
                      Icon(Icons.timelapse, color: Colors.black.withOpacity(.71)),
                    ],
                  ),
                ),
                FadeIn(child: _atenciones(mydata.bookings,mydata.pets.length)),
              ],
            ),
          );
        }
      },
    );
  }

  Widget _usuario(hoModel.UserHome usuario){
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: <Widget>[
        Text(
          usuario.name, //snapshot.data?.name, //nombre del usuario
          style: Theme.of(context)
              .textTheme
              .display1
              .apply(color: Colors.black87, fontWeightDelta: 2),
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
                              style: TextStyle(
                                fontSize: 22,
                                fontWeight: FontWeight.bold,
                                color: Colors.white,
                              ),
                            ),
                            Text(
                              mascotas[index].breedName,
                              style: TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.w400,
                                color: Colors.white,
                              ),
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
                                    style: Theme.of(context)
                                      .textTheme
                                      .display1
                                      .apply(color: Colors.white, fontWeightDelta: 2),
                                  ),
                                  TextSpan(text: " kg.")
                                ],
                              ),
                            ),
                            Row(
                              children: <Widget>[
                                (mascotas[index].status==0) 
                                  ? Icon(Icons.bookmark, color: Colors.grey[300]) 
                                  : Icon(Icons.cake, color: Colors.grey[300]),
                                SizedBox(width: 5.0),
                                (mascotas[index].status==0) 
                                ? Text("Fallecido",//mascotas[index].age.toString(),
                                  style: TextStyle(color: Colors.grey[300],),
                                )
                                : Text(
                                  calculateAge(DateTime.parse(mascotas[index].birthdate)),//mascotas[index].age.toString(),
                                  style: TextStyle(color: Colors.grey[300]),
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
                          padding: EdgeInsets.symmetric(
                              horizontal: 15.0, vertical: 11.0),
                          color: Colors.black.withOpacity(0.15),
                          // onPressed: ()=>Navigator.push(context, MaterialPageRoute(
                          //   builder: (_)=>MascotaDetallePage(mascota: mascotas[index],),
                          // )),
                          onPressed: ()=>Navigator.pushNamed(context, 'detallemascota', arguments: mascotas[index]),
                          child: Text(
                            'Ver más',
                            style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.bold),
                          ),
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
                backgroundColor: colorMain,
                onPressed: ()=>Navigator.pushNamed(context, 'agregarmascota'),
                // Navigator.push(context, MaterialPageRoute(builder: (_)=>MascotaAgregarPage(),)),
                child: Icon(Icons.playlist_add),
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
            // FlatButton(
            //   child: Text('Agregar mascota',
            //     style: TextStyle(
            //       color: colorMain,
            //       fontWeight: FontWeight.bold,
            //       fontSize: 16.0),),
            //   onPressed: ()=>Navigator.pushNamed(context, 'agregarmascota'),
            // )
          ],
        ),
      );
  }

  Widget _atenciones(List<BookingHome> atenciones,lengthPet){
    if(atenciones.length>0)
      return ListView.builder(
        physics: NeverScrollableScrollPhysics(),
        shrinkWrap: true,
        itemCount: atenciones.length,
        itemBuilder: (BuildContext context, int index) {
          var dismissible = Dismissible(
            key: UniqueKey(),
            background: Container(
              color: colorRed,
            ),
            direction: DismissDirection.endToStart,
            // onDismissed: (fn){},
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
                        onPressed: ()=>deleteBooking(atenciones[index].id),
                        child: Text('Sí, eliminar')
                      )
                    ],
                  ),
                );
              }
            ),
            child: Column(
              children: <Widget>[
                ListTile(
                  leading: CircleAvatar(
                    backgroundColor: colorMain,
                    backgroundImage: CachedNetworkImageProvider(atenciones[index].petPicture),//AssetImage('images/greco.png'),//
                    radius: 25.0,
                  ),
                  title: Text(atenciones[index].establishmentName),
                  subtitle: Text(atenciones[index].petName),
                  trailing: Column(
                    children: <Widget>[
                      Text(
                        atenciones[index].date,//" Mañana",
                        style: TextStyle(color: Colors.black.withOpacity(.71),fontSize: 12.0,fontWeight: FontWeight.w600),
                      ),
                      Text(
                        atenciones[index].time,//"17:00",
                        style: TextStyle(color: colorMain,fontSize: 16.0,fontWeight: FontWeight.w600),
                        textAlign: TextAlign.center,
                      ),
                    ],
                  ),
                  contentPadding: EdgeInsets.symmetric(horizontal: 0,vertical: 0),
                ),
                Divider(),
              ],
            ),
          );
          return dismissible;
        },
      );
    else
      if(lengthPet>0)
        return Container(
          // height: 150.0,
          // width: double.infinity,
          padding: EdgeInsets.symmetric(vertical: 30.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Text('Haz una reserva en el establecimiento de tu agrado',
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
            Text('Vamos, agrega a tu mascota y se parte de la comunidad responsable', //Vamos, agrega a tu mascota y se parte de la comunidad responsable
              textAlign: TextAlign.center,
            ),
            SizedBox(height: 10.0,),
            buttonPri('Agregar mascota', ()=>Navigator.pushNamed(context, 'agregarmascota'),),
            // FlatButton(
            //   child: Text('Agregar mascota',
            //     style: TextStyle(
            //       color: colorMain,
            //       fontWeight: FontWeight.bold,
            //       fontSize: 16.0),),
            //   onPressed: ()=>Navigator.pushNamed(context, 'agregarmascota'),
            // )
          ],
        ),
      );
  }

  deleteBooking(String id) async {
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
}

import 'dart:ui';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:proypet/src/model/establecimiento/establecimiento_model.dart';
import 'package:proypet/src/model/mascota/mascota_model.dart';
import 'package:proypet/src/pages/reserva/reserva_data.dart';
import 'package:proypet/src/pages/shared/card_swiper.dart';
import 'package:proypet/src/pages/shared/modal_bottom.dart';
import 'package:proypet/src/pages/shared/styles/styles.dart';
import 'package:proypet/src/providers/establecimiento_provider.dart';
import 'package:proypet/src/providers/mascota_provider.dart';
import 'package:proypet/src/utils/utils.dart';
import 'package:url_launcher/url_launcher.dart';

class ReservaDetallePage extends StatefulWidget {
  final String idvet;
  ReservaDetallePage({@required this.idvet});
  @override
  _ReservaDetallePageState createState() => _ReservaDetallePageState();
}

class _ReservaDetallePageState extends State<ReservaDetallePage> {
  final establecimientoProvider = EstablecimientoProvider();
  String phone="";
  List<MascotaModel> misMascotas;
  final mascotaProvider = MascotaProvider();
  Modal modal = new Modal();  
  String nameVet="";

  @override
  Widget build(BuildContext context) {
    
    return Scaffold(
      body: FutureBuilder(
        future: establecimientoProvider.getVet(widget.idvet),
        builder: (BuildContext context, AsyncSnapshot<EstablecimientoModel> snapshot) {
          final mydata=snapshot.data;
          phone="+51993191969";
          if(!snapshot.hasData){
            return Center(child: CircularProgressIndicator()); //valueColor: new AlwaysStoppedAnimation<Color>(colorMain),
          }
          else{
            nameVet = mydata.name;
            return Stack(
              children: [
                Container(
                  height: MediaQuery.of(context).size.height,
                  color: colorMain,
                ),
                Positioned(
                  bottom: 0.0,
                  height: 100.0,
                  child: FlatButton(
                    onPressed: _reservar,//()=>modal.mainModal(context,DataReserva(establecimientoID: widget.idvet)),
                    child: Container(
                      width: MediaQuery.of(context).size.width,
                      padding: EdgeInsets.only(top: 35.0),
                      child: Center(
                        child: Text('Reservar atención',style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold,fontSize: 15.0),),
                      )
                    ),
                  ),
                ),
                Container(
                  height: MediaQuery.of(context).size.height - 65.0,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.only(bottomLeft: Radius.circular(35.0), bottomRight: Radius.circular(35.0)),
                    color: Colors.white
                  ),
                  child: SingleChildScrollView(
                    child: _onDetail(context,mydata),
                  ),
                ),
                Positioned(
                  top: 0,
                  left: 0,
                  right: 0,
                  child: AppBar(
                    backgroundColor: Colors.transparent,
                    elevation: 0,
                    centerTitle: true,
                    title: Text("",style: TextStyle(
                      fontSize: 16.0,
                      fontWeight: FontWeight.normal
                    ),),
                  ),
                ),
              ]
            );
          }
        },
      )
    );
  }

//double distanciagps=0;



  Widget _onDetail(context,EstablecimientoModel localVet) {
  return Column(
    children: <Widget>[
      Container(
        height: 325.0,
        width: double.infinity,
        child: (localVet.slides.length>0) ? _swiperVets(localVet.slides) : _swiperVets(["images/vet_prueba.jpg"])
      ),
      SizedBox(height: .5),
      Padding(
        padding: const EdgeInsets.symmetric(horizontal: 0.0),
        child: Container(
          width: MediaQuery.of(context).size.width - 0.0,
          child: ListTile(
            title: Text(localVet.name,//nombreVet(0),
              maxLines: 2,
              style: TextStyle(
                fontSize: 20.0,
                fontWeight: FontWeight.w600
              )
            ),
            subtitle: FutureBuilder(
              future: fnDistance(localVet.latitude,localVet.longitude),
              builder: (BuildContext context, AsyncSnapshot<String> snapshot) {
                if(!snapshot.hasData){
                  return Text("");
                }
                else{
                  return RichText(
                    text: TextSpan(
                      text: '',
                      style: DefaultTextStyle.of(context).style,
                      children: <TextSpan>[
                        TextSpan(text: '${snapshot.data} ',),
                        TextSpan(text: '${localVet.address}',style: TextStyle(fontStyle: FontStyle.italic)),
                      ],
                    ),
                  );
                }
              },
            ),
            trailing: Container(
              height: 65.0,
              width: 65.0,
              decoration: BoxDecoration(
                color: Colors.grey.withOpacity(0.1),
                borderRadius: BorderRadius.circular(100.0),
                image: DecorationImage(
                  image: CachedNetworkImageProvider(localVet.logo),
                  fit: BoxFit.cover
                )
              ),
            ),
          ),
        ),
      ),
      Padding(
        padding: const EdgeInsets.only(left: 20.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            Row(
              children: <Widget>[
                Text('Recomendación',
                style: TextStyle(
                    fontSize: 15.0,
                    color: Color(0xFF6A6A6A),
                    fontWeight: FontWeight.w600)),
                SizedBox(width: 15.0),
                Stack(
                  children: <Widget>[
                    Container(height: 40.0, width: 100.0),
                    Positioned(
                      left: 10.0,
                      child: Container(
                        height: 40.0,
                        width: 40.0,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20.0),
                          color: colorMain //Color(0xFFFE7050)
                        ),
                        child: Center(
                          child: Text(localVet.votes.toString(),
                            style: TextStyle(
                              fontSize: 12.0, color: Colors.white
                            )
                          ),
                        ),
                      ),
                    ),
                    Row(
                      children: <Widget>[
                        SizedBox(width: 55.0),
                        Container(
                          height: 40.0,
                          padding: EdgeInsets.symmetric(horizontal: 10.0),
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(20.0),
                              color: Colors.black.withOpacity(0.2)),
                          child: Center(
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: <Widget>[
                                Icon(Icons.star, color: Colors.white, size: 12.0),
                                SizedBox(width: 5.0),
                                Text(localVet.stars.toString(),style: TextStyle(color: Colors.white))
                              ],
                            ),
                          )
                        )
                      ],
                    ),
                  ],
                ),
              ],
            ),
            Padding(
              padding: const EdgeInsets.only(right: 15.0),
              child: FloatingActionButton(
                backgroundColor: colorMain,
                child: Icon(Icons.phone, color: Colors.white,),
                onPressed: _launchPhone, 
              ),
            )
          ],
        ),
      ),
      SizedBox(height: 20.0),
      Container(
        padding: EdgeInsets.symmetric(horizontal: 20.0, vertical: 5.0),
        child: SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: _servicios(),
        ),
      ),
      SizedBox(height: 20.0),
      Container(
        padding: EdgeInsets.only(left: 20.0,right: 20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[  
            Text('Descripción',
              style: TextStyle(
                  fontSize: 15.0,
                  color: Color(0xFF6A6A6A),
                  fontWeight: FontWeight.w600)),  
            SizedBox(height: 10.0,),
            Text(localVet.description,textAlign: TextAlign.justify,),
            SizedBox(width: double.infinity,),
            // Text('Est laborum tempor sunt aliquip ex mollit cillum commodo laborum laborum laborum excepteur mollit. Adipisicing et irure Lorem qui nisi officia non eu. Officia dolor laboris sunt ipsum pariatur in minim dolor amet. Labore do nostrud sit ipsum aliqua aliqua cupidatat eu. Aliquip duis anim nostrud consequat enim ipsum. Consequat proident ex occaecat laboris ea exercitation culpa ex laborum dolore irure. Exercitation ea eu mollit Lorem. Laborum dolor tempor officia adipisicing esse enim sint consectetur anim in anim pariatur duis. Lorem ex non enim pariatur. Id sit adipisicing mollit laborum exercitation officia eiusmod voluptate ea labore ullamco est consectetur do. Excepteur est eu amet laboris in laboris non Lorem veniam. Consequat reprehenderit incididunt cupidatat aliqua deserunt. Officia pariatur ad irure proident tempor. Velit qui nulla reprehenderit ut do eu fugiat. Est enim veniam enim velit sint incididunt qui sint nulla sunt. Reprehenderit ullamco nisi voluptate elit laborum occaecat consequat.'
            //   ,textAlign: TextAlign.justify,
            // )
          ],
        ),
      ),
    ],
  );
}

  Widget _servicios(){
    return Row(
      // crossAxisAlignment: CrossAxisAlignment.start,
      // mainAxisAlignment: MainAxisAlignment.start,
      children: <Widget>[
        //servicios()
        _icoServicio('images/veterinaria2.png','Servicio 1'),
        SizedBox(width: 10.0,),
        _icoServicio('images/veterinaria2.png','Servicio 2'),
        SizedBox(width: 10.0,),
        _icoServicio('images/veterinaria2.png','Servicio 1'),
        SizedBox(width: 10.0,),
        _icoServicio('images/veterinaria2.png','Servicio 2'),
        SizedBox(width: 10.0,),
        _icoServicio('images/veterinaria2.png','Servicio 1'),
        SizedBox(width: 10.0,),
        _icoServicio('images/veterinaria2.png','Servicio 2'),
        SizedBox(width: 10.0,),
        _icoServicio('images/veterinaria2.png','Servicio 1'),
        SizedBox(width: 10.0,),
        _icoServicio('images/veterinaria2.png','Servicio 2'),
        SizedBox(width: 10.0,),
      ],
    );
    
  }

  Widget _icoServicio(imagen,nombre){
    return Column(
      children: <Widget>[
        SizedBox(height: 5,),
        Container(
          height: 32,
          width: 32,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(5.0),
            color: Colors.white,
            boxShadow:[ 
              BoxShadow(
                color: Colors.black.withOpacity(0.1),
                blurRadius: 3.0,
                spreadRadius: 2.0
            )],
          ),
          child: Padding(
            padding: const EdgeInsets.all(5.0),
            child: Image(image: AssetImage(imagen)),
          ) //Icon(Icons.pets, color: colorMain,),
        ),
        SizedBox(height: 5),
        Text(nombre,style: TextStyle(fontWeight: FontWeight.w300,fontSize: 10.0),)
      ],
    );
  }

  Widget _swiperVets(imagen){
    return CardSwiper(imagenes : imagen, height: 145.0,);    
  }

  _launchPhone() async {
    var url = 'tel:$phone';
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      throw 'No se pudo llamar $url';
    }
  }

  _reservar() async {
    misMascotas = await mascotaProvider.getPets();
    // modal.mainModal(context,DataReserva(establecimientoID: widget.idvet, misMascotas: misMascotas, mascotaID: misMascotas[0].id));
    Navigator.push(
      context,MaterialPageRoute(builder: (context) => DataReserva(establecimientoID: widget.idvet, misMascotas: misMascotas, mascotaID: misMascotas[0].id, establecimientoName: nameVet,))
    );
  }
}

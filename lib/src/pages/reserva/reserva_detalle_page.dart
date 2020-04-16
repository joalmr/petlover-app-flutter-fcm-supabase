import 'dart:ui';
import 'package:animate_do/animate_do.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:proypet/src/model/establecimiento/establecimiento_model.dart';
import 'package:proypet/src/model/login/user_model.dart';
import 'package:proypet/src/model/mascota/mascota_model.dart';
import 'package:proypet/src/pages/reserva/reserva_data.dart';
import 'package:proypet/src/pages/shared/card_swiper.dart';
import 'package:proypet/src/pages/shared/form_control/button_primary.dart';
import 'package:proypet/src/pages/shared/form_control/text_from.dart';
import 'package:proypet/src/pages/shared/modal_bottom.dart';
import 'package:proypet/src/pages/shared/snackbar.dart';
import 'package:proypet/src/pages/shared/styles/styles.dart';
import 'package:proypet/src/providers/establecimiento_provider.dart';
import 'package:proypet/src/providers/mascota_provider.dart';
import 'package:proypet/src/providers/user_provider.dart';
import 'package:proypet/src/utils/icons_map.dart';
import 'package:url_launcher/url_launcher.dart';

class ReservaDetallePage extends StatefulWidget {
  final EstablecimientoModel vet;
  final String vetID;
  ReservaDetallePage({this.vet, this.vetID});
  @override
  _ReservaDetallePageState createState() => _ReservaDetallePageState(vet: vet, vetID: vetID);
}

class _ReservaDetallePageState extends State<ReservaDetallePage> {
  EstablecimientoModel vet;
  String vetID;
  _ReservaDetallePageState({this.vet, this.vetID});
  final establecimientoProvider = EstablecimientoProvider();
  final mascotaProvider = MascotaProvider();
  final userProvider = UserProvider();
  final scaffoldKey = GlobalKey<ScaffoldState>();
  final formKey = GlobalKey<FormState>();
  User user = User();//
  List<MascotaModel> misMascotas;  
  Modal modal = new Modal();
  bool delivery = false;
  String telefono="";

  @override
  Widget build(BuildContext context) {    
    
    return Scaffold(
      key: scaffoldKey,
      body: Stack(
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
              child: (vet!=null) ? _onDetail(context,vet) : FutureBuilder(
                future: establecimientoProvider.getVet(vetID),
                builder: (BuildContext context, AsyncSnapshot<EstablecimientoModel> snapshot) {
                  if(!snapshot.hasData) return Container();
                  else return _onDetail(context, snapshot.data);
                },
              ),
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
      )
    );
  }

  Widget _onDetail(context,EstablecimientoModel localVet) {
    return Column(
      children: <Widget>[
        Container(
          height: 325.0,
          width: double.infinity,
          child: (localVet.slides.length>0) ? _swiperVets(localVet.slides, true) : _swiperVets(["images/vet_prueba.jpg"], false)
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
              subtitle: Text('${localVet.address}'),//${localVet.distance}km
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
          padding: EdgeInsets.symmetric(horizontal: 10.0,),
          child: _servicios(localVet.services),
        ),
        SizedBox(height: 10.0),
        localVet.prices.length>0 ?
        DataTable(
          headingRowHeight: 30.0,
          dataRowHeight: 30.0,
          columns: [
            DataColumn(label: Text("Servicios")),
            DataColumn(label: Text("Desde")),
            DataColumn(label: Text("Hasta")),
          ], 
          rows: [
            DataRow(cells: [
              DataCell(Text("Consulta")),
              DataCell(Text(localVet.prices["consultation"]["from"]==null?"-":localVet.prices["consultation"]["from"])),
              DataCell(Text(localVet.prices["consultation"]["to"]==null?"-":localVet.prices["consultation"]["to"])),
              ]
            ),
            DataRow(cells: [
              DataCell(Text("Vacunas")),
              DataCell(Text(localVet.prices["vaccination"]["from"]==null?"-":localVet.prices["vaccination"]["from"])),
              DataCell(Text(localVet.prices["vaccination"]["to"]==null?"-":localVet.prices["vaccination"]["to"])),
              ]
            ),
            DataRow(cells: [
              DataCell(Text("Baños")),
              DataCell(Text(localVet.prices["grooming"]["from"]==null?"-":localVet.prices["grooming"]["from"])),
              DataCell(Text(localVet.prices["grooming"]["to"]==null?"-":localVet.prices["grooming"]["to"])),
              ]
            ),
            DataRow(cells: [
              DataCell(Text("Desparasitaciones")),
              DataCell(Text(localVet.prices["deworming"]["from"]==null?"-":localVet.prices["deworming"]["from"])),
              DataCell(Text(localVet.prices["deworming"]["to"]==null?"-":localVet.prices["deworming"]["to"])),
              ]
            ),
          ]
        ) : SizedBox(height: 0.0,),        
        SizedBox(height: 25.0),
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

  Widget _servicios(List<Service> servicios){
    return SizedBox(
      height: 60,
      child: ListView.builder(
        shrinkWrap: true,
        scrollDirection: Axis.horizontal,
        itemCount: servicios.length,
        itemBuilder: (BuildContext context, int index) => _icoServicio(servicios[index].slug, servicios[index].name),
      ),
    );   
  }

  Widget _icoServicio(String icon, String nombre){
    if(icon=="delivery"){
      delivery=true;
    }
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 7.5),
      child: Column(
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
              child: Tooltip(
                child: Icon(iconMap[icon], color: Colors.black54,),
                message: nombre,
              ),
            )
          ),
          SizedBox(height: 5),
          Text((nombre.length>6) ? '${nombre.substring(0,6)}..' : nombre ,style: TextStyle(fontWeight: FontWeight.w300,fontSize: 8.0),)
        ],
      ),
    );
  }

  Widget _swiperVets(imagen, bool urlBool){
    return CardSwiper(imagenes : imagen, urlBool: urlBool, height: 145.0,);    
  }

  _launchPhone() async {
    var url = 'tel:${vet.phone}';
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      throw 'No se pudo llamar $url';
    }
  }

  _reservar() async {
    misMascotas = await mascotaProvider.getPets();
    misMascotas = misMascotas.where((x)=>x.status!=0).toList();
    // modal.mainModal(context,DataReserva(establecimientoID: widget.idvet, misMascotas: misMascotas, mascotaID: misMascotas[0].id));
    if(misMascotas.length>0){
      bool validatelefono = false;
      var usuario = await userProvider.getUser();
      user = usuario.user;
      if(user.phone != null){
        validatelefono=true;
      } 
      if(validatelefono){
        Navigator.push(
          context,MaterialPageRoute(builder: (context) => DataReserva(establecimientoID: vet.id, misMascotas: misMascotas, mascotaID: misMascotas[0].id, establecimientoName: vet.name, delivery: delivery,))
        );
      }
      else{        
        showDialog(context: context,builder: 
          (BuildContext context)=> FadeIn(
            child: AlertDialog(
              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10.0)),
              contentPadding: EdgeInsets.symmetric(horizontal: 20.0, vertical: 10.0),
              content: Container(
                height: 170.0,
                child: Form(
                  key: formKey,
                  child: Column(
                    children: <Widget>[
                      SizedBox(height: 10.0,),
                      Text('Debe ingresar un número de teléfono', style: TextStyle(fontSize: 14.0)),
                      SizedBox(height: 10.0,),
                      // textFormLess("Ingresar teléfono", (value)=>telefono=value,),
                      textForm('Ingrese teléfono', Icons.phone, false, (value)=>user.phone=value, TextCapitalization.words, user.phone,TextInputType.phone),
                      SizedBox(height: 10.0,),
                      buttonPri("Guardar teléfono", _onPhone)
                    ],
                  ),
                )
              ),
            ),
          ),
        );
      }      
    }
    else{
      mostrarSnackbar('No puede generar una reserva', colorRed, scaffoldKey);  
    }    
  }

  void _onPhone() async {
    formKey.currentState.save();
    setState(() { });
    bool resp = await userProvider.editUser(user);//
    print(resp);
    Navigator.pop(context);
    // if(resp){
    //   Navigator.push(
    //     context,MaterialPageRoute(builder: (context) => DataReserva(establecimientoID: vet.id, misMascotas: misMascotas, mascotaID: misMascotas[0].id, establecimientoName: vet.name, delivery: delivery,))
    //   );
    // }
  }

}

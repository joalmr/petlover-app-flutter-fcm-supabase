import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:proypet/icon_proypet_icons.dart';
import 'package:proypet/src/pages/shared/appbar_menu.dart';
import 'package:proypet/src/utils/styles/styles.dart';

class HistoriaPage extends StatelessWidget {
  const HistoriaPage({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final dynamic historiaData = ModalRoute.of(context).settings.arguments;

    var jsonText = historiaData["detalle"];
    var precio = historiaData["precio"];
    var proximacita;
    var motivo = historiaData["motivo"];

    if(historiaData["proximacita"]!=""){
      proximacita = DateFormat('dd-MM-yyyy').format(DateTime.parse(historiaData["proximacita"]));
    }

    return Scaffold(
      appBar: appbar(null,'Detalle de atención',null),
      body: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(vertical: 20.0 ,horizontal: 20.0),
        child: Column(        
          children: <Widget>[
            (jsonText.toString().contains("grooming")) ? _banio(jsonText["grooming"]) : SizedBox(),
            (jsonText.toString().contains("deworming")) ? _desparasita(jsonText["deworming"]) : SizedBox(),
            (jsonText.toString().contains("vaccination")) ? _vacuna(jsonText["vaccination"]) : SizedBox(),
            (jsonText.toString().contains("consultation")) ? _consulta(jsonText["consultation"]) : SizedBox(),
            (jsonText.toString().contains("surgery")) ? _cirugia(jsonText["surgery"]) : SizedBox(),
            Divider(height: 30.0, color: Colors.black,),
            Container(
              width: double.infinity,
              padding: EdgeInsets.only(right: 20.0), //.symmetric(horizontal: 0.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Text("Precio", style: TextStyle(fontWeight: FontWeight.bold)),
                  Text(precio.toString(), textAlign: TextAlign.right, style: TextStyle(fontWeight: FontWeight.bold),),
                ],
              )
            ),
            SizedBox(height: 20.0,),
            Container(
              width: double.infinity,
              padding: EdgeInsets.symmetric(horizontal: 0.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.start,
                children: <Widget>[
                  Text("Próxima cita", style: TextStyle( fontWeight: FontWeight.bold, fontSize: sizeH6 ),),
                  Text(proximacita, style: TextStyle( fontWeight: FontWeight.bold) ),
                  SizedBox(height: 10.0,),
                  Text("Motivo", style: TextStyle( fontWeight: FontWeight.bold, fontSize: sizeH6 ),),
                  Text(motivo, style: TextStyle( fontWeight: FontWeight.bold) ),
                ],
              ),
            ),
            

          ],
        ),
      )
    );
  }

  _banio(data){
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.start,
      children: <Widget>[
        Row(
          children: <Widget>[
            Icon( IconProypet.grooming ,size: 16.0,color: Colors.black54),
            SizedBox(width: 10.0,),
            Text('Baño', style: TextStyle(fontSize: sizeH3, color: Colors.black54),),
          ],
        ),
        SizedBox(height: 10,),
        Text("Recomendación", style: TextStyle( fontWeight: FontWeight.bold, fontSize: sizeH6 ),),
        Text((data["recommendations"]!=null) ? data["recommendations"] : "-"),
        SizedBox(height: 10,),
        Text("Atendido por", style: TextStyle( fontWeight: FontWeight.bold, fontSize: sizeH6 ),),
        Text((data["employee"]!=null) ? data["employee"] : "-"),
        Divider(),
        Container(
          width: double.infinity,
          padding: EdgeInsets.symmetric(horizontal: 20.0),
          child: Text(data["amount"].toString(), textAlign: TextAlign.right)
        ),
      ],
    );
  }

  _desparasita(data){
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.start,
      children: <Widget>[
        Row(
          children: <Widget>[
            Icon( IconProypet.desparasitacion ,size: 16.0,color: Colors.black54),
            SizedBox(width: 10.0,),
            Text('Desparasitación', style: TextStyle(fontSize: sizeH3, color: Colors.black54),),
          ],
        ),
        SizedBox(height: 10,),
        Text("Recomendación", style: TextStyle( fontWeight: FontWeight.bold, fontSize: sizeH6 ),),
        Text((data["recommendations"])!=null ? data["recommendations"] : "-"),
        SizedBox(height: 10,),
        Text("Atendido por", style: TextStyle( fontWeight: FontWeight.bold, fontSize: sizeH6 ),),
        Text((data["employee"]!=null) ? data["employee"] : "-"),
        Divider(),
        Container(
          width: double.infinity,
          padding: EdgeInsets.symmetric(horizontal: 20.0),
          child: Text(data["amount"].toString(), textAlign: TextAlign.right)
        )
      ],
    );
  }

  _vacuna(data){
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.start,
      children: <Widget>[
        Row(
          children: <Widget>[
            Icon( IconProypet.vacuna ,size: 16.0,color: Colors.black54),
            SizedBox(width: 10.0,),
            Text('Vacuna', style: TextStyle(fontSize: sizeH3, color: Colors.black54),),
          ],
        ),
        SizedBox(height: 10,),
        Text("Recomendación", style: TextStyle( fontWeight: FontWeight.bold, fontSize: sizeH6 ),),
        Text((data["recommendations"]!=null) ? data["recommendations"] : "-"),
        SizedBox(height: 10,),
        Text("Atendido por", style: TextStyle( fontWeight: FontWeight.bold, fontSize: sizeH6 ),),
        Text((data["employee"]!=null) ? data["employee"] : "-"),
        Divider(),
        Container(
          width: double.infinity,
          padding: EdgeInsets.symmetric(horizontal: 20.0),
          child: Text(data["amount"].toString(), textAlign: TextAlign.right)
        )
      ],
    );
  }

  _consulta(data){
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.start,
      children: <Widget>[
        Row(
          children: <Widget>[
            Icon( IconProypet.consulta ,size: 16.0,color: Colors.black54),
            SizedBox(width: 10.0,),
            Text('Consulta', style: TextStyle(fontSize: sizeH3, color: Colors.black54),),
          ],
        ),
        SizedBox(height: 10,),
        Text("Recomendación", style: TextStyle( fontWeight: FontWeight.bold, fontSize: sizeH6 ),),
        Text((data["recommendations"]!=null) ? data["recommendations"] : "-"),
        Text("Atendido por", style: TextStyle( fontWeight: FontWeight.bold, fontSize: sizeH6 ),),
        Text((data["employee"]!=null) ? data["employee"] : "-"),
        Divider(),
        Container(
          width: double.infinity,
          padding: EdgeInsets.symmetric(horizontal: 20.0),
          child: Text(data["amount"].toString(), textAlign: TextAlign.right)
        )
      ],
    );
  }

  _cirugia(data){
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.start,
      children: <Widget>[
        Row(
          children: <Widget>[
            Icon( IconProypet.cirugia ,size: 16.0,color: Colors.black54),
            SizedBox(width: 10.0,),
            Text('Cirugía', style: TextStyle(fontSize: sizeH3, color: Colors.black54),),
          ],
        ),
        SizedBox(height: 10,),
        Text("Recomendación", style: TextStyle( fontWeight: FontWeight.bold, fontSize: sizeH6 ),),
        Text((data["recommendations"]!=null) ? data["recommendations"] : "-"),
        Text("Atendido por", style: TextStyle( fontWeight: FontWeight.bold, fontSize: sizeH6 ),),
        Text((data["employee"]!=null) ? data["employee"] : "-"),
        Divider(),
        Container(
          width: double.infinity,
          padding: EdgeInsets.symmetric(horizontal: 20.0),
          child: Text(data["amount"].toString(), textAlign: TextAlign.right)
        )
      ],
    );
  }
}
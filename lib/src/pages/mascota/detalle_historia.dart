import 'package:flutter/material.dart';
import 'package:proypet/icon_proypet_icons.dart';
import 'package:proypet/src/pages/shared/appbar_menu.dart';

class HistoriaPage extends StatelessWidget {
  const HistoriaPage({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final dynamic historiaData = ModalRoute.of(context).settings.arguments;

    var jsonText = historiaData["detalle"];
    var precio = historiaData["precio"];

    return Scaffold(
      appBar: appbar(leadingH,'Detalle de historia',null),
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
              padding: EdgeInsets.symmetric(horizontal: 20.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Text("Precio", style: TextStyle(fontWeight: FontWeight.bold)),
                  Text(precio.toString(), textAlign: TextAlign.right, style: TextStyle(fontWeight: FontWeight.bold),),
                ],
              )
            )
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
            Text('Baño', style: TextStyle(fontSize: 16.0, color: Colors.black54),),
          ],
        ),
        Text((data["groomings"]!=null) ? data["groomings"] : "-"),
        Text((data["recommendations"]!=null) ? data["recommendations"] : "-"),
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
            Text('Desparasitación', style: TextStyle(fontSize: 16.0, color: Colors.black54),),
          ],
        ),
        Text((data["dewormers"]!=null) ? data["dewormers"] : "-"),
        Text((data["dewormerDetails"]!=null) ? data["dewormerDetails"] : "-"),
        Text((data["recommendations"])!=null ? data["recommendations"] : "-"),
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
            Text('Vacuna', style: TextStyle(fontSize: 16.0, color: Colors.black54),),
          ],
        ),
        Text((data["vaccines"]!=null) ? data["vaccines"] : "-"),
        Text((data["recommendations"]!=null) ? data["recommendations"] : "-"),
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
            Text('Consulta', style: TextStyle(fontSize: 16.0, color: Colors.black54),),
          ],
        ),
        Text((data["anamnesis"]!=null) ? data["anamnesis"] : "-"),
        Text((data["diagnoses"]!=null) ? data["diagnoses"] : "-"),
        Text((data["treatments"]!=null) ? data["treatments"] : "-"),
        Text((data["treatmentInstructions"]!=null) ? data["treatmentInstructions"] : "-"),
        Text((data["findings"]!=null) ? data["findings"] : "-"),
        Text((data["recommendations"]!=null) ? data["recommendations"] : "-"),
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
            Text('Cirugía', style: TextStyle(fontSize: 16.0, color: Colors.black54),),
          ],
        ),
        Text((data["anamnesis"]!=null) ? data["anamnesis"] : "-"),
        Text((data["diagnoses"]!=null) ? data["diagnoses"] : "-"),
        Text((data["treatments"]!=null) ? data["treatments"] : "-"),
        Text((data["treatmentInstructions"]!=null) ? data["treatmentInstructions"] : "-"),
        Text((data["findings"]!=null) ? data["findings"] : "-"),
        Text((data["recommendations"]!=null) ? data["recommendations"] : "-"),
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
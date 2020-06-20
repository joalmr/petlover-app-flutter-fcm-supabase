import 'package:flutter/material.dart';
import 'package:proypet/src/model/establecimiento/establecimiento_model.dart';
import 'package:proypet/src/utils/icons_map.dart';

class ViewGeneral extends StatefulWidget {
  final dynamic localVet;
  ViewGeneral({@required this.localVet}); 
  @override
  _ViewGeneralState createState() => _ViewGeneralState(localVet: localVet);
}

class _ViewGeneralState extends State<ViewGeneral> {
  dynamic localVet;
  _ViewGeneralState({@required this.localVet});

  @override
  Widget build(BuildContext context) {
    return viewGeneral(localVet);
  }

  viewGeneral(localVet){
    return SingleChildScrollView(
      child: Column(
        children: <Widget>[
          SizedBox(height: 10.0,),
          Container(
            width: double.infinity,
            padding: EdgeInsets.only(left: 20.0, right: 20.0, bottom: 5.0),
            child: Text("Servicios", style: 
              Theme.of(context).textTheme.subtitle2.apply(fontWeightDelta: 2)
            // tituloH4 
            ),
          ),
          Container(
            padding: EdgeInsets.symmetric(horizontal: 10.0,),
            child: _servicios(localVet.services),
          ),
          Container(
            padding: EdgeInsets.only(left: 20.0,right: 20.0, top: 10.0, bottom: 10.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.start,
              children: <Widget>[  
                Text('Descripción', style: 
                  Theme.of(context).textTheme.subtitle2.apply(fontWeightDelta: 2)
                  // tituloH4 
                  ),  
                SizedBox(height: 5.0,),
                Text(localVet.description,textAlign: TextAlign.justify,),
                SizedBox(width: double.infinity,),
              ],
            ),
          ),
          
        ],
      ),
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
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8.5),
      child: Column(
        children: <Widget>[
          SizedBox(height: 5,),
          Container(
            height: 32,
            width: 32,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(5.0),
              color: Theme.of(context).backgroundColor , //Colors.white,
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
                child: Icon(iconMap[icon], size: 20, color: Theme.of(context).textTheme.subtitle2.color ),
                message: nombre,
              ),
            )
          ),
          SizedBox(height: 5),
          Text((nombre.length>9) ? '${nombre.substring(0,9)}..' : nombre ,style: TextStyle(fontWeight: FontWeight.w300,fontSize: 8.0),)
        ],
      ),
    );
  }
  
}
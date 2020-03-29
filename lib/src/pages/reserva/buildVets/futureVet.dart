import 'package:flutter/material.dart';
import 'package:proypet/src/model/establecimiento/establecimiento_model.dart';
import 'package:proypet/src/providers/establecimiento_provider.dart';
import 'package:proypet/src/utils/utils.dart';

EstablecimientoProvider vetProvider = EstablecimientoProvider();

 fnEstablecimiento() async {
  List<EstablecimientoModel> nuevaLista = List();
  
  return await vetProvider.getVets().then((resp) async {
    for (var item in resp) {
      EstablecimientoModel estTemp = item;
      estTemp.distancia = await fnDistance(item.latitude, item.longitude);
      nuevaLista.add(estTemp);      
    }

    print(nuevaLista);
    print(nuevaLista[0].name);

    return nuevaLista.sort((a,b) => a.distancia.compareTo(b.distancia));

  });
 }


// final List<EstablecimientoModel> establecimiento = new List();

      // vets.establecimientos.forEach( (f) async {
      //   EstablecimientoModel estTemp = f;
      //   estTemp.distancia = await fnDistance(f.latitude,f.longitude);
      //   establecimiento.add(estTemp);
      // });
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

//lista para ddl

  List<DropdownMenuItem<String>> getOpcionesDropdown(_lista){
    List<DropdownMenuItem<String>> lista = new List();
    _lista.forEach((_lista){
      lista.add(DropdownMenuItem(
        child: Text(_lista['name']),
        value: _lista['id'],
      ));
    });
    return lista;
  }

  List<DropdownMenuItem<String>> getOpcionesImgFuture(_lista){
    List<DropdownMenuItem<String>> lista = new List();
    _lista.forEach((_lista){
      lista.add(DropdownMenuItem(
        child: Row(
          children: <Widget>[
            CircleAvatar(backgroundImage: CachedNetworkImageProvider(_lista.picture), radius: 20.0,),
            SizedBox(width: 5.0,),
            Text(_lista.name),
          ],
        ),
        value: _lista.id,
      ));
    });
    return lista;
  }

  List<DropdownMenuItem<String>> getOpcionesFuture(_lista){
    List<DropdownMenuItem<String>> lista = new List();
    _lista.forEach((_lista){
      lista.add(DropdownMenuItem(
        child: Text(_lista.name),
        value: _lista.id.toString()
      ));
    });
    return lista;
  }

  List<DropdownMenuItem<String>> getOpcionesSearch(_lista){
    List<DropdownMenuItem<String>> lista = new List();
    _lista.forEach((_lista){
      lista.add(DropdownMenuItem(
        child: Text(_lista.name.toString()),
        value: "${_lista.id}|${_lista.name}"//_lista.id.toString()
      ));
    });
    // print(lista);
    return lista;
  }
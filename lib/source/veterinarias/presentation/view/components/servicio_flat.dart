import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:proypet/design/styles/styles.dart';
import 'package:proypet/source/veterinarias/domain/controller/filtra_vets_controller.dart';

class ServicioFlat extends StatelessWidget {
  final String texto;
  final int numero;
  ServicioFlat(this.texto, this.numero);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<FiltraVetsController>(builder: (_) {
      return Padding(
        padding: EdgeInsets.symmetric(horizontal: 2, vertical: 0),
        child: TextButton(
          child: Text(
            texto,
            style: TextStyle(
              color: _.listaFiltros.contains(numero) ? Colors.white : colorGray3,
              fontSize: 12
            ),
          ),
          onPressed: () => _.add2List(numero),
          style: TextButton.styleFrom(
            padding: EdgeInsets.all(7.5),
            textStyle: TextStyle(fontWeight: FontWeight.bold),
            backgroundColor: _.listaFiltros.contains(numero) ? colorMain : Colors.transparent,
            shape: RoundedRectangleBorder(
              borderRadius: new BorderRadius.circular(20.0),
              side: BorderSide(color: _.listaFiltros.contains(numero) ? colorMain : colorGray3),
            ),
          ),
        ),
      );
    });
  }
}

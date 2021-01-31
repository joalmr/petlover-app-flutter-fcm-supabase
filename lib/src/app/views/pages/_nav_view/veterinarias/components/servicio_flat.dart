import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:proypet/src/app/styles/styles.dart';
import 'package:proypet/src/controllers/veterinaria_controller/filtra_vets_controller.dart';

class ServicioFlat extends StatelessWidget {
  final String texto;
  final int numero;
  ServicioFlat(this.texto, this.numero);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<FiltraVetsController>(builder: (_) {
      return Padding(
        padding: const EdgeInsets.symmetric(horizontal: 2, vertical: 0),
        child: FlatButton(
          padding: EdgeInsets.all(7.5),
          child: Text(
            texto,
            style: TextStyle(
                color: _.listaFiltros.contains(numero)
                    ? Colors.white
                    : colorGray3),
          ),
          onPressed: () => _.add2List(numero),
          color: _.listaFiltros.contains(numero)
              ? colorGreen2
              : Colors.transparent,
          shape: RoundedRectangleBorder(
            borderRadius: new BorderRadius.circular(20.0),
            side: BorderSide(
              color: _.listaFiltros.contains(numero) ? colorGreen2 : colorGray3,
            ),
          ),
        ),
      );
    });
  }
}

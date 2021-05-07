import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:proypet/source/veterinarias/domain/controller/lista_vets_controller.dart';

import 'favoritas_view.dart';
import 'veterinarias_view.dart';

class MainVet extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GetX<VeterinariasController>(
      builder: (_) {
        return _.favoriteVets.length>0
          ? FavroiteVets()
          : ReservaList();
      },
    );
  }
}
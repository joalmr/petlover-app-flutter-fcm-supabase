import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:proypet/components/navegadores/appbar.dart';
import 'package:proypet/source/veterinarias/domain/controller/lista_vets_controller.dart';

import 'components/build_vet.dart';
import 'veterinarias_view.dart';

class FavroiteVets extends StatelessWidget {
  const FavroiteVets({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetX<VeterinariasController>(
      builder: (_) {
        return Scaffold(
          appBar: appBar(
            texto: 'Veterinarias favoritas',
            acc: null,
          ),
          body: Column(
            children: [
              Expanded(
                child: ListView.builder(
                  itemCount: _.favoriteVets.length,
                  itemBuilder: (BuildContext context, int index) {
                    return buildVets(_.favoriteVets[index]);
                  },
                ),
              ),
              Container(
                height: 60,
                width: double.maxFinite,
                child: SizedBox(
                  width: double.maxFinite,
                  child: TextButton(
                    child: Text('Ver más veterinarias'), 
                    onPressed: ()=>Get.to(ReservaList()), 
                  ),
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
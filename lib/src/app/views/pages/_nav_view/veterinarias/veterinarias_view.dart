import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:proypet/src/app/styles/lottie.dart';
import 'package:proypet/src/app/styles/styles.dart';
import 'package:proypet/src/app/views/components/navegadores/appbar.dart';
import 'package:proypet/src/app/views/pages/_nav_view/veterinarias/vet_mapa/vet_mapa_page.dart';

import 'package:proypet/src/app/views/pages/_nav_view/veterinarias/filtro_veterinarias.dart';
import 'package:proypet/src/app/views/components/form_control/button_primary.dart';
import 'package:proypet/src/app/views/components/transition/fadeViewSafeArea.dart';
import 'package:proypet/src/controllers/veterinaria_controller/lista_vets_controller.dart';

import 'components/build_vet.dart';
import 'components/chips.dart';
import 'components/direccion.dart';

//ReservaList //VeterinariasPage
class ReservaList extends StatelessWidget {
  final refreshKey = GlobalKey<RefreshIndicatorState>();

  @override
  Widget build(BuildContext context) {
    return GetX<VeterinariasController>(
      builder: (_) {
        return Scaffold(
          appBar: appBar(
            texto: 'Buscar veterinarias',
            acc: <Widget>[
              IconButton(
                icon: Icon(Icons.search),
                onPressed: () => Get.toNamed('buscarveterinaria'),
              ),
              IconButton(
                icon: Icon(Icons.filter_list),
                onPressed: () => Get.to(FiltraVets()),
              ),
            ],
          ),
          body: _.loading.value
              ? Container(
                  height: double.infinity,
                  width: double.infinity,
                  child: Center(
                    child: lottieLoading,
                  ),
                )
              : _.gps
                  ? FadeViewSafeArea(
                      child: Stack(
                        children: <Widget>[
                          RefreshIndicator(
                            key: refreshKey,
                            onRefresh: _.refresh,
                            child: Column(
                              children: [
                                Row(
                                  children: [
                                    Expanded(
                                      child: Padding(
                                        padding: const EdgeInsets.only(
                                            top: 10,
                                            bottom: 10,
                                            left: 20,
                                            right: 20),
                                        child: Row(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.center,
                                          mainAxisAlignment:
                                              MainAxisAlignment.start,
                                          children: [
                                            Icon(Icons.location_on,
                                                color: colorMain, size: 14),
                                            Text(_.global.ubicacion,
                                                style: TextStyle(fontSize: 12)),
                                          ],
                                        ),
                                      ),
                                    ),
                                    IconButton(
                                      icon: _.ordena
                                          ? Icon(
                                              Icons.star,
                                              color: colorMain,
                                            )
                                          : Icon(Icons.star_border),
                                      onPressed: () => _.orderVets(),
                                    ),
                                  ],
                                ),
                                (_.listaFiltros.length > 0)
                                    ? listarChip(_.listaFiltros)
                                    : SizedBox(height: 0.0),
                                (_.vetLocales.length < 1)
                                    ? SizedBox(
                                        height: 50.0,
                                        child: Center(
                                          child: Padding(
                                            padding: const EdgeInsets.symmetric(
                                                vertical: 10.0),
                                            child: Text(
                                                "No se encontró veterinarias"),
                                          ),
                                        ),
                                      )
                                    : Expanded(
                                        child: ListView.builder(
                                          controller: _.scrollController,
                                          itemCount: _.vetLocales.length,
                                          itemBuilder: (BuildContext context,
                                              int index) {
                                            return buildVets(
                                                _.vetLocales[index]);
                                          },
                                        ),
                                      ),
                              ],
                            ),
                          ),
                          Positioned(
                            bottom: 15,
                            right: 10,
                            child: FloatingActionButton(
                              onPressed: (_.vetLocales.length == 0)
                                  ? null
                                  : () => Get.to(
                                        VetMapaPage(
                                            establecimientos:
                                                _.vetLocales.value),
                                      ),
                              child: Icon(Icons.location_on),
                            ),
                          ),
                        ],
                      ),
                    )
                  : FadeViewSafeArea(
                      child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 20),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            Padding(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 30),
                              child: Text(
                                'Ingresa una dirección para buscar veterinarias cercanas',
                                style: Get.textTheme.subtitle1,
                                textAlign: TextAlign.center,
                              ),
                            ),
                            SizedBox(height: 10),
                            autocompleteAddress(),
                            SizedBox(height: 10),
                            buttonOutLine(
                              'Buscar',
                              () => _.filtra(),
                              colorMain,
                            ),
                          ],
                        ),
                      ),
                    ),
        );
      },
    );
  }
}

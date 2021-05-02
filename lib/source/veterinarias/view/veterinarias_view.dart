import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:proypet/components/form_control/btn_others.dart';
import 'package:proypet/components/form_control/buttons/btn_secondary.dart';
import 'package:proypet/components/navegadores/appbar.dart';
import 'package:proypet/components/transition/fadeViewSafeArea.dart';
import 'package:proypet/design/styles/lottie.dart';
import 'package:proypet/design/styles/styles.dart';
import 'package:proypet/source/veterinarias/controller/lista_vets_controller.dart';
import 'package:proypet/source/veterinarias/view/filtro_veterinarias.dart';

import 'components/build_vet.dart';
import 'components/chips.dart';
import 'components/direccion.dart';
import 'vet_mapa/vet_mapa_page.dart';

class ReservaList extends StatelessWidget {
  final refreshKey = GlobalKey<RefreshIndicatorState>();

  @override
  Widget build(BuildContext context) {
    return GetX<VeterinariasController>(
      builder: (_) {
        return Scaffold(
          appBar: appBar(
            texto: 'Buscar veterinarias',
            acc: _.gps
                ? <Widget>[
                    IconButton(
                      icon: Icon(Icons.search),
                      onPressed: () => Get.toNamed('buscarveterinaria'),
                    ),
                    IconButton(
                      icon: Icon(Icons.filter_list),
                      onPressed: () => Get.to(FiltraVets()),
                    ),
                  ]
                : null,
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
                                'Ingresa tu dirección para mostrarte veterinarias cercanas',
                                style: Get.textTheme.subtitle1,
                                textAlign: TextAlign.center,
                              ),
                            ),
                            SizedBox(height: 10),
                            autocompleteAddress(),
                            SizedBox(height: 10),
                            btnSecondary(
                              text: 'Buscar',
                              onPressed: () => _.filtra(),
                              color: colorMain,
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

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:proypet/src/views/pages/viewVeterinarias/mapaView/vet_mapa_page.dart';
import 'package:proypet/src2/app/views/components/appbar_menu.dart';
import 'package:proypet/src2/app/views/pages/_nav_view/veterinarias/filtro_veterinarias.dart';
import 'package:proypet/src2/app/views/components/form_control/button_primary.dart';
import 'package:proypet/src2/app/views/components/transition/fadeViewSafeArea.dart';
import 'package:proypet/src2/controllers/veterinaria_controller/lista_vets_controller.dart';

import 'components/build_vet.dart';
import 'components/chips.dart';
import 'components/direccion.dart';

//ReservaList //VeterinariasPage
class ReservaList extends StatelessWidget {
  final refreshKey = GlobalKey<RefreshIndicatorState>();

  @override
  Widget build(BuildContext context) {
    return GetX<VeterinariasController>(
      // init: VeterinariasController(),
      builder: (_) {
        return Scaffold(
          appBar: appbar(leadingH, 'Buscar veterinarias', <Widget>[
            IconButton(
              icon: Icon(Icons.filter_list),
              onPressed: () => Get.to(FiltraVets()),
            ),
          ]),
          body: _.loading.value
              ? Container(
                  height: double.infinity,
                  width: double.infinity,
                  child: Center(
                    child: CupertinoActivityIndicator(),
                  ),
                )
              : _.gps
                  ? FadeViewSafeArea(
                      child: Stack(
                      children: <Widget>[
                        RefreshIndicator(
                          key: refreshKey,
                          onRefresh: _.refresh,
                          child: CustomScrollView(
                            slivers: <Widget>[
                              (_.listaFiltros.length > 0)
                                  ? listarChip(_.listaFiltros)
                                  : SliverToBoxAdapter(
                                      child: SizedBox(
                                        height: 0.0,
                                      ),
                                    ),
                              (_.vetLocales.length < 1)
                                  ? SliverToBoxAdapter(
                                      child: SizedBox(
                                        height: 50.0,
                                        child: Center(
                                          child: Padding(
                                            padding: const EdgeInsets.symmetric(vertical: 10.0),
                                            child: Text("No se encontró veterinarias"),
                                          ),
                                        ),
                                      ),
                                    )
                                  : SliverList(
                                      delegate: SliverChildBuilderDelegate(
                                        (BuildContext context, int index) {
                                          return buildVets(_.vetLocales[index]);
                                        },
                                        childCount: _.vetLocales.length,
                                      ),
                                    ),
                              SliverToBoxAdapter(
                                child: SizedBox(height: 50.0),
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
                                      VetMapaPage(establecimientos: _.vetLocales.value),
                                    ),
                            child: Icon(Icons.location_on),
                          ),
                        ),
                      ],
                    ))
                  : FadeViewSafeArea(
                      child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 20),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            Text(
                              'No pudimos detectar tu ubicación',
                              style: Get.textTheme.subtitle1,
                            ),
                            SizedBox(height: 10),
                            autocompleteAddress(),
                            SizedBox(height: 10),
                            buttonPri('Buscar', () => _.filtra()) //_onRefresh
                          ],
                        ),
                      ),
                    ),
        );
      },
    );
  }
}

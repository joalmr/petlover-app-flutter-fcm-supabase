import 'package:animate_do/animate_do.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:proypet/src/app/styles/lottie.dart';
import 'package:proypet/src/app/styles/styles.dart';
import 'package:proypet/src/controllers/veterinaria_controller/promocion_vet_controller.dart';
import 'package:proypet/src/data/providers/establishment/model/promocion_model.dart';
import 'package:proypet/src/utils/icons_map.dart';

class ViewPromocion extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GetX<PromocionVetController>(
      init: PromocionVetController(),
      builder: (_) => _.cargando.value
          ? FadeIn(
              child: Container(
                child: Center(
                  child: lottieLoading,
                ),
              ),
            )
          : (_.promociones.length == 0)
              ? FadeIn(
                  child: Container(
                    child: Center(
                      child: FadeIn(
                        duration: Duration(milliseconds: 1000),
                        child: Text('No tiene promociones.'),
                      ),
                    ),
                  ),
                )
              : ListView.builder(
                  itemCount: _.promociones.length,
                  padding: EdgeInsets.all(10),
                  itemBuilder: (BuildContext context, int index) {
                    PromocionModel promocion = _.promociones[index];
                    return Padding(
                      padding: const EdgeInsets.only(bottom: 8.0),
                      child: Card(
                        child: Row(
                          children: [
                            Padding(
                              padding: const EdgeInsets.only(
                                  top: 8, bottom: 8, left: 10, right: 8),
                              child: CircleAvatar(
                                radius: 30,
                                backgroundColor: colorBlue,
                                child: Icon(
                                  iconNum[int.parse(promocion.serviceId)],
                                  color: Colors.white,
                                  size: 28,
                                ),
                              ),
                            ),
                            Expanded(
                              child: SizedBox(
                                width: double.maxFinite,
                                child: Text(promocion.description),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(
                                  top: 8, bottom: 8, left: 8, right: 10),
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  Text(
                                    promocion.type == 'Amount'
                                        ? '-${promocion.discount}'
                                        : promocion.type == 'Percentage'
                                            ? '${promocion.discount}%'
                                            : '${promocion.discount}',
                                    style: TextStyle(
                                      color: promocion.type == 'Total'
                                          ? colorGreen2
                                          : colorRed,
                                      fontWeight: FontWeight.w900,
                                      fontSize: 24,
                                    ),
                                  ),
                                  Text(
                                    promocion.type == 'Percentage'
                                        ? 'desc.'
                                        : 'soles',
                                    style: TextStyle(
                                      color: promocion.type == 'Total'
                                          ? colorGreen2
                                          : colorRed,
                                      fontWeight: FontWeight.w900,
                                      fontSize: 10,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    );
                  },
                ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:proypet/src/app/styles/lottie.dart';
import 'package:proypet/src/app/styles/styles.dart';
import 'package:proypet/src/app/views/pages/mascota/detalle/components/tab_general/card_history.dart';
import 'package:proypet/src/controllers/mascota_controller/detalle_mascota_controller.dart';

import 'timeline/timeline_life.dart';

class GeneralTab extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GetX<MascotaDetalleController>(
      builder: (_) {
        return CustomScrollView(
          slivers: [
            SliverToBoxAdapter(
              child: FnTimeLine(),
            ),
            SliverToBoxAdapter(
              child: Container(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Padding(
                      padding: EdgeInsets.only(
                          top: 10, left: 10, right: 10, bottom: 10),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            '${_.tempMonth.value}. ${_.tempYear.value}',
                            style: TextStyle(
                                fontWeight: FontWeight.w700, color: colorMain),
                          ),
                          InkWell(
                            onTap: _.goPosition,
                            child: Text(
                              'Hoy',
                              style: TextStyle(
                                fontWeight: FontWeight.w700,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    _.loadingHistory.value
                        ? Container(
                            width: double.infinity,
                            height: 120,
                            child: Center(
                              child: lottieLoading,
                            ),
                          )
                        : _.pet.status == 0
                            ? Center(
                                child: Image(
                                  height: 180,
                                  width: 180,
                                  image: AssetImage(
                                    _.pet.specieId == 1
                                        ? 'images/cat_dog/cat-death.png'
                                        : 'images/cat_dog/dog-death.png',
                                  ),
                                ),
                              )
                            : _.petHistory.length == 0
                                ? Container(
                                    height: 120,
                                    child: Center(
                                      child:
                                          Text('No tiene registros este mes'),
                                    ),
                                  )
                                : ListView.builder(
                                    padding: EdgeInsets.zero,
                                    physics: NeverScrollableScrollPhysics(),
                                    shrinkWrap: true,
                                    itemCount: _.petHistory.length,
                                    itemBuilder:
                                        (BuildContext context, int index) {
                                      var history = _.petHistory[index];
                                      return cardHistory(history);
                                    },
                                  ),
                  ],
                ),
              ),
            ),
            SliverToBoxAdapter(
              child: Center(
                child: InkWell(
                  onTap: _.goToHistory,
                  child: Padding(
                    padding: EdgeInsets.only(top: 20, bottom: 40),
                    child: Text(
                      'Ver todas las atenciones',
                      style: TextStyle(color: colorMain),
                    ),
                  ),
                ),
              ),
            ),
          ],
        );
      },
    );
  }
}

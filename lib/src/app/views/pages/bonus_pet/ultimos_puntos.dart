import 'package:animate_do/animate_do.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:proypet/src/app/styles/styles.dart';
import 'package:proypet/src/app/views/components/navegadores/appbar.dart';
import 'package:proypet/src/controllers/bonus_pet/bonus_controller.dart';

class PuntosGanados extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GetX<BonusController>(
      init: BonusController(),
      builder: (_) {
        return Scaffold(
          appBar: appBar(
            texto: 'Puntos ganados',
            acc: null,
          ),
          body: _.cargando.value
              ? Center(child: CupertinoActivityIndicator())
              : Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    FadeIn(
                      child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 20.0),
                        child: Text('Últimos puntos ganados',
                            style: Get.textTheme.subtitle2
                                .apply(fontWeightDelta: 2)),
                      ),
                    ),
                    Expanded(
                      child: _.bonificados.length < 1
                          ? Center(
                              child: Padding(
                                padding:
                                    const EdgeInsets.symmetric(vertical: 10.0),
                                child: Text("No tienes puntos ganados"),
                              ),
                            )
                          : ListView.builder(
                              itemCount: _.bonificados.length,
                              itemBuilder: (BuildContext context, int index) {
                                final bonificado = _.bonificados[index];
                                return Padding(
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 10.0),
                                  child: ListTile(
                                    title: Text(
                                      '${bonificado.establishmentName}',
                                      style: Get.textTheme.subtitle2,
                                    ),
                                    trailing: CircleAvatar(
                                      backgroundColor: colorMain,
                                      foregroundColor: colorGray2,
                                      child: Text(
                                        '+${bonificado.points}',
                                        style: TextStyle(
                                          fontSize: sizeSmallx1,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                    ),
                                  ),
                                );
                              },
                            ),
                    ),
                  ],
                ),
        );
      },
    );
  }
}

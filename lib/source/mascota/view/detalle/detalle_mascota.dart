import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:proypet/components/appbar_menu.dart';
import 'package:proypet/source/mascota/view/components/mascota_drawer.dart';
import 'package:proypet/components/transition/fadeView.dart';
import 'package:proypet/config/global_variables.dart';
import 'package:proypet/design/styles/lottie.dart';
import 'package:proypet/design/styles/styles.dart';
import 'package:proypet/source/mascota/controller/detalle_mascota_controller.dart';
import 'package:proypet/utils/calcula_edad.dart';
import 'components/tab_general/card_style.dart';
import 'components/tab_cartilla_vacuna.dart';
import 'components/tab_citas.dart';
import 'components/tab_general.dart';

class MascotaDetallePage extends StatelessWidget {
  final GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey<ScaffoldState>();
  final refreshKey = GlobalKey<RefreshIndicatorState>();

  @override
  Widget build(BuildContext context) {
    return GetX<MascotaDetalleController>(
      init: MascotaDetalleController(),
      builder: (_) {
        return Scaffold(
          key: _scaffoldKey,
          endDrawer: MascotaDrawer(),
          appBar: appbar(
            null,
            _.loading.value ? '' : _.pet.name ?? '',
            <Widget>[
              IconButton(
                icon: Icon(Icons.menu),
                onPressed: () => _scaffoldKey.currentState.openEndDrawer(),
              ),
            ],
          ),
          body: FadeView(
            child: _.loading.value
                ? Container(
                    width: double.infinity,
                    height: double.infinity,
                    child: Center(
                      child: lottieLoading,
                    ),
                  )
                : Stack(
                    children: <Widget>[
                      Container(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Container(
                                  height: 120,
                                  padding: EdgeInsets.symmetric(horizontal: 5),
                                  child: AspectRatio(
                                    aspectRatio:
                                        (mediaAncho < 600) ? 1 : 12 / 8,
                                    child: ClipRRect(
                                      borderRadius: borderRadius,
                                      child: Image(
                                        image: CachedNetworkImageProvider(
                                            _.pet.picture),
                                        fit: BoxFit.cover,
                                      ),
                                    ),
                                  ),
                                ),
                                Container(
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: <Widget>[
                                      Text(_.pet.name,
                                          style: Get.textTheme.subtitle1
                                              .copyWith(
                                                  fontWeight: FontWeight.w900)),
                                      Text(_.pet.breedName,
                                          style: Get.textTheme.subtitle2
                                              .copyWith(
                                                  fontWeight: FontWeight.bold)),
                                      (_.pet.status != 0)
                                          ? Row(
                                              children: [
                                                Padding(
                                                  padding: EdgeInsets.only(
                                                      right: 2.5),
                                                  child: Icon(Icons.cake,
                                                      size: 14),
                                                ),
                                                Text(
                                                    calculateAge(DateTime.parse(
                                                        _.pet.birthdate)),
                                                    style: Get
                                                        .textTheme.subtitle2),
                                              ],
                                            )
                                          : SizedBox(height: 0),
                                      SizedBox(height: 5),
                                      (_.pet.status == 0)
                                          ? Text('Fallecido',
                                              style: Get.textTheme.subtitle2
                                                  .apply(fontWeightDelta: 2)
                                                  .copyWith(
                                                      fontStyle:
                                                          FontStyle.italic))
                                          : Row(
                                              children: [
                                                cardSt(
                                                  content: Text.rich(
                                                    TextSpan(
                                                      text:
                                                          '${_.pet.weight == '0' ? '-' : _.pet.weight}',
                                                      style: TextStyle(
                                                        fontWeight:
                                                            FontWeight.bold,
                                                        fontSize: 20,
                                                      ),
                                                      children: <TextSpan>[
                                                        TextSpan(
                                                          text: 'kg.',
                                                          style: TextStyle(
                                                            fontWeight:
                                                                FontWeight.bold,
                                                            fontSize: 14,
                                                          ),
                                                        ),
                                                      ],
                                                    ),
                                                  ),
                                                  text: 'peso',
                                                ),
                                                cardSt(
                                                  content: _.pet.genre == 1
                                                      ? Icon(
                                                          FontAwesomeIcons.mars,
                                                          color:
                                                              Colors.lightBlue,
                                                        )
                                                      : Icon(
                                                          FontAwesomeIcons
                                                              .venus,
                                                          color: Colors.pink,
                                                        ),
                                                  text: 'sexo',
                                                ),
                                              ],
                                            ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                      Container(
                        margin: EdgeInsets.only(
                            top: 120, bottom: 7.5, left: 5.0, right: 5.0),
                        height: context.height - 120, //180
                        decoration: BoxDecoration(
                          borderRadius: borderRadius,
                          color: Theme.of(context).scaffoldBackgroundColor,
                        ),
                        child: DefaultTabController(
                          length: 3,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              TabBar(
                                // isScrollable: true,
                                indicatorColor: colorMain,
                                labelStyle:
                                    TextStyle(fontWeight: FontWeight.bold),
                                labelColor: colorMain,
                                unselectedLabelColor:
                                    Get.textTheme.subtitle2.color,
                                unselectedLabelStyle:
                                    TextStyle(fontWeight: FontWeight.normal),
                                tabs: [
                                  Tab(text: "General"),
                                  Tab(text: "Vacunas"),
                                  Tab(text: "Próximas citas"),
                                ],
                              ),
                              Expanded(
                                child: TabBarView(
                                  children: <Widget>[
                                    GeneralTab(),
                                    CartillaDigitalTab(),
                                    CitasTab(),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
          ),
        );
      },
    );
  }
}

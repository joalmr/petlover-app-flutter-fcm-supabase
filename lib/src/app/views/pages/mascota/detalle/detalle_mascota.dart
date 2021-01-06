import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:proypet/config/global_variables.dart';
import 'package:proypet/icons/icon_proypet_icons.dart';
import 'package:proypet/src/app/styles/lottie.dart';
import 'package:proypet/src/app/styles/styles.dart';
import 'package:proypet/src/app/views/components/appbar_menu.dart';
import 'package:proypet/src/app/views/components/enddrawer/mascota_drawer.dart';
import 'package:proypet/src/app/views/components/transition/fadeView.dart';
import 'package:proypet/src/controllers/mascota_controller/detalle_mascota_controller.dart';
import 'package:proypet/src/utils/calcula_edad.dart';
import 'components/tab_cartilla_vacuna.dart';
import 'components/dato_mascota.dart';
import 'components/tab_citas.dart';
import 'components/tab_general.dart';
// import 'components/tab_lista_historia.dart';

class MascotaDetallePage extends StatelessWidget {
  final GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey<ScaffoldState>();
  //
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
              Container(
                decoration: BoxDecoration(
                  boxShadow: [
                    BoxShadow(
                        color: Colors.black.withOpacity(0.05),
                        blurRadius: 10.0,
                        spreadRadius: -10.0),
                  ],
                ),
                child: IconButton(
                  icon: Icon(Icons.settings),
                  onPressed: () => _scaffoldKey.currentState.openEndDrawer(),
                ),
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
                        height: 180,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Container(
                              height: 150,
                              padding: EdgeInsets.symmetric(horizontal: 5),
                              child: AspectRatio(
                                aspectRatio: (mediaAncho < 600) ? 1 : 12 / 8,
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
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: <Widget>[
                                  Text(_.pet.name,
                                      style: Get.textTheme.subtitle1.copyWith(
                                          fontWeight: FontWeight.w900)),
                                  Text(_.pet.breedName,
                                      style: Get.textTheme.subtitle2.copyWith(
                                          fontWeight: FontWeight.bold)),
                                  (_.pet.status != 0)
                                      ? Row(
                                          children: [
                                            Padding(
                                              padding:
                                                  EdgeInsets.only(right: 2.5),
                                              child: Icon(Icons.cake, size: 14),
                                            ),
                                            Text(
                                                calculateAge(DateTime.parse(
                                                    _.pet.birthdate)),
                                                style: Get.textTheme.subtitle2),
                                          ],
                                        )
                                      : SizedBox(height: 0),
                                  SizedBox(height: 5),
                                  (_.pet.status == 0)
                                      ? Text('Fallecido',
                                          style: Get.textTheme.subtitle2
                                              .apply(fontWeightDelta: 2)
                                              .copyWith(
                                                  fontStyle: FontStyle.italic))
                                      : Column(
                                          children: <Widget>[
                                            Row(
                                              children: [
                                                Container(
                                                  height: 48,
                                                  width: 48,
                                                  child: Card(
                                                    // shadowColor: colorMain,
                                                    child: Icon(
                                                        FontAwesomeIcons.weight,
                                                        size: 24),
                                                  ),
                                                ),
                                                SizedBox(width: 2.5),
                                                Text(
                                                  '${_.pet.weight == '0' ? '-' : _.pet.weight} kg.',
                                                  style: TextStyle(
                                                      fontWeight:
                                                          FontWeight.bold,
                                                      fontSize: 20),
                                                ),
                                              ],
                                            ),
                                          ],
                                        ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                      Container(
                        margin: EdgeInsets.only(
                            top: 180, bottom: 7.5, left: 5.0, right: 5.0),
                        height: context.height - 180,
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
                              // datoMascota(_.pet),
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
                                    generalTab(_.pet),
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

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lottie/lottie.dart';
import 'package:proypet/components/enddrawer/config_drawer.dart';
import 'package:proypet/components/transition/fadeViewSafeArea.dart';
import 'package:proypet/config/path_variables.dart';
import 'package:proypet/design/styles/lottie.dart';
import 'package:proypet/design/styles/styles.dart';
import 'package:proypet/source/_global/_global_controller.dart';
import 'package:proypet/source/home/domain/controller/home_controller.dart';
import 'package:proypet/source/veterinarias/domain/controller/lista_vets_controller.dart';
import 'components/atenciones.dart';
import 'components/frecuentes.dart';
import 'components/mascota.dart';

class HomePage extends StatelessWidget {
  final GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey<ScaffoldState>();
  final refreshKey = GlobalKey<RefreshIndicatorState>();

  @override
  Widget build(BuildContext context) {
    return GetX<HomeController>(
      builder: (_) {
        return Scaffold(
          key: _scaffoldKey,
          endDrawer: ConfigDrawer(),
          body: RefreshIndicator(
            key: refreshKey,
            onRefresh: _.refresh,
            child: FadeViewSafeArea(
              child: 
              _.loading.value ?
                Center(
                  child: Container(
                    height: 250.0,
                    width: double.infinity,
                    child: Center(
                      child: lottieLoading,
                    ),
                  ),
                )
              :
              ListView(
                padding: EdgeInsets.only(left: 10, right: 10),
                children: <Widget>[
                  Container(
                    color: Theme.of(context).scaffoldBackgroundColor,
                    padding: EdgeInsets.only(top: 10, bottom: 5, left: 0, right: 10),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text.rich(
                          TextSpan(
                            style: GoogleFonts.lato(fontSize: 28, fontWeight: FontWeight.w300),
                            text: 'Hola, ',
                            children: <TextSpan>[
                              TextSpan(
                                text: _.usuario.name,
                                style: TextStyle(fontWeight: FontWeight.bold),
                              ),
                            ],
                          ),
                        ),
                        IconButton(
                          icon: Icon(Icons.settings, color: Get.textTheme.subtitle2.color),
                          onPressed: () => _scaffoldKey.currentState.openEndDrawer(),
                        ),
                      ],
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.only(top:0,bottom:5),
                    child: Mascotas(),
                  ),
                  Container(
                    margin: EdgeInsets.only(top:10,bottom:5),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: <Widget>[
                        SizedBox(height: 10.0),
                        Get.find<VeterinariasController>().favoriteVets.length == 0
                          ? Row(
                            // mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              emergenciaHome(false),
                              SizedBox(width: 15.0),
                              InkWell(
                                onTap: () => Get.find<GlobalController>().currentTabIndex.value=2,
                                borderRadius: BorderRadius.circular(10),
                                child: Container(
                                  padding: EdgeInsets.symmetric(horizontal: 5),
                                  child: Column(
                                    children: [
                                      Lottie.asset(pathLottie('buscando_vet'),height: 90),
                                      Text('Busca veterinarias', style: TextStyle(color: colorMain),)
                                    ],
                                  ),
                                ),
                              ),
                            ],
                          )
                          : SingleChildScrollView(
                            physics: BouncingScrollPhysics(),
                            scrollDirection: Axis.horizontal,
                            child: Row(
                              children: <Widget>[
                                emergenciaHome(false),
                                SizedBox(width: 15.0),
                                for (var item in Get.find<VeterinariasController>().favoriteVets)
                                  Padding(
                                    padding: EdgeInsets.only(right: 15),
                                    child: myFavorite(
                                      item.id,
                                      item.name,
                                      item.slides.length==0
                                        ? '' : item.slides.first,
                                    ),
                                  ),
                              ],
                            ),
                          )
                      ],
                    ),
                  ),
                  // SizedBox(height: 10.0),
                  Container(
                    margin: EdgeInsets.only(top:10,bottom:5),
                    child: Column(
                      children: [
                        Row(
                          children: <Widget>[
                            Expanded(
                              child: Text(
                                "Mis Reservas",
                                style: Get.textTheme.headline6
                                  .apply(fontWeightDelta: 2),
                              ),
                            ),
                            InkWell(
                              onTap: () => showDialog(
                                context: Get.context,
                                builder: (context) => AlertDialog(
                                  scrollable: true,
                                  content: Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    children: [
                                      Container(
                                        padding: EdgeInsets.only(bottom: 10),
                                        width: double.maxFinite,
                                        child: Text(
                                          "Estado de la reserva",
                                          textAlign: TextAlign.center,
                                          style: TextStyle(
                                            color: colorMain,
                                            fontWeight: FontWeight.bold,
                                          ),
                                        ),
                                      ),
                                      Text(
                                        "Por confirmar",
                                        style: TextStyle(
                                          fontSize: 14,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                      Text(
                                        "Su reserva está a la espera de ser aceptada por el establecimiento",
                                        style: TextStyle(fontSize: 12),
                                      ),
                                      SizedBox(height: 7.5),
                                      Text(
                                        "Confirmado",
                                        style: TextStyle(
                                          fontSize: 14,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                      Text(
                                        "Su reserva fue aceptada",
                                        style: TextStyle(fontSize: 12),
                                      ),
                                      SizedBox(height: 7.5),
                                      Text(
                                        "Reprogramado",
                                        style: TextStyle(
                                          fontSize: 14,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                      Text(
                                        "El establecimiento cambió la hora o fecha de la atención",
                                        style: TextStyle(fontSize: 12),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                              child: Icon(Icons.info_outline,
                                color: Get.textTheme.subtitle2.color),
                            ),
                          ],
                        ),
                        Atenciones(),
                      ],
                    ),
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

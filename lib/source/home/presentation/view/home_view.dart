import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:proypet/components/enddrawer/config_drawer.dart';
import 'package:proypet/components/transition/fadeViewSafeArea.dart';
import 'package:proypet/design/styles/styles.dart';
import 'package:proypet/source/home/domain/controller/home_controller.dart';
import 'package:stories_for_flutter/stories_for_flutter.dart';


import 'components/atenciones.dart';
import 'components/frecuentes.dart';
import 'components/mascota.dart';
import 'components/stories.dart';

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
              child: ListView(
                padding: EdgeInsets.only(left: 10, right: 10),
                children: <Widget>[
                  Container(
                    // height: 95,
                    color: Theme.of(context).scaffoldBackgroundColor,
                    padding: EdgeInsets.only(
                        top: 10, bottom: 25, left: 0, right: 10),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text.rich(
                          TextSpan(
                            style: GoogleFonts.lato(
                              fontSize: 28,
                              fontWeight: FontWeight.w300,
                            ),
                            text: 'Hola, ', // default text style
                            children: <TextSpan>[
                              TextSpan(
                                text: _.usuario.name,
                                style: TextStyle(fontWeight: FontWeight.bold),
                              ),
                            ],
                          ),
                        ),
                        IconButton(
                          icon: Icon(Icons.settings,
                              color: Get.textTheme.subtitle2.color),
                          onPressed: () =>
                              _scaffoldKey.currentState.openEndDrawer(),
                        )
                      ],
                    ),
                  ),
                  Mascotas(),
                  _.notificacionesGroup.length>0
                  ? StoriesPet()
                  : SizedBox(height: 0),
                  Container(
                    margin: EdgeInsets.only(top:0,bottom:25),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: <Widget>[
                        Text(' Servicios frecuentes',
                            style: Get.textTheme.headline6
                                .apply(fontWeightDelta: 2)),
                        SizedBox(height: 15.0),
                        SingleChildScrollView(
                          physics: BouncingScrollPhysics(),
                          scrollDirection: Axis.horizontal,
                          child: Row(
                            children: <Widget>[
                              emergenciaHome(),
                              SizedBox(width: 15.0),
                              banioHome(),
                              SizedBox(width: 15.0),
                              vacunaHome(),
                              SizedBox(width: 15.0),
                              desparasitaHome(),
                              SizedBox(width: 15.0),
                              consultaHome(),
                            ],
                          ),
                        )
                      ],
                    ),
                  ),
                  SizedBox(height: 10.0),
                  Row(
                    children: <Widget>[
                      Expanded(
                          child: Text("Mis Reservas",
                              style: Get.textTheme.headline6
                                  .apply(fontWeightDelta: 2))),
                      InkWell(
                        onTap: () => showDialog(
                            context: Get.context,
                            builder: (context) => AlertDialog(
                                  scrollable: true,
                                  content: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
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
                                )),
                        child: Icon(Icons.info_outline,
                            color: Get.textTheme.subtitle2.color),
                      ),
                    ],
                  ),
                  Atenciones(),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}

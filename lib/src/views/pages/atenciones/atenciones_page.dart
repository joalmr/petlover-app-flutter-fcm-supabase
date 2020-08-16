import 'dart:async';
import 'package:animate_do/animate_do.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:get/get.dart';
import 'package:proypet/src/models/antecion/atencion_model.dart';
import 'package:proypet/src2/app/views/components/appbar_menu.dart';
import 'package:proypet/src2/app/views/components/form_control/text_field.dart';
import 'package:proypet/src2/app/views/components/snackbar.dart';
import 'package:proypet/src2/app/views/components/transition/fadeViewSafeArea.dart';

import 'package:proypet/src2/app/styles/styles.dart';
import 'package:proypet/src2/data/services/atencion_servicio.dart';

class AtencionesPage extends StatefulWidget {
  // const AtencionesPage({Key key}) : super(key: key);
  @override
  _AtencionesPageState createState() => _AtencionesPageState();
}

class _AtencionesPageState extends State<AtencionesPage> {
  TextEditingController _inputComentController = new TextEditingController();
  double myrating = 0.0;
  AtencionService atencionProvider = AtencionService();
  // AtencionModel atencion = AtencionModel();
  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: scaffoldKey,
      appBar: appbar(null, 'Calificar Atenciones', null), //leadingH
      body: _listaAtenciones(),
    );
  }

  Widget _listaAtenciones() {
    return FutureBuilder(
      future: atencionProvider.getAtenciones(),
      builder: (BuildContext context, AsyncSnapshot<List<AtencionModel>> snapshot) {
        if (!snapshot.hasData) {
          return LinearProgressIndicator();
        } else {
          List<AtencionModel> atencionModel = snapshot.data;
          // print(atencionModel);
          if (atencionModel.length < 1) {
            return Center(
              child: Padding(
                padding: const EdgeInsets.symmetric(vertical: 10.0),
                child: Text("No tiene veterinarias a calificar"),
              ),
            );
          } else {
            return FadeViewSafeArea(
              child: SingleChildScrollView(
                child: ListView.builder(
                  physics: NeverScrollableScrollPhysics(),
                  shrinkWrap: true,
                  itemCount: snapshot.data.length,
                  itemBuilder: (BuildContext context, int index) {
                    AtencionModel _atencion = snapshot.data[index];
                    return Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 20.0),
                      child: Column(
                        children: <Widget>[
                          ListTile(
                            leading: CircleAvatar(
                              backgroundColor: colorMain,
                              backgroundImage: CachedNetworkImageProvider(_atencion.establishmentLogo), //AssetImage('images/greco.png'),//
                              radius: 25.0,
                            ),
                            title: Text(_atencion.establishmentName),
                            subtitle: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: <Widget>[
                                Text(
                                  _atencion.pet,
                                  style: Get.textTheme.subtitle2,
                                ),
                                Text(
                                  _atencion.createdAt,
                                  style: TextStyle(color: colorMain, fontSize: sizeSmallx1, fontWeight: FontWeight.w600),
                                ),
                              ],
                            ),
                            trailing: IconButton(
                                icon: Icon(
                                  Icons.star_border,
                                  color: Get.textTheme.subtitle2.color,
                                ),
                                onPressed: () => _calificar(context, _atencion)),
                            contentPadding: EdgeInsets.symmetric(horizontal: 0, vertical: 0),
                          ),
                          Divider(),
                        ],
                      ),
                    );
                  },
                ),
              ),
            );
          }
        }
      },
    );
  }

  _calificar(context, AtencionModel atencion) {
    myrating = 0;
    _inputComentController.text = '';
    showDialog(
        context: context,
        barrierDismissible: false,
        builder: (BuildContext context) {
          return FadeIn(
            child: SimpleDialog(
              title: Text('Calificar atención'),
              contentPadding: EdgeInsets.symmetric(horizontal: 20.0, vertical: 10.0),
              titlePadding: EdgeInsets.symmetric(vertical: 10.0, horizontal: 10.0),
              children: <Widget>[
                Text(atencion.establishmentName),
                SizedBox(
                  height: 10.0,
                ),
                RatingBar(
                  initialRating: myrating,
                  minRating: 0,
                  direction: Axis.horizontal,
                  allowHalfRating: false,
                  itemCount: 5,
                  itemPadding: EdgeInsets.symmetric(horizontal: 2.0),
                  glow: false,
                  itemBuilder: (context, _) => Icon(
                    Icons.star,
                    color: colorMain,
                  ),
                  onRatingUpdate: (rating) {
                    myrating = rating;
                  },
                ),
                SizedBox(
                  height: 10.0,
                ),
                textfieldArea(_inputComentController, "Ingrese comentario de la atención recibida", 250, 3),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: <Widget>[
                    FlatButton(onPressed: () => Get.back(), child: Text('Cancelar', style: Get.textTheme.subtitle2.apply(fontWeightDelta: 2))),
                    FlatButton(
                        onPressed: () => _onRate(atencion),
                        child: Text('Calificar', style: Get.textTheme.subtitle2.apply(fontWeightDelta: 2, color: colorMain))),
                  ],
                ),
              ],
            ),
          );
        });
  }

  _onRate(AtencionModel atencion) async {
    atencion.stars = myrating.toInt();
    atencion.comment = _inputComentController.text;
    bool resp = await atencionProvider.calificar(atencion);

    if (resp) {
      showDialog(
          context: context,
          builder: (BuildContext context) => FadeIn(
                child: AlertDialog(
                  contentPadding: EdgeInsets.symmetric(horizontal: 20.0, vertical: 10.0),
                  content: Container(height: 100.0, child: Center(child: Text('Se calificó la atención.', style: TextStyle(fontSize: 14.0)))),
                ),
              ),
          barrierDismissible: false);
      Timer(Duration(milliseconds: 2000), () {
        Get.until((route) => route.isFirst);
      });
    } else
      mostrarSnackbar('No se calificó la atención.', colorRed);
  }
}

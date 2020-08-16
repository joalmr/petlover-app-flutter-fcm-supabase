import 'package:animate_do/animate_do.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:get/get.dart';
import 'package:proypet/src/models/antecion/atencion_model.dart';
import 'package:proypet/src2/app/styles/styles.dart';
import 'package:proypet/src2/app/views/components/form_control/text_field.dart';
import 'package:proypet/src2/data/services/atencion_servicio.dart';

// import 'package:proypet/src/utils/add_msg.dart';
// import 'dart:math' as Math;
// //${thxNoti[Math.Random().nextInt(thxNoti.length)]}

class BuildPushQualify extends StatefulWidget {
  // const name({Key key}) : super(key: key);
  final dynamic noti;
  final String mensaje;
  BuildPushQualify({@required this.noti, @required this.mensaje});

  @override
  _BuildPushQualifyState createState() => _BuildPushQualifyState();
}

class _BuildPushQualifyState extends State<BuildPushQualify> {
  AtencionService atencionProvider = AtencionService();

  TextEditingController _inputComentController = new TextEditingController();

  double myrating = 0.0;

  @override
  Widget build(BuildContext context) {
    _inputComentController.text = '';

    return Container(
      child: Column(
        children: <Widget>[
          Row(
            children: <Widget>[
              ClipRRect(
                borderRadius: BorderRadius.all(Radius.circular(5)),
                child: Image(
                  image: CachedNetworkImageProvider(widget.noti['pet_picture']),
                  height: 65,
                  fit: BoxFit.cover,
                ),
              ),
              Expanded(
                  child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(widget.noti['message']),
              )),
            ],
          ),
          SizedBox(height: 10),
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
          SizedBox(height: 10),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10),
            child: textfieldArea(_inputComentController, "Ingrese comentario de la atención recibida", 250, 3),
          ),
          Row(
            // crossAxisAlignment: CrossAxisAlignment.end,
            mainAxisAlignment: MainAxisAlignment.end,
            children: <Widget>[
              FlatButton(
                child: Text('Omitir', style: Get.textTheme.subtitle2.apply(fontWeightDelta: 2)),
                onPressed: () => Get.back(),
              ),
              FlatButton(
                child: Text('Calificar', style: Get.textTheme.subtitle2.apply(fontWeightDelta: 2, color: colorMain)),
                onPressed: () => _onRate(),
              ),
            ],
          ),
        ],
      ),
    );
  }

  _onRate() async {
    AtencionModel atencion = new AtencionModel();
    atencion.id = widget.noti['id'];
    atencion.stars = myrating.toInt();
    atencion.comment = _inputComentController.text;
    bool resp = await atencionProvider.calificar(atencion);

    if (resp) {
      Get.back();
      showDialog(
          context: context,
          builder: (BuildContext context) => FadeIn(
                child: AlertDialog(
                  contentPadding: EdgeInsets.symmetric(horizontal: 20.0, vertical: 10.0),
                  content: Container(height: 100.0, child: Center(child: Text('Se calificó la atención.', style: TextStyle(fontSize: 14.0)))),
                ),
              ),
          barrierDismissible: true);
    } else {
      Get.back();
      showDialog(
          context: context,
          builder: (BuildContext context) => FadeIn(
                child: AlertDialog(
                  contentPadding: EdgeInsets.symmetric(horizontal: 20.0, vertical: 10.0),
                  content: Container(height: 100.0, child: Center(child: Text('No se calificó la atención.', style: TextStyle(fontSize: 14.0)))),
                ),
              ),
          barrierDismissible: true);
    }
  }
}

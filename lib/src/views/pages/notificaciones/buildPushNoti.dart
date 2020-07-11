import 'package:animate_do/animate_do.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:proypet/src/providers/establecimiento_provider.dart';
import 'package:proypet/src/utils/add_msg.dart';
import 'dart:math' as Math;

import 'package:proypet/src/views/pages/reserva/vet_detalle_page.dart';

class BuildPushNoti extends StatefulWidget {
  // const BuildPushNoti({Key key}) : super(key: key);
  final dynamic noti;
  final String mensaje;
  BuildPushNoti({@required this.noti, @required this.mensaje});

  @override
  _BuildPushNotiState createState() => _BuildPushNotiState();
}

class _BuildPushNotiState extends State<BuildPushNoti> {
  @override
  Widget build(BuildContext context) {
    // Data dataPush = Data.fromJson(widget.noti);
    // print(dataPush);
    return Container(
      child: Column(
        children: <Widget>[
          Row(
            children: <Widget>[
              ClipRRect(
                borderRadius: BorderRadius.all(Radius.circular(5)),
                child: Image(
                  image: CachedNetworkImageProvider(widget.noti['pet_picture']),
                  height: 50,
                  fit: BoxFit.cover,
                ),
              ),
              Expanded(
                  child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(
                    '${widget.mensaje} ${thxNoti[Math.Random().nextInt(thxNoti.length)]}'),
              )),
            ],
          ),
          SizedBox(
            height: 10,
          ),
          ClipRRect(
            borderRadius: BorderRadius.all(Radius.circular(5)),
            child: Image(
              image:
                  CachedNetworkImageProvider(widget.noti['notification_image']),
              height: 140,
              width: double.maxFinite,
              fit: BoxFit.cover,
            ),
          ),
          _fnNoti(widget.noti, context),
        ],
      ),
    );
  }

  _fnNoti(noti, context) {
    switch (noti['type']) {
      case "ComingBooking":
        return Row(
          // crossAxisAlignment: CrossAxisAlignment.end,
          mainAxisAlignment: MainAxisAlignment.end,
          children: <Widget>[
            FlatButton(
              child: Text('Omitir'),
              onPressed: () => Navigator.of(context).pop(),
            ),
            FlatButton(
              child: Text('Ir'),
              onPressed: () => Navigator.pushNamed(context, 'navNotifica'),
            ),
          ],
        );
        break;
      case "NextDate":
        {
          // print(noti['options']);
          return Row(
            // crossAxisAlignment: CrossAxisAlignment.end,
            mainAxisAlignment: MainAxisAlignment.end,
            children: <Widget>[
              FlatButton(
                child: Text('Omitir'),
                onPressed: () => Navigator.of(context).pop(),
              ),
              FlatButton(
                child: Text('Ir'),
                onPressed: () => Navigator.pushNamed(context, 'navNotifica'),
                // _fnEstablecimiento(noti['options']['establishment_id']),
              ),
            ],
          );
        }
        break;
      case "Recordatory":
        {
          return Row(
            // crossAxisAlignment: CrossAxisAlignment.end,
            mainAxisAlignment: MainAxisAlignment.end,
            children: <Widget>[
              FlatButton(
                child: Text('Omitir'),
                onPressed: () => Navigator.of(context).pop(),
              ),
              FlatButton(
                child: Text('Ir'),
                onPressed: () => Navigator.pushNamed(context, 'navNotifica'),
                //     Navigator.pushNamed(context, 'navLista', arguments: {
                //   "filtros": [slugNum[noti['options']['slug']]]
                // }),
              ),
            ],
          );
        }
        break;
      default:
        return SizedBox(
          height: 0.0,
        );
        break;
    }
  }

  _fnEstablecimiento(id) async {
    final establecimientoProvider = EstablecimientoProvider();
    Map veterinaria = await establecimientoProvider.getVet(id);
    if (veterinaria['status'] == 200) {
      Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) =>
                VetDetallePage(vet: veterinaria['establishment']),
          ));
    } else {
      showDialog(
          context: context,
          builder: (BuildContext context) {
            return FadeIn(
              child: SimpleDialog(
                contentPadding: EdgeInsets.all(20.0),
                children: <Widget>[
                  SizedBox(height: 10.0),
                  Text(
                      'Lo sentimos, esta veterinaria ya no forma parte de proypet'),
                ],
              ),
            );
          });
    }
  }
}

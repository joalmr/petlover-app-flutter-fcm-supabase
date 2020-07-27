// import 'package:animate_do/animate_do.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
// import 'package:proypet/src/providers/establecimiento_provider.dart';
import 'package:proypet/src/utils/add_msg.dart';
import 'dart:math' as Math;

// import 'package:proypet/src/views/pages/viewVeterinarias/detalleView/vet_detalle_page.dart';

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
    return _fnNoti(widget.noti, context);
  }

  _fnNoti(noti, context) {
    print("== fnNoti ==");
    switch (noti['type']) {
      case "ComingBooking":
        return notificacionAct(Row(
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
        ));
        break;
      case "NextDate":
        return notificacionAct(Row(
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
        ));
        break;
      case "Recordatory":
        return notificacionAct(Row(
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
        ));
        break;
      case "BookingConfirmed":
        return Container(
          height: 210,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(15.0),
            image: DecorationImage(
              fit: BoxFit.cover,
              image: AssetImage('images/fondo1.png'),
            ),
          ),
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 5),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                SizedBox(height: 10),
                Text(widget.noti['message'],
                    style: TextStyle(
                        color: Colors.white, fontWeight: FontWeight.bold)),
                SizedBox(height: 10),
                ClipRRect(
                  borderRadius: BorderRadius.all(Radius.circular(100)),
                  child: Image(
                    image:
                        CachedNetworkImageProvider(widget.noti['pet_picture']),
                    height: 70,
                    fit: BoxFit.cover,
                  ),
                ),
              ],
            ),
          ),
        );
        break;
      case "BookingRescheduled": //reprogramacion
        return Container(
          height: 210,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(15.0),
            image: DecorationImage(
              fit: BoxFit.cover,
              image: AssetImage('images/fondo2.png'),
            ),
          ),
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 5),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                SizedBox(height: 10),
                Text(widget.noti['message'],
                    style: TextStyle(
                        color: Colors.white, fontWeight: FontWeight.bold)),
                SizedBox(height: 10),
                ClipRRect(
                  borderRadius: BorderRadius.all(Radius.circular(100)),
                  child: Image(
                    image:
                        CachedNetworkImageProvider(widget.noti['pet_picture']),
                    height: 70,
                    fit: BoxFit.cover,
                  ),
                ),
              ],
            ),
          ),
        );
        break;
      default:
        return SizedBox(
          height: 0.0,
        );
        break;
    }
  }

  Widget notificacionAct(Widget dataWidget) {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 0, horizontal: 0),
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
                child: Text(
                    '${widget.noti['message']} ${thxNoti[Math.Random().nextInt(thxNoti.length)]}'),
              )),
            ],
          ),
          SizedBox(height: 10),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: ClipRRect(
              borderRadius: BorderRadius.all(Radius.circular(5)),
              child: Image(
                image: CachedNetworkImageProvider(
                    widget.noti['notification_image']),
                height: 140,
                width: double.maxFinite,
                fit: BoxFit.cover,
              ),
            ),
          ),
          dataWidget,
        ],
      ),
    );
  }

  // _fnEstablecimiento(id) async {
  //   final establecimientoProvider = EstablecimientoProvider();
  //   Map veterinaria = await establecimientoProvider.getVet(id);
  //   if (veterinaria['status'] == 200) {
  //     Navigator.push(
  //         context,
  //         MaterialPageRoute(
  //           builder: (context) =>
  //               VetDetallePage(vet: veterinaria['establishment']),
  //         ));
  //   } else {
  //     showDialog(
  //         context: context,
  //         builder: (BuildContext context) {
  //           return FadeIn(
  //             child: SimpleDialog(
  //               contentPadding: EdgeInsets.all(20.0),
  //               children: <Widget>[
  //                 SizedBox(height: 10.0),
  //                 Text(
  //                     'Lo sentimos, esta veterinaria ya no forma parte de proypet'),
  //               ],
  //             ),
  //           );
  //         });
  //   }
  // }

}

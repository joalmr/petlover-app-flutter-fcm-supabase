import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:proypet/src2/controllers/home_controller/home_controller.dart';
import 'dart:math' as Math;

import 'package:proypet/src2/utils/add_msg.dart';

class BuildPushNoti extends StatelessWidget {
  final dynamic noti;
  final String mensaje;
  BuildPushNoti({@required this.noti, @required this.mensaje});

  final homeC = Get.find<HomeController>();

  @override
  Widget build(BuildContext context) {
    return _fnNoti(noti, context);
  }

  _fnNoti(noti, context) {
    // print("== fnNoti ==");
    switch (noti['type']) {
      case "Marketing":
        return notificacionOther();
        break;
      case "ComingBooking":
        return notificacionAct(Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: <Widget>[
            FlatButton(
              child: Text('Omitir'),
              onPressed: () => Get.back(),
            ),
            FlatButton(
                child: Text('Ir'),
                onPressed: () {
                  Get.back();
                  Get.toNamed('navNotifica');
                }),
          ],
        ));
        break;
      case "NextDate":
        return notificacionAct(Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: <Widget>[
            FlatButton(
              child: Text('Omitir'),
              onPressed: () => Get.back(),
            ),
            FlatButton(
              child: Text('Ir'),
              onPressed: () {
                Get.back();
                Get.toNamed('navNotifica');
              },
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
              onPressed: () => Get.back(),
            ),
            FlatButton(
                child: Text('Ir'),
                onPressed: () {
                  Get.back();
                  Get.toNamed('navNotifica');
                }),
          ],
        ));
        break;
      case "BookingConfirmed":
        {
          homeC.getSummary();
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
                  Text(noti['message'], style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold)),
                  SizedBox(height: 10),
                  ClipRRect(
                    borderRadius: BorderRadius.all(Radius.circular(100)),
                    child: Image(
                      image: CachedNetworkImageProvider(noti['pet_picture']),
                      height: 70,
                      fit: BoxFit.cover,
                    ),
                  ),
                ],
              ),
            ),
          );
        }
        break;
      case "BookingRescheduled":
        {
          homeC.getSummary();
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
                  Text(noti['message'], style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold)),
                  SizedBox(height: 10),
                  ClipRRect(
                    borderRadius: BorderRadius.all(Radius.circular(100)),
                    child: Image(
                      image: CachedNetworkImageProvider(noti['pet_picture']),
                      height: 70,
                      fit: BoxFit.cover,
                    ),
                  ),
                ],
              ),
            ),
          );
        } //reprogramacion
        break;
      default:
        return SizedBox(height: 0.0);
        break;
    }
  }

  Widget notificacionOther() {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 0, horizontal: 5),
      child: Column(
        children: <Widget>[
          Row(
            children: <Widget>[
              ClipRRect(
                borderRadius: BorderRadius.all(Radius.circular(5)),
                child: Image(
                  image: CachedNetworkImageProvider(noti['pet_picture']),
                  height: 65,
                  fit: BoxFit.cover,
                ),
              ),
              Expanded(
                  child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(noti['message']),
              )),
            ],
          ),
          SizedBox(height: 10),
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: <Widget>[
              FlatButton(
                child: Text('Omitir'),
                onPressed: () => Get.back(),
              ),
            ],
          )
        ],
      ),
    );
  }

  Widget notificacionAct(Widget dataWidget) {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 0, horizontal: 5),
      child: Column(
        children: <Widget>[
          Row(
            children: <Widget>[
              ClipRRect(
                borderRadius: BorderRadius.all(Radius.circular(5)),
                child: Image(
                  image: CachedNetworkImageProvider(noti['pet_picture']),
                  height: 65,
                  fit: BoxFit.cover,
                ),
              ),
              Expanded(
                  child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text('${noti['message']} ${thxNoti[Math.Random().nextInt(thxNoti.length)]}'),
              )),
            ],
          ),
          SizedBox(height: 10),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: ClipRRect(
              borderRadius: BorderRadius.all(Radius.circular(5)),
              child: Image(
                image: CachedNetworkImageProvider(noti['notification_image']),
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
}
// class BuildPushNoti extends StatefulWidget {
//   // const BuildPushNoti({Key key}) : super(key: key);
//   final dynamic noti;
//   final String mensaje;
//   BuildPushNoti({@required this.noti, @required this.mensaje});

//   @override
//   _BuildPushNotiState createState() => _BuildPushNotiState();
// }

// class _BuildPushNotiState extends State<BuildPushNoti> {
//   @override
//   Widget build(BuildContext context) {
//     return _fnNoti(widget.noti, context);
//   }

//   _fnNoti(noti, context) {
//     // print("== fnNoti ==");
//     switch (noti['type']) {
//       case "Marketing":
//         return notificacionOther();
//         break;
//       case "ComingBooking":
//         return notificacionAct(Row(
//           mainAxisAlignment: MainAxisAlignment.end,
//           children: <Widget>[
//             FlatButton(
//               child: Text('Omitir'),
//               onPressed: () => Get.back(),
//             ),
//             FlatButton(
//                 child: Text('Ir'),
//                 onPressed: () {
//                   Get.back();
//                   Get.toNamed('navNotifica');
//                 }),
//           ],
//         ));
//         break;
//       case "NextDate":
//         return notificacionAct(Row(
//           mainAxisAlignment: MainAxisAlignment.end,
//           children: <Widget>[
//             FlatButton(
//               child: Text('Omitir'),
//               onPressed: () => Get.back(),
//             ),
//             FlatButton(
//               child: Text('Ir'),
//               onPressed: () {
//                 Get.back();
//                 Get.toNamed('navNotifica');
//               },
//             ),
//           ],
//         ));
//         break;
//       case "Recordatory":
//         return notificacionAct(Row(
//           mainAxisAlignment: MainAxisAlignment.end,
//           children: <Widget>[
//             FlatButton(
//               child: Text('Omitir'),
//               onPressed: () => Get.back(),
//             ),
//             FlatButton(
//                 child: Text('Ir'),
//                 onPressed: () {
//                   Get.back();
//                   Get.toNamed('navNotifica');
//                 }),
//           ],
//         ));
//         break;
//       case "BookingConfirmed":
//         return Container(
//           height: 210,
//           decoration: BoxDecoration(
//             borderRadius: BorderRadius.circular(15.0),
//             image: DecorationImage(
//               fit: BoxFit.cover,
//               image: AssetImage('images/fondo1.png'),
//             ),
//           ),
//           child: Padding(
//             padding: const EdgeInsets.symmetric(horizontal: 5),
//             child: Column(
//               mainAxisAlignment: MainAxisAlignment.center,
//               crossAxisAlignment: CrossAxisAlignment.center,
//               children: <Widget>[
//                 SizedBox(height: 10),
//                 Text(widget.noti['message'], style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold)),
//                 SizedBox(height: 10),
//                 ClipRRect(
//                   borderRadius: BorderRadius.all(Radius.circular(100)),
//                   child: Image(
//                     image: CachedNetworkImageProvider(widget.noti['pet_picture']),
//                     height: 70,
//                     fit: BoxFit.cover,
//                   ),
//                 ),
//               ],
//             ),
//           ),
//         );
//         break;
//       case "BookingRescheduled": //reprogramacion
//         return Container(
//           height: 210,
//           decoration: BoxDecoration(
//             borderRadius: BorderRadius.circular(15.0),
//             image: DecorationImage(
//               fit: BoxFit.cover,
//               image: AssetImage('images/fondo2.png'),
//             ),
//           ),
//           child: Padding(
//             padding: const EdgeInsets.symmetric(horizontal: 5),
//             child: Column(
//               mainAxisAlignment: MainAxisAlignment.center,
//               crossAxisAlignment: CrossAxisAlignment.center,
//               children: <Widget>[
//                 SizedBox(height: 10),
//                 Text(widget.noti['message'], style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold)),
//                 SizedBox(height: 10),
//                 ClipRRect(
//                   borderRadius: BorderRadius.all(Radius.circular(100)),
//                   child: Image(
//                     image: CachedNetworkImageProvider(widget.noti['pet_picture']),
//                     height: 70,
//                     fit: BoxFit.cover,
//                   ),
//                 ),
//               ],
//             ),
//           ),
//         );
//         break;
//       default:
//         return SizedBox(height: 0.0);
//         break;
//     }
//   }

//   Widget notificacionOther() {
//     return Container(
//       padding: EdgeInsets.symmetric(vertical: 0, horizontal: 5),
//       child: Column(
//         children: <Widget>[
//           Row(
//             children: <Widget>[
//               ClipRRect(
//                 borderRadius: BorderRadius.all(Radius.circular(5)),
//                 child: Image(
//                   image: CachedNetworkImageProvider(widget.noti['pet_picture']),
//                   height: 65,
//                   fit: BoxFit.cover,
//                 ),
//               ),
//               Expanded(
//                   child: Padding(
//                 padding: const EdgeInsets.all(8.0),
//                 child: Text(widget.noti['message']),
//               )),
//             ],
//           ),
//           SizedBox(height: 10),
//           Row(
//             mainAxisAlignment: MainAxisAlignment.end,
//             children: <Widget>[
//               FlatButton(
//                 child: Text('Omitir'),
//                 onPressed: () => Get.back(),
//               ),
//             ],
//           )
//         ],
//       ),
//     );
//   }

//   Widget notificacionAct(Widget dataWidget) {
//     return Container(
//       padding: EdgeInsets.symmetric(vertical: 0, horizontal: 5),
//       child: Column(
//         children: <Widget>[
//           Row(
//             children: <Widget>[
//               ClipRRect(
//                 borderRadius: BorderRadius.all(Radius.circular(5)),
//                 child: Image(
//                   image: CachedNetworkImageProvider(widget.noti['pet_picture']),
//                   height: 65,
//                   fit: BoxFit.cover,
//                 ),
//               ),
//               Expanded(
//                   child: Padding(
//                 padding: const EdgeInsets.all(8.0),
//                 child: Text('${widget.noti['message']} ${thxNoti[Math.Random().nextInt(thxNoti.length)]}'),
//               )),
//             ],
//           ),
//           SizedBox(height: 10),
//           Padding(
//             padding: const EdgeInsets.all(8.0),
//             child: ClipRRect(
//               borderRadius: BorderRadius.all(Radius.circular(5)),
//               child: Image(
//                 image: CachedNetworkImageProvider(widget.noti['notification_image']),
//                 height: 140,
//                 width: double.maxFinite,
//                 fit: BoxFit.cover,
//               ),
//             ),
//           ),
//           dataWidget,
//         ],
//       ),
//     );
//   }
// }

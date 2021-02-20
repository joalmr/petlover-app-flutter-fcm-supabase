import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:proypet/utils/add_msg.dart';
import 'dart:math' as Math;

Widget proximaCita(noti) {
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
              child: Text(
                  '${noti['message']} ${thxNoti[Math.Random().nextInt(thxNoti.length)]}'),
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
        Row(
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
        ),
      ],
    ),
  );
}

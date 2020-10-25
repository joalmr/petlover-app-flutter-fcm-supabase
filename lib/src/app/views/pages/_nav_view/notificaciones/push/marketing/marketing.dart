import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:proypet/src/app/styles/styles.dart';

Widget marketing(noti) {
  return Container(
    padding: EdgeInsets.symmetric(vertical: 0, horizontal: 5),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.start,
      children: <Widget>[
        Divider(
          color: colorMain,
          height: 2,
          indent: 5,
          endIndent: 5,
          thickness: 10,
        ),
        Padding(
          padding: const EdgeInsets.only(left: 9, right: 9, top: 9, bottom: 5),
          child: Text(
            noti['title'],
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(left: 9, right: 9, top: 5, bottom: 5),
          child: Text(noti['message']),
        ),
        SizedBox(height: 5.0),
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
        SizedBox(height: 5.0),
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

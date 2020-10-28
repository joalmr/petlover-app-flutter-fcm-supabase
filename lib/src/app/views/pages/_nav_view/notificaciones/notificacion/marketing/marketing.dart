import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:proypet/src/app/styles/styles.dart';
import 'package:proypet/src/data/models/model/notificacion/notificacion_model.dart';

Widget marketing(Notificacion noti) {
  return Container(
    margin: EdgeInsets.symmetric(vertical: 10.0, horizontal: 10.0),
    child: InkWell(
        onTap: () {},
        child: Card(
          child: Column(
            children: <Widget>[
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.only(left: 10, right: 10, top: 0, bottom: 2.5),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Container(
                            height: 5,
                            width: 20,
                            color: colorMain,
                          ),
                          Padding(
                            padding: const EdgeInsets.only(top: 2.5),
                            child: Text(
                              noti.options['title'],
                              style: TextStyle(fontWeight: FontWeight.bold),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(top: 2.5),
                            child: Text(noti.message),
                          ),
                        ],
                      ),
                    ),
                  )
                ],
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: ClipRRect(
                  borderRadius: BorderRadius.all(Radius.circular(10)),
                  child: AspectRatio(
                    aspectRatio: 3 / 2,
                    child: (noti.notificationImg.isNotEmpty)
                        ? CachedNetworkImage(
                            useOldImageOnUrlChange: false,
                            imageUrl: noti.notificationImg,
                            fit: BoxFit.cover,
                            placeholder: (context, text) => Container(height: 200, width: double.maxFinite, child: Center(child: CupertinoActivityIndicator())),
                          )
                        : Image.asset('images/logo-proypet.png'),
                  ),
                ),
              ),
            ],
          ),
        )),
  );
}

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:proypet/src/model/notificacion/notificacion_model.dart';


Widget buildNoti(Notificacion noti){
  return Container(
    margin: EdgeInsets.symmetric(vertical: 10.0,horizontal: 20.0),
    child: InkWell(
      onTap: (){},
      child: Card(
        child:
        Column(
          children: <Widget>[
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                ClipRRect(
                  borderRadius: BorderRadius.only(topLeft: Radius.circular(10)),
                  child: Image(
                    image: CachedNetworkImageProvider(noti.petPicture),
                    height: 100,
                    fit: BoxFit.cover,
                  ),
                ),
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: Text(noti.message),
                  )
                )
              ],
            ),
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: ClipRRect(
                borderRadius: BorderRadius.all(Radius.circular(10)),
                child: Image(
                  image: AssetImage('images/noti1.jpg'), //CachedNetworkImageProvider(noti.petPicture),
                  height: 200,
                  width: double.infinity,
                  fit: BoxFit.cover,
                ),
              ),
            ),
          ],
        ),
      )
    ),
  );
}

  
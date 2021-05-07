import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

Widget cardFrecuente({
  @required Function onTap,
  @required String rootImg,
  @required String title,
  String subtitle,
  Color color = Colors.black,
  @required bool urlImg,
  bool alone = false,
}) {
  return InkWell(
    borderRadius: BorderRadius.circular(15.0),
    onTap: onTap,
    child: Stack(
      children: <Widget>[
        Container(
          width: alone ? double.maxFinite : 120.0,
          height: 100.0,
          padding: EdgeInsets.all(15.0),
          foregroundDecoration: BoxDecoration(
            color: color.withOpacity(0.5),
            borderRadius: BorderRadius.circular(15.0),
          ),
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(15.0),
              image: DecorationImage(
                fit: BoxFit.cover,
                image: urlImg ? CachedNetworkImageProvider(rootImg) : AssetImage(rootImg),
              )),
        ),
        Container(
          width: alone ? double.maxFinite : 120.0,
          height: 100.0,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              Text(
                title, 
                textAlign: TextAlign.center,
                style: TextStyle(color: Colors.white),
              ),
              subtitle != null
                  ? Text(
                      subtitle,
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 10,
                      ),
                    )
                  : SizedBox(height: 0),
            ],
          ),
        )
      ],
    ),
  );
}

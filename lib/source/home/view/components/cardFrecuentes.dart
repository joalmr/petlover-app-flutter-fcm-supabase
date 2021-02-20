import 'package:flutter/material.dart';

Widget cardFrecuente({
  @required Function onTap,
  @required String rootImg,
  @required String title,
  String subtitle,
}) {
  return InkWell(
    borderRadius: BorderRadius.circular(15.0),
    onTap: onTap,
    child: Stack(
      children: <Widget>[
        Container(
          width: 120.0,
          height: 100.0,
          padding: EdgeInsets.all(15.0),
          foregroundDecoration: BoxDecoration(
            color: Colors.red.withOpacity(0.5),
            borderRadius: BorderRadius.circular(15.0),
          ),
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(15.0),
              image: DecorationImage(
                fit: BoxFit.cover,
                image: AssetImage(rootImg),
              )),
        ),
        Container(
          width: 120.0,
          height: 100.0,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              Text(title, style: TextStyle(color: Colors.white)),
              subtitle != null
                  ? Text(
                      subtitle,
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

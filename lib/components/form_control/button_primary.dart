import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:proypet/design/styles/styles.dart';

final _textstyle = TextStyle(fontSize: 14.0, fontWeight: FontWeight.bold);

Widget btnWIcon({
  IconData icono,
  String pathImage = "",
  @required String texto,
  @required funtion,
  @required Color color,
  Color colorText = Colors.white,
  Color colorIcon = Colors.white,
}) {
  return SizedBox(
    width: double.maxFinite,
    child: RaisedButton(
      shape: shape10,
      color: color,
      elevation: 2.0,
      textColor: Colors.white,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          SizedBox(
            child: pathImage == ""
                ? Icon(
                    icono,
                    size: 22,
                    color: colorIcon,
                  )
                : Image.asset(
                    pathImage,
                    height: 22,
                  ),
          ),
          SizedBox(
            width: Get.width * 0.105,
          ),
          Expanded(
            child: Container(
              child: Text(
                texto,
                style: _textstyle.copyWith(color: colorText),
              ),
            ),
          ),
        ],
      ),
      padding: EdgeInsets.only(top: 9, bottom: 9, left: 45),
      onPressed: funtion,
    ),
  );
}

Widget btnFace({@required text, @required funtion}) {
  return SizedBox(
    width: double.maxFinite,
    child: RaisedButton(
      shape: shape10,
      color: Color(0xFF3b5998),
      elevation: 2.0,
      textColor: Colors.white,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Icon(
            FontAwesomeIcons.facebook,
            size: 22,
          ),
          SizedBox(width: 10),
          Text(text, style: _textstyle),
        ],
      ),
      padding: EdgeInsets.symmetric(vertical: 9.0, horizontal: 20.0),
      onPressed: funtion,
    ),
  );
}

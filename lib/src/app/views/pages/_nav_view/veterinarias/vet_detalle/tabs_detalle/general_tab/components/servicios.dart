import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:proypet/src/data/models/model/establecimiento/establecimiento_model.dart';
import 'package:proypet/src/utils/icons_map.dart';

Widget servicios(List<Service> servicios) {
  return SizedBox(
    height: 60,
    child: ListView.builder(
      shrinkWrap: true,
      scrollDirection: Axis.horizontal,
      itemCount: servicios.length,
      itemBuilder: (BuildContext context, int index) => _icoServicio(servicios[index].slug, servicios[index].name),
    ),
  );
}

Widget _icoServicio(String icon, String nombre) {
  return Padding(
    padding: const EdgeInsets.symmetric(horizontal: 8.5),
    child: Column(
      children: <Widget>[
        SizedBox(
          height: 5,
        ),
        Container(
            height: 32,
            width: 32,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(5.0),
              color: Get.theme.backgroundColor, //Colors.white,
              boxShadow: [BoxShadow(color: Colors.black.withOpacity(0.1), blurRadius: 3.0, spreadRadius: 2.0)],
            ),
            child: Padding(
              padding: const EdgeInsets.all(5.0),
              child: Tooltip(
                child: Icon(iconMap[icon], size: 20, color: Get.textTheme.subtitle2.color),
                message: nombre,
              ),
            )),
        SizedBox(height: 5),
        Text(
          (nombre.length > 9) ? '${nombre.substring(0, 9)}..' : nombre,
          style: TextStyle(fontWeight: FontWeight.w300, fontSize: 8.0),
        )
      ],
    ),
  );
}

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:proypet/src/app/styles/styles.dart';
import 'package:proypet/src/utils/icons_map.dart';

listarChip(dynamic chips) {
  if (chips != null) {
    return SliverToBoxAdapter(
      child: SizedBox(
        height: 35.0,
        child: SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          padding: EdgeInsets.symmetric(horizontal: 20.0),
          child: ListView.builder(
            shrinkWrap: true,
            scrollDirection: Axis.horizontal,
            itemCount: chips.length,
            itemBuilder: (BuildContext context, int index) => chip(chips[index]),
          ),
        ),
      ),
    );
  } else {
    return SliverToBoxAdapter(
      child: SizedBox(height: 0.0),
    );
  }
}

chip(int servicio) {
  return Padding(
    padding: const EdgeInsets.symmetric(
      horizontal: 5.0,
    ),
    child: Chip(
      labelStyle: TextStyle(fontSize: sizeSmallx2, color: Colors.black54),
      labelPadding: EdgeInsets.only(left: 5.0, right: 2.5),
      avatar: CircleAvatar(
        radius: 12.5,
        backgroundColor: colorMain,
        child: Icon(iconNum[servicio], size: sizeSmallx1, color: Colors.white),
      ),
      label: Text(textMap[servicio], style: TextStyle(color: Get.textTheme.subtitle2.color)),
    ),
  );
}

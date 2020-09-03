import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:proypet/src/utils/calcula_edad.dart';

datoMascota(pet) {
  return Padding(
    padding: const EdgeInsets.symmetric(horizontal: 20),
    child: Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: <Widget>[
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Text(pet.name, style: Get.textTheme.headline6.copyWith(fontWeight: FontWeight.w900)),
            Text(pet.breedName, style: Get.textTheme.subtitle1.copyWith(fontWeight: FontWeight.bold)),
            (pet.status != 0) ? Text(calculateAge(DateTime.parse(pet.birthdate)), style: Get.textTheme.subtitle2) : SizedBox(height: 0)
          ],
        ),
        Column(
          children: <Widget>[
            Text('${pet.weight} kg.', style: Get.textTheme.subtitle1.apply(fontWeightDelta: 2)),
            (pet.status == 0)
                ? Text('Fallecido', style: Get.textTheme.subtitle2.apply(fontWeightDelta: 2).copyWith(fontStyle: FontStyle.italic))
                : SizedBox(height: 0)
          ],
        )
      ],
    ),
  );
}

import 'package:datetime_picker_formfield/datetime_picker_formfield.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/state_manager.dart';
import 'package:proypet/src/app/styles/styles.dart';

import '../../reserva_vet_controller.dart';

Widget crearFecha(BuildContext context) {
  return GetBuilder<ReservaVetController>(builder: (_) {
    return DateTimeField(
      initialValue: DateTime.now(),
      format: _.format,
      onChanged: (dt) => _.fecha = _.format.format(dt),
      enableInteractiveSelection: false,
      cursorColor: colorMain,
      onShowPicker: (context, currentValue) {
        return showDatePicker(
          context: context,
          initialDate: currentValue ?? DateTime.now(),
          firstDate: DateTime
              .now(), //new DateTime(DateTime.now().year, DateTime.now().month, DateTime.now().day),
          lastDate: DateTime.now().add(new Duration(
              days:
                  365)), //new DateTime(DateTime.now().year + 1, DateTime.now().month, DateTime.now().day),
          initialDatePickerMode: DatePickerMode.day,
          builder: (context, child) => Theme(
              data: ThemeData.light().copyWith(
                  accentColor: colorMain,
                  colorScheme: ColorScheme.light(
                    primary: colorMain,
                    onPrimary: Colors.white,
                    surface: colorMain,
                    onSurface: Get.textTheme.subtitle2.color,
                  ),
                  dialogBackgroundColor: Theme.of(context).backgroundColor,
                  buttonTheme:
                      ButtonThemeData(textTheme: ButtonTextTheme.primary)),
              child: child),
        );
      },
      decoration: InputDecoration(
        hintText: 'Fecha de nacimiento',
        prefixIcon: Icon(Icons.calendar_today, color: colorMain),
        suffixIcon: Icon(null),
      ),
    );
  });
}

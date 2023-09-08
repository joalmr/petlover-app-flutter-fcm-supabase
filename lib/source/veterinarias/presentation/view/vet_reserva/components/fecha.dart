import 'package:datetime_picker_formfield/datetime_picker_formfield.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:proypet/design/styles/styles.dart';
import 'package:proypet/source/veterinarias/domain/controller/reserva_vet_controller.dart';

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
          firstDate: DateTime.now(),
          lastDate: DateTime.now().add(new Duration(days: 365)),
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

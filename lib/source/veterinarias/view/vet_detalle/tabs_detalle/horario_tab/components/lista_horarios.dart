import 'package:flutter/material.dart';

import 'horario.dart';

Widget listHorario(horario) {
  return Padding(
    padding: const EdgeInsets.symmetric(vertical: 10.0),
    child: Column(
      children: <Widget>[
        (horario["monday"]["attention"] == "on")
            ? horarioW(
                'Lunes',
                horario["monday"]["time_start"],
                horario["monday"]["time_end"],
              )
            : SizedBox(
                width: 0,
                height: 0,
              ),
        (horario["tuesday"]["attention"] == "on")
            ? horarioW(
                'Martes',
                horario["tuesday"]["time_start"],
                horario["tuesday"]["time_end"],
              )
            : SizedBox(
                width: 0,
                height: 0,
              ),
        (horario["wednesday"]["attention"] == "on")
            ? horarioW(
                'Miércoles',
                horario["wednesday"]["time_start"],
                horario["wednesday"]["time_end"],
              )
            : SizedBox(
                width: 0,
                height: 0,
              ),
        (horario["thursday"]["attention"] == "on")
            ? horarioW(
                'Jueves',
                horario["thursday"]["time_start"],
                horario["thursday"]["time_end"],
              )
            : SizedBox(
                width: 0,
                height: 0,
              ),
        (horario["friday"]["attention"] == "on")
            ? horarioW(
                'Viernes',
                horario["friday"]["time_start"],
                horario["friday"]["time_end"],
              )
            : SizedBox(
                width: 0,
                height: 0,
              ),
        (horario["saturday"]["attention"] == "on")
            ? horarioW(
                'Sábado',
                horario["saturday"]["time_start"],
                horario["saturday"]["time_end"],
              )
            : SizedBox(
                width: 0,
                height: 0,
              ),
        (horario["sunday"]["attention"] == "on")
            ? horarioW(
                'Domingo',
                horario["sunday"]["time_start"],
                horario["sunday"]["time_end"],
              )
            : SizedBox(
                width: 0,
                height: 0,
              ),
      ],
    ),
  );
}

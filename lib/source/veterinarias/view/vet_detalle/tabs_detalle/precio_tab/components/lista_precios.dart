import 'package:flutter/material.dart';
import 'package:proypet/source/veterinarias/view/vet_detalle/tabs_detalle/precio_tab/components/precio.dart';

Widget listaPrecio(precios) {
  return Column(
    children: <Widget>[
      SizedBox(height: 10.0),
      Wrap(
        children: [
          precio(
            "Consulta",
            precios["consultation"]["from"] == null
                ? ""
                : precios["consultation"]["from"],
            precios["consultation"]["to"] == null
                ? ""
                : precios["consultation"]["to"],
          ),
          precio(
            "Vacunas",
            precios["vaccination"]["from"] == null
                ? ""
                : precios["vaccination"]["from"],
            precios["vaccination"]["to"] == null
                ? ""
                : precios["vaccination"]["to"],
          ),
          precio(
            "Baños",
            precios["grooming"]["from"] == null
                ? ""
                : precios["grooming"]["from"],
            precios["grooming"]["to"] == null ? "" : precios["grooming"]["to"],
          ),
          precio(
            "Desparasitación",
            precios["deworming"]["from"] == null
                ? ""
                : precios["deworming"]["from"],
            precios["deworming"]["to"] == null
                ? ""
                : precios["deworming"]["to"],
          ),
        ],
      ),
    ],
  );
}

import 'package:flutter/material.dart';
import 'package:proypet/src2/data/models/update/mascota/pet_model.dart';

class DataReserva extends StatelessWidget {
  // const DataReserva({Key key}) : super(key: key);
  final String establecimientoID;
  final String establecimientoName;
  final List<MascotaModel2> misMascotas;
  final String mascotaID;
  final bool delivery;
  DataReserva(
      {@required this.establecimientoID, @required this.misMascotas, @required this.mascotaID, @required this.establecimientoName, @required this.delivery});

  @override
  Widget build(BuildContext context) {
    return Scaffold();
  }
}

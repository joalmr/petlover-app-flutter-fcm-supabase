import 'package:flutter/material.dart';

import '../reserva_modal.dart';

class Modal{
  mainModal(BuildContext context){
    showModalBottomSheet(
      context: context,
      builder: (BuildContext context){
        return SingleChildScrollView(
          child: Column(
            children: <Widget>[
              ModalDataReserva()
            ],
          ),
        );
      }
    );
  }
}


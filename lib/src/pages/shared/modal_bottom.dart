import 'package:flutter/material.dart';


class Modal{

  mainModal(BuildContext context, _funtion){
    showModalBottomSheet(
      context: context,
      isDismissible: false,
      builder: (BuildContext context){
        return SingleChildScrollView(
          child: Column(
            children: <Widget>[
              _funtion
              //
            ],
          ),
        );
      }
    );
  }

}


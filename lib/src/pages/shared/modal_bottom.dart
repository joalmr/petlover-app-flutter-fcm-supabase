import 'package:flutter/material.dart';


class Modal{

  mainModal(BuildContext context, _funtion){
    showModalBottomSheet(
      context: context,
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


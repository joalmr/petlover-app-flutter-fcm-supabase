import 'package:flutter/material.dart';

mainModal(BuildContext context, _widgets) {
  showModalBottomSheet(
      context: context,
      isDismissible: false,
      builder: (BuildContext context) {
        return SingleChildScrollView(
          child: Column(
            children: <Widget>[_widgets],
          ),
        );
      });
}

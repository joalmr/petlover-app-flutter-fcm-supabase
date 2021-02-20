import 'package:flutter/material.dart';
import 'package:proypet/design/styles/styles.dart';

Widget textfieldArea(
    _inputController, String _hinttext, _maxLength, _maxLines) {
  return TextField(
    enableInteractiveSelection: false,
    controller: _inputController,
    textCapitalization: TextCapitalization.sentences,
    maxLength: _maxLength,
    maxLines: _maxLines,
    keyboardType: TextInputType.multiline,
    cursorColor: colorMain,
    decoration: InputDecoration(hintText: _hinttext),
  );
}

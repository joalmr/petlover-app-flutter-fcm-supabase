import 'package:flutter/material.dart';
import 'package:proypet/src/styles/styles.dart';

final _shape = BorderRadius.circular(10.0);

class FormularioText extends StatelessWidget {
  final hintText;
  final icon;
  final obscureText;
  final onSaved;
  final textCap;
  final valorInicial;
  final boardType;

  FormularioText({this.hintText, this.icon, this.obscureText, this.onSaved, this.textCap, this.valorInicial, this.boardType});

  @override
  Widget build(BuildContext context) {
    return Material(
      elevation: 0.0,
      borderRadius: _shape,
      color: Colors.grey[200],
      child: TextFormField(
        keyboardType: boardType,
        initialValue: valorInicial,
        textCapitalization: textCap,
        obscureText: obscureText,
        onSaved: onSaved,
        cursorColor: colorMain,
        decoration: InputDecoration(
          hintText: hintText,
          hintStyle: TextStyle(fontSize: 14.0),
          prefixIcon: Material(
            borderRadius: _shape,
            color: Colors.grey[200],
            child: Icon(
              icon,
              color: colorMain,
            ),
          ),
          border: InputBorder.none,
          contentPadding: EdgeInsets.symmetric(horizontal: 12.0, vertical: 12.0)
        ),
      ),
    );
  }
}





Widget textForm(String _hinttext, _icon,bool _obscuretext, _onsaved,TextCapitalization _textCap,String _valorInicial,TextInputType _boardType){
  return Material(
    elevation: 0.0,
    borderRadius: _shape,
    color: Colors.grey[200],
    child: TextFormField(
      keyboardType: _boardType,
      initialValue: _valorInicial,
      textCapitalization: _textCap,
      obscureText: _obscuretext,
      onSaved: _onsaved,
      cursorColor: colorMain,
      decoration: InputDecoration(
        hintText: _hinttext,
        hintStyle: TextStyle(fontSize: 14.0),
        prefixIcon: Material(
          borderRadius: _shape,
          color: Colors.grey[200],
          child: Icon(
            _icon,
            color: colorMain,
          ),
        ),
        border: InputBorder.none,
        contentPadding: EdgeInsets.symmetric(horizontal: 12.0, vertical: 12.0)
      ),
    ),
  );
}

Widget textFormLess(String _hinttext, _onsaved){
  return Material(
    elevation: 0.0,
    borderRadius: _shape,
    color: Colors.grey[200],
    child: TextFormField(
      textCapitalization: TextCapitalization.sentences,
      onSaved: _onsaved,
      cursorColor: colorMain,
      decoration: InputDecoration(
        hintText: _hinttext,
        hintStyle: TextStyle(fontSize: 14.0),
        border: InputBorder.none,
        contentPadding: EdgeInsets.symmetric(horizontal: 12.0, vertical: 12.0),
      ),
    ),
  );
}

Widget textArea(String _hinttext, _icon,bool _obscuretext, _onsaved,TextCapitalization _textCap,String _valorInicial){
  return Material(
    elevation: 0.0,
    borderRadius: _shape,
    color: Colors.grey[200],
    child: TextFormField(
      initialValue: _valorInicial,
      textCapitalization: _textCap,
      obscureText: _obscuretext,
      onSaved: _onsaved,
      cursorColor: colorMain,
      maxLines: null,
      keyboardType: TextInputType.multiline,
      decoration: InputDecoration(
        hintText: _hinttext,
        hintStyle: TextStyle(fontSize: 14.0),
        border: InputBorder.none,
        contentPadding: EdgeInsets.symmetric(horizontal: 12.0, vertical: 12.0),
      ),
    ),
  );
}

Widget textBtn(_hinttext, _icon, _funtion){
    return Material(
    elevation: 0.0,
    borderRadius: _shape,
    color: Colors.grey[200],
    child: TextFormField(
      textCapitalization: TextCapitalization.sentences,
      onSaved: _funtion,
      cursorColor: colorMain,
      decoration: InputDecoration(
        hintText: _hinttext,
        hintStyle: TextStyle(fontSize: 14.0),
        border: InputBorder.none,
        contentPadding: EdgeInsets.symmetric(horizontal: 12.0, vertical: 12.0),
        suffixIcon: Container(
          child: IconButton(onPressed: _funtion, icon: _icon,color: colorMain,tooltip: 'Buscar'))
      ),
    ),
  );
}
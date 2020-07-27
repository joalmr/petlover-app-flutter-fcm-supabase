import 'package:flutter/material.dart';
import 'package:proypet/src/styles/styles.dart';

// final _shape = BorderRadius.circular(10.0);

class FormularioText extends StatefulWidget {
  final String labelText;
  final String hintText;
  final IconData icon;
  final iconSuf;
  final obscureText;
  final Function onSaved;
  final TextCapitalization textCap;
  final String valorInicial;
  final TextInputType boardType;

  FormularioText(
      {this.labelText,
      this.hintText,
      this.icon,
      this.iconSuf,
      this.obscureText,
      this.onSaved,
      this.textCap,
      this.valorInicial,
      this.boardType});

  @override
  _FormularioTextState createState() => _FormularioTextState(
        labelText: labelText,
        hintText: hintText,
        icon: icon,
        iconSuf: iconSuf,
        obscureText: obscureText,
        onSaved: onSaved,
        textCap: textCap,
        valorInicial: valorInicial,
        boardType: boardType,
      );
}

class _FormularioTextState extends State<FormularioText> {
  String labelText;
  String hintText;
  IconData icon;
  dynamic iconSuf;
  bool obscureText;
  Function onSaved;
  TextCapitalization textCap;
  String valorInicial;
  TextInputType boardType;

  _FormularioTextState({
    this.labelText,
    this.hintText,
    this.icon,
    this.iconSuf,
    this.obscureText,
    this.onSaved,
    this.textCap,
    this.valorInicial,
    this.boardType,
  });
  @override
  Widget build(BuildContext context) {
    return (labelText == null)
        ? Padding(
            padding: const EdgeInsets.only(top: 10, bottom: 10),
            child: TextFormField(
              keyboardType: boardType,
              initialValue: valorInicial,
              textCapitalization: textCap,
              obscureText: obscureText,
              onSaved: onSaved,
              cursorColor: colorMain,
              decoration: InputDecoration(
                hintText: hintText,
                prefixIcon: (icon != null)
                    ? Icon(
                        icon,
                        color: colorMain,
                      )
                    : null,
                suffixIcon: (iconSuf != null && iconSuf == Icons.remove_red_eye)
                    ? Container(
                        child: IconButton(
                            icon: Icon(iconSuf,
                                color: obscureText
                                    ? Theme.of(context)
                                        .textTheme
                                        .subtitle2
                                        .color
                                    : colorMain),
                            onPressed: () {
                              obscureText
                                  ? setState(() {
                                      obscureText = false;
                                    })
                                  : setState(() {
                                      obscureText = true;
                                    });
                            }))
                    : null,
              ),
            ),
          )
        : Padding(
            padding: const EdgeInsets.only(top: 10, bottom: 10),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Text(labelText),
                SizedBox(height: 7.5),
                TextFormField(
                  keyboardType: boardType,
                  initialValue: valorInicial,
                  textCapitalization: textCap,
                  obscureText: obscureText,
                  onSaved: onSaved,
                  cursorColor: colorMain,
                  decoration: InputDecoration(
                    hintText: hintText,
                    prefixIcon: (icon != null)
                        ? Icon(
                            icon,
                            color: colorMain,
                          )
                        : null,
                    suffixIcon:
                        (iconSuf != null && iconSuf == Icons.remove_red_eye)
                            ? Container(
                                child: IconButton(
                                    icon: Icon(iconSuf,
                                        color: obscureText
                                            ? Theme.of(context)
                                                .textTheme
                                                .subtitle2
                                                .color
                                            : colorMain),
                                    onPressed: () {
                                      obscureText
                                          ? setState(() {
                                              obscureText = false;
                                            })
                                          : setState(() {
                                              obscureText = true;
                                            });
                                    }))
                            : null,
                  ),
                ),
              ],
            ),
          );
  }
}

// Widget textForm(String _hinttext, _icon,
//   bool _obscuretext, _onsaved,TextCapitalization _textCap,
//   String _valorInicial,TextInputType _boardType){
//   return Material(
//     elevation: 0.0,
//     borderRadius: _shape,
//     color: colorGray1,//Colors.grey[200],
//     child: TextFormField(
//       keyboardType: _boardType,
//       initialValue: _valorInicial,
//       textCapitalization: _textCap,
//       obscureText: _obscuretext,
//       onSaved: _onsaved,
//       cursorColor: colorMain,
//       decoration: InputDecoration(
//         hintText: _hinttext,
//         hintStyle: TextStyle(fontSize: 14.0),
//         prefixIcon: Material(
//           borderRadius: _shape,
//           color: Colors.transparent,
//           child: Icon(
//             _icon,
//             color: colorMain,
//           ),
//         ),
//         border: InputBorder.none,
//         contentPadding: EdgeInsets.symmetric(horizontal: 12.0, vertical: 12.0)
//       ),
//     ),
//   );
// }

// Widget textFormLess(String _hinttext, _onsaved){
//   return Material(
//     elevation: 0.0,
//     borderRadius: _shape,
//     color: Colors.grey[200],
//     child: TextFormField(
//       textCapitalization: TextCapitalization.sentences,
//       onSaved: _onsaved,
//       cursorColor: colorMain,
//       decoration: InputDecoration(
//         hintText: _hinttext,
//         hintStyle: TextStyle(fontSize: 14.0),
//         border: InputBorder.none,
//         contentPadding: EdgeInsets.symmetric(horizontal: 12.0, vertical: 12.0),
//       ),
//     ),
//   );
// }

// Widget textArea(String _hinttext, _icon,bool _obscuretext, _onsaved,TextCapitalization _textCap,String _valorInicial){
//   return Material(
//     elevation: 0.0,
//     borderRadius: _shape,
//     color: Colors.grey[200],
//     child: TextFormField(
//       initialValue: _valorInicial,
//       textCapitalization: _textCap,
//       obscureText: _obscuretext,
//       onSaved: _onsaved,
//       cursorColor: colorMain,
//       maxLines: null,
//       keyboardType: TextInputType.multiline,
//       decoration: InputDecoration(
//         hintText: _hinttext,
//         hintStyle: TextStyle(fontSize: 14.0),
//         border: InputBorder.none,
//         contentPadding: EdgeInsets.symmetric(horizontal: 12.0, vertical: 12.0),
//       ),
//     ),
//   );
// }

// Widget textBtn(_hinttext, _icon, _funtion){
//     return Material(
//     elevation: 0.0,
//     borderRadius: _shape,
//     color: Colors.grey[200],
//     child: TextFormField(
//       textCapitalization: TextCapitalization.sentences,
//       onSaved: _funtion,
//       cursorColor: colorMain,
//       decoration: InputDecoration(
//         hintText: _hinttext,
//         hintStyle: TextStyle(fontSize: 14.0),
//         border: InputBorder.none,
//         contentPadding: EdgeInsets.symmetric(horizontal: 12.0, vertical: 12.0),
//         suffixIcon: Container(
//           child: IconButton(onPressed: _funtion, icon: _icon,color: colorMain,tooltip: 'Buscar'))
//       ),
//     ),
//   );
// }

import 'package:flutter/material.dart';
import 'package:proypet/src/styles/styles.dart';

class FormularioText extends StatelessWidget {
  // const name({Key key}) : super(key: key);
  final String labelText;
  final String hintText;
  final IconData icon;
  final iconSuf;
  final obscureText;
  final Function onSaved;
  final Function onChanged;
  final TextCapitalization textCap;
  final String valorInicial;
  final TextInputType boardType;
  final bool activo;

  FormularioText(
      {this.labelText,
      this.hintText,
      this.icon,
      this.iconSuf,
      this.obscureText = false,
      this.onSaved,
      this.onChanged,
      this.textCap = TextCapitalization.none,
      this.valorInicial,
      this.boardType = TextInputType.text,
      this.activo = true});

  @override
  Widget build(BuildContext context) {
    return (labelText == null)
        ? Padding(
            padding: const EdgeInsets.only(top: 10, bottom: 10),
            child: TextFormField(
              enabled: activo,
              keyboardType: boardType,
              initialValue: valorInicial,
              textCapitalization: textCap,
              obscureText: obscureText,
              onSaved: onSaved,
              onChanged: onChanged,
              cursorColor: colorMain,
              decoration: InputDecoration(
                hintText: hintText,
                prefixIcon: (icon != null) ? Icon(icon, color: colorMain) : null,
                suffixIcon: iconSuf,
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
                  onChanged: onChanged,
                  cursorColor: colorMain,
                  decoration: InputDecoration(
                    hintText: hintText,
                    prefixIcon: (icon != null) ? Icon(icon, color: colorMain) : null,
                    suffixIcon: iconSuf,
                  ),
                ),
              ],
            ),
          );
  }
}

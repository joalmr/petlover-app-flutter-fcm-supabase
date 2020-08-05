import 'package:flutter/material.dart';
import 'package:proypet/src/styles/styles.dart';

// final _shape = BorderRadius.circular(10.0);

class FormularioText extends StatelessWidget {
  // const name({Key key}) : super(key: key);
  final String labelText;
  final String hintText;
  final IconData icon;
  final iconSuf;
  final obscureText;
  final Function onSaved;
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
              cursorColor: colorMain,
              decoration: InputDecoration(
                hintText: hintText,
                prefixIcon:
                    (icon != null) ? Icon(icon, color: colorMain) : null,
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
                  cursorColor: colorMain,
                  decoration: InputDecoration(
                    hintText: hintText,
                    prefixIcon:
                        (icon != null) ? Icon(icon, color: colorMain) : null,
                    suffixIcon: iconSuf,
                  ),
                ),
              ],
            ),
          );
  }
}

// class FormularioText extends StatefulWidget {
//   final String labelText;
//   final String hintText;
//   final IconData icon;
//   final iconSuf;
//   final obscureText;
//   final Function onSaved;
//   final TextCapitalization textCap;
//   final String valorInicial;
//   final TextInputType boardType;

//   FormularioText(
//       {this.labelText,
//       this.hintText,
//       this.icon,
//       this.iconSuf,
//       this.obscureText,
//       this.onSaved,
//       this.textCap,
//       this.valorInicial,
//       this.boardType});

//   @override
//   _FormularioTextState createState() => _FormularioTextState(
//         labelText: labelText,
//         hintText: hintText,
//         icon: icon,
//         iconSuf: iconSuf,
//         obscureText: obscureText,
//         onSaved: onSaved,
//         textCap: textCap,
//         valorInicial: valorInicial,
//         boardType: boardType,
//       );
// }

// class _FormularioTextState extends State<FormularioText> {
//   String labelText;
//   String hintText;
//   IconData icon;
//   dynamic iconSuf;
//   bool obscureText;
//   Function onSaved;
//   TextCapitalization textCap;
//   String valorInicial;
//   TextInputType boardType;

//   _FormularioTextState({
//     this.labelText,
//     this.hintText,
//     this.icon,
//     this.iconSuf,
//     this.obscureText,
//     this.onSaved,
//     this.textCap,
//     this.valorInicial,
//     this.boardType,
//   });
//   @override
//   Widget build(BuildContext context) {
//     return (labelText == null)
//         ? Padding(
//             padding: const EdgeInsets.only(top: 10, bottom: 10),
//             child: TextFormField(
//               keyboardType: boardType,
//               initialValue: valorInicial,
//               textCapitalization: textCap,
//               obscureText: obscureText,
//               onSaved: onSaved,
//               cursorColor: colorMain,
//               decoration: InputDecoration(
//                 hintText: hintText,
//                 prefixIcon:
//                     (icon != null) ? Icon(icon, color: colorMain) : null,
//                 suffixIcon: iconSuf,
//               ),
//             ),
//           )
//         : Padding(
//             padding: const EdgeInsets.only(top: 10, bottom: 10),
//             child: Column(
//               mainAxisAlignment: MainAxisAlignment.start,
//               crossAxisAlignment: CrossAxisAlignment.start,
//               children: <Widget>[
//                 Text(labelText),
//                 SizedBox(height: 7.5),
//                 TextFormField(
//                   keyboardType: boardType,
//                   initialValue: valorInicial,
//                   textCapitalization: textCap,
//                   obscureText: obscureText,
//                   onSaved: onSaved,
//                   cursorColor: colorMain,
//                   decoration: InputDecoration(
//                     hintText: hintText,
//                     prefixIcon:
//                         (icon != null) ? Icon(icon, color: colorMain) : null,
//                     suffixIcon: iconSuf,
//                   ),
//                 ),
//               ],
//             ),
//           );
//   }
// }

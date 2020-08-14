import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:proypet/src2/app/views/components/form_control/button_primary.dart';

import 'package:proypet/src2/app/styles/styles.dart';

import 'transition/fadeViewSafeArea.dart';

class VerifyPage extends StatelessWidget {
  final String textomail;
  VerifyPage({@required this.textomail});

  @override
  Widget build(BuildContext context) {
    double margenprox = (MediaQuery.of(context).size.height * 0.15);
    return WillPopScope(
      onWillPop: () async => false,
      child: Scaffold(
        backgroundColor: colorMain,
        body: FadeViewSafeArea(
          child: Container(
            height: MediaQuery.of(context).size.height,
            child: Center(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Container(
                    width: MediaQuery.of(context).size.width * 0.8,
                    margin: EdgeInsets.only(top: margenprox),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: <Widget>[
                        Stack(
                          children: <Widget>[
                            ClipRRect(
                              borderRadius: BorderRadius.all(Radius.circular(0)),
                              child: Image(
                                image: AssetImage('images/verify.png'),
                                height: 200,
                                fit: BoxFit.cover,
                              ),
                            ),
                          ],
                          // child:
                        ),
                        SizedBox(height: 25),
                        Text(
                          'Valida tu cuenta',
                          style: Theme.of(context).textTheme.headline5.copyWith(color: Colors.white).apply(fontWeightDelta: 2),
                        ),
                        SizedBox(height: 5),
                        Text(
                          'Hemos enviado un correo para validar tu cuenta a:',
                          style: Theme.of(context).textTheme.subtitle1.copyWith(color: Colors.white),
                          textAlign: TextAlign.center,
                        ),
                        SizedBox(height: 10),
                        Text(
                          textomail,
                          style: Theme.of(context).textTheme.headline5.apply(color: colorBrown1, fontWeightDelta: 2),
                        ),
                        SizedBox(height: 10),
                        Text(
                          'Recuerda revisar tu bandeja de correos no deseados',
                          style: Theme.of(context).textTheme.subtitle1.copyWith(color: Colors.white),
                          textAlign: TextAlign.center,
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(bottom: 15),
                    child: buttonOutLine('Ya validé mi cuenta', () => Get.offNamed('login'), Colors.white),
                    // {
                    //   return Navigator.of(context).pushNamedAndRemoveUntil(
                    //       'login', ModalRoute.withName('/'));
                    // }, Colors.white),
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

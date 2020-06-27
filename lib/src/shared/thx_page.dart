import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:proypet/src/shared/form_control/button_primary.dart';
import 'package:proypet/src/shared/transicion/pagina_app.dart';
import 'package:proypet/src/styles/styles.dart';

class ThxPage extends StatelessWidget {
  final ImageProvider<dynamic> image;
  final String texto;
  ThxPage(this.image,this.texto);
  
  @override
  Widget build(BuildContext context) {
    double margenprox = (MediaQuery.of(context).size.height * 0.25);
    return WillPopScope(
      onWillPop: () async => false,
      child: Scaffold(
        backgroundColor: colorMain,
        body: FadeView(
          child: Container(
            // decoration: BoxDecoration(
            //   image: DecorationImage(
            //     image: AssetImage("images/confirmado.png"),
            //     fit: BoxFit.cover,
            //   ),
            // ),
            height: MediaQuery.of(context).size.height,
            child: Center(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Container(
                    width: MediaQuery.of(context).size.width * 0.8,
                    margin: EdgeInsets.only(top: margenprox),
                    child: Center(
                      child: Column(
                        children: <Widget>[
                          Stack(
                            children: <Widget>[
                              ClipRRect(
                                borderRadius: BorderRadius.all(Radius.circular(100)),
                                child: Image(
                                  image: image,
                                  height: 150,
                                  fit: BoxFit.cover,
                                ),
                              ),
                              Positioned(
                                bottom: 0,
                                right: 20,
                                child: Icon(Icons.check_circle, color: Colors.white,)
                              )
                            ],
                            // child: 
                          ),
                          SizedBox(height: 25),
                          Text(
                            texto, 
                            style: Theme.of(context).textTheme.subtitle1.copyWith(fontSize: 18, color: Colors.white),
                            textAlign: TextAlign.center,
                          ),
                        ],
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(bottom: 15),
                    child: buttonOutLine('Ir a inicio', (){
                      return Navigator.of(context).pushNamedAndRemoveUntil('/navInicio', ModalRoute.withName('/navInicio'));
                    }, Colors.white),
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
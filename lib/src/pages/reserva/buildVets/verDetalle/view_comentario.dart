import 'package:flutter/material.dart';

class ViewComentario extends StatefulWidget {
  final dynamic localVet;
  ViewComentario({@required this.localVet}); 

  @override
  _ViewComentarioState createState() => _ViewComentarioState(localVet: localVet);
}

class _ViewComentarioState extends State<ViewComentario> {
  dynamic localVet;
  _ViewComentarioState({@required this.localVet});

  @override
  Widget build(BuildContext context) {
    return viewComentario(localVet);
  }

  viewComentario(localVet){
    return SingleChildScrollView(
      child: Column(
        children: <Widget>[
          SizedBox(height: 10.0,),
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 20.0),
            width: double.infinity,
            child: Text("Comentario", style: Theme.of(context).textTheme.subtitle2.apply(fontWeightDelta: 2))
          ),
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 20.0),
            width: double.infinity,
            child: Text("Aqui vienen los comentarios")
          )
        ],
      ),
    );
  }
}
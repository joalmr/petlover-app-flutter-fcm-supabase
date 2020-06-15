import 'package:flutter/material.dart';

class ViewHorario extends StatefulWidget {
  final dynamic localVet;
  ViewHorario({@required this.localVet}); 

  @override
  _ViewHorarioState createState() => _ViewHorarioState(localVet: localVet);
}

class _ViewHorarioState extends State<ViewHorario> {
  dynamic localVet;
  _ViewHorarioState({@required this.localVet});

  @override
  Widget build(BuildContext context) {
    return viewHorario(widget.localVet);
  }

  viewHorario(localVet){
    return SingleChildScrollView(
      child: Column(
        children: <Widget>[
          SizedBox(height: 10.0,),
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 20.0),
            width: double.infinity,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Text("Horario", style: Theme.of(context).textTheme.subtitle2.apply(fontWeightDelta: 2)),
                (localVet.schedule.length>0) 
                  ? _listHorario(localVet.schedule)
                  : Center(child: Text("No tiene horarios registrados"))
              ],
            )
          ),          
          // Pading(
          //   padding: const EdgeInsets.symmetric(horizontal: 20.0),
          //   child: 
          // ) d
        ],
      ),
    );
  }

  Widget _listHorario(horario){
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10.0),
      child: Column(
        children: <Widget>[
          (horario["monday"]["attention"]=="on") //&& horario["monday"]["time_start"]!=null && horario["monday"]["time_end"]!=null 
          ? _horario('Lunes',horario["monday"]["time_start"],horario["monday"]["time_end"],)
            : SizedBox(width: 0, height: 0,),
          (horario["tuesday"]["attention"]=="on") //&& horario["tuesday"]["time_start"]!=null && horario["tuesday"]["time_end"]!=null 
          ? _horario('Martes',horario["tuesday"]["time_start"],horario["tuesday"]["time_end"],)
            : SizedBox(width: 0, height: 0,),
          (horario["wednesday"]["attention"]=="on") //&& horario["wednesday"]["time_start"]!=null && horario["wednesday"]["time_end"]!=null 
          ? _horario('Miércoles',horario["wednesday"]["time_start"],horario["wednesday"]["time_end"],)
            : SizedBox(width: 0, height: 0,),
          (horario["thursday"]["attention"]=="on") //&& horario["thursday"]["time_start"]!=null && horario["thursday"]["time_end"]!=null 
          ? _horario('Jueves',horario["thursday"]["time_start"],horario["thursday"]["time_end"],)
            : SizedBox(width: 0, height: 0,),
          (horario["friday"]["attention"]=="on") //&& horario["friday"]["time_start"]!=null && horario["friday"]["time_end"]!=null 
          ? _horario('Viernes',horario["friday"]["time_start"],horario["friday"]["time_end"],)
            : SizedBox(width: 0, height: 0,),
          (horario["saturday"]["attention"]=="on") //&& horario["saturday"]["time_start"]!=null && horario["saturday"]["time_end"]!=null 
          ? _horario('Sábado',horario["saturday"]["time_start"],horario["saturday"]["time_end"],)
            : SizedBox(width: 0, height: 0,),
          (horario["sunday"]["attention"]=="on") //&& horario["sunday"]["time_start"]!=null && horario["sunday"]["time_end"]!=null 
          ? _horario('Domingo',horario["sunday"]["time_start"],horario["sunday"]["time_end"],)
            : SizedBox(width: 0, height: 0,),
        ],
      ),
    );
  }

  Widget _horario(dia, inicio, fin){
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 0.0),
      child: Column(
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 5.0, horizontal: 5),
            child: Row(
              children: <Widget>[
                Expanded(
                  flex: 1,
                  child: Text(dia)
                ),
                Expanded(
                  child: Row(
                    children: <Widget>[
                      Icon(Icons.schedule, color: Colors.black54, size: 20.0),
                      SizedBox(width: 5),
                      Text(inicio==null?"-":inicio),
                      SizedBox(width: 5),
                      Text("-"),
                      SizedBox(width: 5),
                      Text(fin==null?"-":fin),
                    ],
                  )
                )
              ],
            ),
          ),
          Divider()
        ],
      ),
    );
  }
  
}
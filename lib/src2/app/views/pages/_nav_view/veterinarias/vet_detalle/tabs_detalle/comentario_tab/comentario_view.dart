import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:proypet/src2/app/styles/styles.dart';
import 'package:proypet/src2/controllers/veterinaria_controller/comentario_vet_controller.dart';

class ViewComentario extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GetX<ComentarioVetController>(
        init: ComentarioVetController(),
        builder: (_) => _.cargando.value
            ? Container(
                child: Center(
                  child: CupertinoActivityIndicator(),
                ),
              )
            : (_.comentarios.length == 0)
                ? Container(
                    child: Center(
                      child: Text('No posee comentarios.'),
                    ),
                  )
                : ListView.builder(
                    itemCount: _.comentarios.length,
                    itemBuilder: (BuildContext context, int index) {
                      return ListTile(
                        // contentPadding: EdgeInsets.all(0),
                        leading: CircleAvatar(
                          backgroundColor: colorMain,
                          backgroundImage: CachedNetworkImageProvider(_.comentarios[index].petPicture),
                          radius: 20.0,
                        ),
                        title: Container(
                          padding: EdgeInsets.all(0),
                          alignment: Alignment.topLeft,
                          child: Text(
                            _.comentarios[index].comment,
                            style: TextStyle(fontSize: 14),
                          ),
                        ),
                        trailing: Wrap(children: <Widget>[
                          Text(
                            _.comentarios[index].stars.toString(),
                            style: TextStyle(fontSize: 14),
                          ),
                          Icon(Icons.star, color: colorYellow, size: 17)
                        ]),
                      );
                    },
                  ));
  }
}

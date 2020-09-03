import 'package:animate_do/animate_do.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:proypet/src/app/styles/styles.dart';
import 'package:proypet/src/controllers/veterinaria_controller/comentario_vet_controller.dart';

import 'todos_comentarios_view.dart';

class ViewComentario extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GetX<ComentarioVetController>(
      init: ComentarioVetController(),
      builder: (_) => _.cargando.value
          ? FadeIn(
              child: Container(
                child: Center(
                  child: CupertinoActivityIndicator(),
                ),
              ),
            )
          : (_.comentarios.length == 0)
              ? FadeIn(
                  child: Container(
                    child: Center(
                      child: FadeIn(
                        duration: Duration(milliseconds: 1000),
                        child: Text('No posee comentarios.'),
                      ),
                    ),
                  ),
                )
              : FadeIn(
                  child: FadeIn(
                    duration: Duration(milliseconds: 250),
                    child: Column(
                      children: [
                        Expanded(
                          child: ListView.builder(
                            itemCount: _.comentarios.take(5).length,
                            itemBuilder: (BuildContext context, int index) {
                              return ListTile(
                                leading: CircleAvatar(
                                  backgroundColor: Colors.transparent,
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
                                trailing: Wrap(
                                  children: <Widget>[
                                    Text(
                                      _.comentarios[index].stars.toString(),
                                      style: TextStyle(fontSize: 14),
                                    ),
                                    Icon(Icons.star, color: colorYellow, size: 17)
                                  ],
                                ),
                              );
                            },
                          ),
                        ),
                        _.comentarios.length > 5
                            ? Center(
                                child: InkWell(
                                  onTap: () => Get.to(TodosComentarios()),
                                  child: Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Text('Ver más'),
                                  ),
                                ),
                              )
                            : SizedBox(height: 0)
                      ],
                    ),
                  ),
                ),
    );
  }
}

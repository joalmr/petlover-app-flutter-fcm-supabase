import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/state_manager.dart';
import 'package:proypet/src/app/styles/styles.dart';
import 'package:proypet/src/app/views/components/appbar_menu.dart';
import 'package:proypet/src/app/views/components/transition/fadeViewSafeArea.dart';
import 'package:proypet/src/controllers/veterinaria_controller/comentario_vet_controller.dart';

class TodosComentarios extends StatelessWidget {
  const TodosComentarios({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appbar(null, 'Comentarios', null),
      body: FadeViewSafeArea(child: GetBuilder<ComentarioVetController>(
        builder: (_) {
          return Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.all(15.0),
                child: _.comentarios.length == 1 ? Text('${_.comentarios.length} comentario') : Text('${_.comentarios.length} comentarios'),
              ),
              Expanded(
                child: ListView.builder(
                  itemCount: _.comentarios.length,
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
            ],
          );
        },
      )),
    );
  }
}

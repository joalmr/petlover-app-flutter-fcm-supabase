import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/state_manager.dart';
import 'package:proypet/src/app/styles/styles.dart';
import 'package:proypet/src/app/components/appbar_menu.dart';
import 'package:proypet/src/app/components/transition/fadeViewSafeArea.dart';
import 'package:proypet/src/controllers/veterinaria_controller/comentario_vet_controller.dart';

class TodosComentarios extends StatelessWidget {
  const TodosComentarios({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appbar(null, 'Comentarios', null),
      body: FadeViewSafeArea(child: GetX<ComentarioVetController>(
        builder: (_) {
          return Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.all(15.0),
                child: _.allComments.length == 1
                    ? Text('${_.allComments.length} comentario')
                    : Text('${_.allComments.length} comentarios'),
              ),
              Expanded(
                child: ListView.builder(
                  itemCount: _.allComments.length,
                  itemBuilder: (BuildContext context, int index) {
                    final comment = _.allComments[index];
                    return ListTile(
                      leading: CircleAvatar(
                        backgroundColor: Colors.transparent,
                        backgroundImage:
                            CachedNetworkImageProvider(comment.petPicture),
                        radius: 20.0,
                      ),
                      title: Container(
                        padding: EdgeInsets.all(0),
                        alignment: Alignment.topLeft,
                        child: Text(
                          comment.comment,
                          style: TextStyle(fontSize: 14),
                        ),
                      ),
                      trailing: Wrap(
                        children: <Widget>[
                          Text(
                            comment.stars.toString(),
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

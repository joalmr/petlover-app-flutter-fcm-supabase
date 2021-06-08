import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:proypet/design/styles/styles.dart';
import 'package:proypet/source/veterinarias/domain/chatController.dart';
import 'package:scrollable_positioned_list/scrollable_positioned_list.dart';

class ChatView extends StatelessWidget {
  final mensaje = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return GetX<ChatController>(
      init: ChatController(),
      builder: (_){
        return Scaffold(
          appBar: AppBar(title: Text(_.vetName),),
          body: Column(
            children: [
              Expanded(
                child: 
                _.mensajes.length == 0 
                ?
                Icon(Icons.chat_bubble_outline_rounded)
                :
                ScrollablePositionedList.builder(
                  itemCount: _.mensajes.length,
                  initialScrollIndex: _.scrollInit,
                  itemScrollController: _.itemScrollController,
                  itemPositionsListener: _.itemPositionsListener,
                  itemBuilder: (BuildContext context, int index) {
                    final message = _.mensajes[index];
                    return Container(
                      margin: EdgeInsets.all(5),
                      padding: EdgeInsets.all(10),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(25),
                        color: message.type ? colorMain.withOpacity(0.5) : colorBlue.withOpacity(0.5)
                      ),
                      child: Text(message.message),
                    );
                  },
                ),
              ),
              Container(
                width: double.maxFinite,
                padding: const EdgeInsets.all(8.0),
                child: TextFormField(
                  controller: mensaje,
                  decoration: InputDecoration(
                    suffix: TextButton(
                      onPressed: (){
                        if(mensaje.text.trim()!=''){
                          _.addMessage(mensaje.text);
                          mensaje.text = '';
                        }
                      }, 
                      child: Text('Enviar'),
                    )
                  ),
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:proypet/config/global_variables.dart';
import 'package:proypet/source/notificaciones/model/notificacion_model.dart';
import 'package:proypet/utils/datetime.dart';

class NotificationProvider {
  final _url = urlApi;

  Future<NotificacionModel> getNotificacion() async {
    final url = Uri.parse('$_url/notifications');
    final resp = await http.get(
      url,
      headers: headersToken(),
    );

    NotificacionModel notificacionModel = notificacionModelFromJson(resp.body);

    notificacionModel.notifications.forEach((element) {
      element.message = '${element.message}';
    });
    return notificacionModel;
  }

  
  Future<List<GroupNoti>> getNotificacionGroup() async {
    List<GroupNoti> groupNoti=[];
    List<String> idsImg=[];

    final url = Uri.parse('$_url/notifications');
    final resp = await http.get(
      url,
      headers: headersToken(),
    );

    NotificacionModel notificacionModel = notificacionModelFromJson(resp.body);

    notificacionModel.notifications.forEach((element) {
      element.message = '${element.message}';
      final dateItem = toDateBasic(element.notificationDate);
      final dateDiff = DateTime.now().difference(dateItem);
      if(element.petPicture != null && dateDiff.inDays < 7){
        GroupNoti temp = new GroupNoti(
          imgId: element.petPicture,
          notifications: [element],
        );
        

        if(groupNoti.length==0){
          groupNoti.add(temp);
          idsImg.add(element.petPicture);
        }
        else{
          if(idsImg.contains(element.petPicture)){
            int newIndex = idsImg.indexOf(element.petPicture);
            groupNoti[newIndex].notifications.add(element);
          }
          else{
            groupNoti.add(temp);
          }
        }
      }
    });
    
    return groupNoti;
  }
}

GroupNoti groupNotiFromJson(String str) => GroupNoti.fromJson(json.decode(str));
String groupNotiToJson(GroupNoti data) => json.encode(data.toJson());

class GroupNoti {
    GroupNoti({
        this.imgId,
        this.notifications,
    });

    String imgId;
    List<Notificacion> notifications;

    factory GroupNoti.fromJson(Map<String, dynamic> json) => GroupNoti(
        imgId: json["imgId"],
        notifications: List<Notificacion>.from(json["notifications"].map((x) => Notificacion.fromJson(x))),
    );

    Map<String, dynamic> toJson() => {
        "imgId": imgId,
        "notifications": List<dynamic>.from(notifications.map((x) => x.toJson())),
    };
}

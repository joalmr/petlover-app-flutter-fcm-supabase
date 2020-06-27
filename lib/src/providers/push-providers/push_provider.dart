// import 'dart:async';
// import 'dart:io';

// import 'package:firebase_messaging/firebase_messaging.dart';


// class PushProvider {
  
//   FirebaseMessaging _firebaseMessaging = FirebaseMessaging();

//   final _mensajesStreamController = StreamController<String>.broadcast();
//   Stream<String> get mensajes => _mensajesStreamController.stream;

//   initNotificaciones(){
//     _firebaseMessaging.requestNotificationPermissions();

//     _firebaseMessaging.getToken().then((token) {
//       //los tokens a agregar en la bd deben ser un arreglo de tokens
//       print("======== token ========");
//       print(token);
//     });


//     _firebaseMessaging.configure(

//       onMessage: ( info ) async {
//         print('======== onMessage ========');
//         print(info);

//         String argumento = 'no-data';
//         if(Platform.isAndroid){
//           argumento = info['data']['comida'] ?? 'no-data';
//         }

//         _mensajesStreamController.sink.add(argumento);        
//       },

//       onLaunch: ( info ) async {
//         print('======== onLaunch ========');
//         print(info);

//         final noti = info['data']['comida'];
//         print(noti);

//         _mensajesStreamController.sink.add(noti);
//       },
 
//       onResume: ( info ) async {
//         print('======== onResume ========');
//         print(info);

//         final noti = info['data']['comida'];
//         print(noti);

//         _mensajesStreamController.sink.add(noti);
//       }

//     );
//   }
  
//   dispose(){
//     _mensajesStreamController?.close();
//   }

// }
// import 'package:flutter/material.dart';
// import 'package:proypet/src/push-providers/push_provider.dart';

// class PushPage extends StatefulWidget {
//   // const PushPage({Key key}) : super(key: key);
//   final Widget child;

//   PushPage(this.child);

//   @override
//   _PushPageState createState() => _PushPageState();
// }

// class _PushPageState extends State<PushPage> {

//   final _messageStream = new PushProvider();
// // final bloc = PushProvider.of(context);
//   // final bloc = Provider.of(context);

//   @override
//   void dispose() {
//     super.dispose();
//   }

//   @override
//   void initState() { 
//     super.initState();
//     _messageStream.mensajes.listen((data) { 

//       print('===== Escucho =====');
//       print(data);

//     });
    
//   }

//   @override
//   Widget build(BuildContext context) {

    

//     return StreamBuilder(
//       stream: _messageStream.mensajes ,
//       builder: (BuildContext context, AsyncSnapshot snapshot){

//         if(snapshot.hasData){
//           print("estoy dentro");
//           print(snapshot.data);
          
//           // check if this instance is the current route or else message will be displayed on all instances
//           if (ModalRoute.of(context).isCurrent) {
//             WidgetsBinding.instance
//                 .addPostFrameCallback((_) => _showMessage(snapshot.data));
//           }
//           // adding a null stops the previous message from being displayed again
//           // MessageStream.instance.addMessage(null);
//         }

//         return widget.child;
//       },
//     );

//   }

//   void _showMessage(Map<String, dynamic> message) {

//     SnackBar bar = SnackBar(
//       behavior: SnackBarBehavior.floating,
//       duration: Duration(seconds: 10),
//       action: SnackBarAction(
//         label: "Close",
//         textColor: Colors.redAccent,
//         onPressed: () => Scaffold.of(context).hideCurrentSnackBar(),
//       ),
//       content: Padding(
//         padding: const EdgeInsets.only(bottom: 25.0),
//         child: Column(
//           mainAxisSize: MainAxisSize.min,
//           crossAxisAlignment: CrossAxisAlignment.start,
//           children: <Widget>[
//             Text(message['notification']["title"]),
//             Text(message['notification']["body"]),
//           ],
//         ),
//       ),
//     );

//     Scaffold.of(context)
//       ..hideCurrentSnackBar()
//       ..showSnackBar(bar);
//   }

// }
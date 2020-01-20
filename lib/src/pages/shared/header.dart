import 'package:flutter/material.dart';

import '../../../main.dart';

class Header extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return 
    SafeArea(
      child: 
      Container(
        padding: EdgeInsets.all(10.0),
        color: colorMain,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[
            CircleAvatar(
              backgroundColor: colorMain,
              backgroundImage: AssetImage('images/greco.png'),
              minRadius: 25.0,
              maxRadius: 35.0,
            ),
            SizedBox(width: 5.0,),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Text('Greco', style: TextStyle(color: Colors.white, fontSize: 30.0, fontWeight: FontWeight.bold),),
                Text('Cocker', style: TextStyle(color: Colors.white, fontSize: 18.0),),
              ],
            ),
            Spacer(),
            IconButton(
              color: Colors.white,
              icon: Icon(Icons.notifications_active),
              onPressed: (){},
            ),
          ],
        ),
      )
    );
  }


}

// class AppBarHead extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return AppBar(
//           titleSpacing: 10.0,
//           elevation: 0.0,
//           backgroundColor: colorMain,
//           leading: CircleAvatar(
//             backgroundColor: colorMain,
//             backgroundImage: AssetImage('images/greco.png'),
//             //radius: 35.0,
//           ),
//           title: Column(
//             crossAxisAlignment: CrossAxisAlignment.start,
//             children: <Widget>[
//               Text('Greco',maxLines: 1),
//               Text('Cocker Spaniel',style: TextStyle(color: Colors.grey[300],fontSize: 12.0),maxLines: 1),
//             ],
//           ),
//           actions: <Widget>[
//             Icon(Icons.notifications_active)
//           ],
//           flexibleSpace: SizedBox(height: 10.0,),
//         );
//   }
// }
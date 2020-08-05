// import 'package:flutter/material.dart';
// import 'package:flutter_mobx/flutter_mobx.dart';
// import 'package:provider/provider.dart';

// // import 'counter_store.dart';
// import 'storeMain_store.dart';

// class CounterExample extends StatefulWidget {
//   const CounterExample({Key key}) : super(key: key);

//   @override
//   _CounterExampleState createState() => _CounterExampleState();
// }

// class _CounterExampleState extends State<CounterExample> {
//   MainStore _store;

//   @override
//   void didChangeDependencies() {
//     super.didChangeDependencies();
//     _store ??= Provider.of<MainStore>(context);
//   }

//   @override
//   Widget build(BuildContext context) => Observer(
//         builder: (_) => Scaffold(
//           appBar: AppBar(title: Text('Counter ${_store.value}')),
//           body: Center(
//             child: Column(
//               mainAxisAlignment: MainAxisAlignment.center,
//               children: <Widget>[
//                 const Text(
//                   'Valor:',
//                 ),
//                 Text(
//                   '${_store.value}',
//                   style: const TextStyle(fontSize: 20),
//                 ),
//                 const Text(
//                   'Valor2:',
//                 ),
//                 Text(
//                   '${_store.value2}',
//                   style: const TextStyle(fontSize: 20),
//                 ),
//               ],
//             ),
//           ),
//           floatingActionButton: FloatingActionButton(
//             onPressed: _store.increment,
//             tooltip: 'Incrementa',
//             child: const Icon(Icons.add),
//           ),
//         ),
//       );
// }

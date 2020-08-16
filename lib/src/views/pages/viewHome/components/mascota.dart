// import 'package:animate_do/animate_do.dart';
// import 'package:cached_network_image/cached_network_image.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_swiper/flutter_swiper.dart';
// import 'package:get_it/get_it.dart';
// import 'package:proypet/src/store/home_store.dart';
// import 'package:proypet/src2/utils/calcula_edad.dart';
// import 'package:proypet/src2/app/styles/styles.dart';
// import 'package:proypet/src2/app/views/components/form_control/button_primary.dart';

// class Mascotas extends StatefulWidget {
//   // const Mascotas({Key key}) : super(key: key);
//   @override
//   _MascotasState createState() => _MascotasState();
// }

// class _MascotasState extends State<Mascotas> {
//   HomeStore homeStore;
//   // ReactionDisposer disposer;
//   // bool ejec = true;

//   // @override
//   // void didChangeDependencies() {
//   //   super.didChangeDependencies();
//   //   homeStore ??= Provider.of<HomeStore>(context);
//   // }

//   @override
//   void initState() {
//     super.initState();
//     homeStore = GetIt.I.get<HomeStore>();
//   }

//   @override
//   void dispose() {
//     super.dispose();
//   }

//   _agregarMascota() => homeStore.agregarMascota();
//   _detalleMascota(id) => homeStore.detalleMascota(id);

//   @override
//   Widget build(BuildContext context) {
//     return homeStore.loading
//         ? Container(
//             height: 250.0,
//             width: double.infinity,
//             child: Center(
//               child: CircularProgressIndicator(),
//             ),
//           )
//         : homeStore.sinMascotas
//             ? FadeIn(
//                 delay: Duration(milliseconds: 500),
//                 duration: Duration(milliseconds: 500),
//                 child: Container(
//                   height: 250.0,
//                   width: double.infinity,
//                   child: Column(
//                     crossAxisAlignment: CrossAxisAlignment.center,
//                     mainAxisAlignment: MainAxisAlignment.center,
//                     children: <Widget>[
//                       Text('Se parte de la comunidad responsable', textAlign: TextAlign.center),
//                       SizedBox(height: 10.0),
//                       buttonOutLine('Agregar mascota', _agregarMascota, colorMain),
//                     ],
//                   ),
//                 ),
//               )
//             : FadeIn(
//                 delay: Duration(milliseconds: 500),
//                 duration: Duration(milliseconds: 500),
//                 child: Container(
//                   height: 250.0,
//                   width: double.infinity,
//                   child: Stack(
//                     children: <Widget>[
//                       Swiper(
//                         physics: BouncingScrollPhysics(),
//                         itemCount: homeStore.mascotas.length, //mascotaList.length,
//                         itemBuilder: (BuildContext context, int index) {
//                           final mascota = homeStore.mascotas[index];
//                           // return Observer(builder: (_) {
//                           return ClipRRect(
//                             borderRadius: BorderRadius.circular(15.0),
//                             child: Stack(
//                               children: <Widget>[
//                                 Container(
//                                   height: 250.0,
//                                   width: double.infinity,
//                                   foregroundDecoration: BoxDecoration(
//                                     color: Colors.black.withOpacity(0.15),
//                                   ),
//                                   child: Image(
//                                     image: CachedNetworkImageProvider(mascota.picture),
//                                     fit: BoxFit.cover,
//                                   ),
//                                 ),
//                                 Positioned(
//                                   top: 15.0,
//                                   left: 10.0,
//                                   child: Column(
//                                     crossAxisAlignment: CrossAxisAlignment.start,
//                                     mainAxisAlignment: MainAxisAlignment.start,
//                                     children: <Widget>[
//                                       Text(mascota.name, style: Theme.of(context).textTheme.headline6.apply(color: Colors.white, fontWeightDelta: 2)),
//                                       Text(mascota.breedName, style: Theme.of(context).textTheme.subtitle2.apply(color: Colors.white)),
//                                     ],
//                                   ),
//                                 ),
//                                 Positioned(
//                                   bottom: 10.0,
//                                   left: 10.0,
//                                   child: Column(
//                                     crossAxisAlignment: CrossAxisAlignment.start,
//                                     mainAxisAlignment: MainAxisAlignment.start,
//                                     children: <Widget>[
//                                       RichText(
//                                         text: TextSpan(
//                                           children: [
//                                             TextSpan(
//                                               text: mascota.weight.toString(),
//                                               style: Theme.of(context).textTheme.headline4.apply(color: Colors.white, fontWeightDelta: 2),
//                                             ),
//                                             TextSpan(text: " kg.")
//                                           ],
//                                         ),
//                                       ),
//                                       Row(
//                                         children: <Widget>[
//                                           (mascota.status == 0) ? Icon(Icons.bookmark, color: Colors.white) : Icon(Icons.cake, color: Colors.white),
//                                           SizedBox(width: 5.0),
//                                           (mascota.status == 0)
//                                               ? Text(
//                                                   "Fallecido",
//                                                   style: TextStyle(
//                                                     color: Colors.white,
//                                                   ),
//                                                 )
//                                               : Text(
//                                                   calculateAge(DateTime.parse(mascota.birthdate)),
//                                                   style: Theme.of(context).textTheme.subtitle2.apply(color: Colors.white),
//                                                 )
//                                         ],
//                                       ),
//                                     ],
//                                   ),
//                                 ),
//                                 Positioned(
//                                   bottom: 10.0,
//                                   right: 10.0,
//                                   child: buttonOutLine('Ver más', () => _detalleMascota(mascota.id), colorGray1),
//                                 ),
//                               ],
//                             ),
//                           );
//                           // });
//                         },
//                         viewportFraction: 0.79,
//                         scale: 0.77,
//                         loop: false,
//                       ),
//                       Positioned(
//                         top: 0.0,
//                         right: 0.0,
//                         child: FloatingActionButton(
//                           onPressed: _agregarMascota,
//                           child: Icon(Icons.playlist_add),
//                         ),
//                       ),
//                     ],
//                   ),
//                 ),
//               );
//   }
// }

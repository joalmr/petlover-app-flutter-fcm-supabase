import 'package:flutter/material.dart';
import 'package:proypet/components/navegadores/appbar.dart';
import 'vet_detalle/fav/drawer/favVet.dart';
import 'vet_detalle/fav/favorita_detalle.dart';

class FavroiteVets extends StatelessWidget {
  final GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      appBar: appBar(
        texto: 'Veterinarias favoritas',
        acc: [
          IconButton(
            icon: Icon(Icons.more_vert_rounded), 
            onPressed: () => _scaffoldKey.currentState.openEndDrawer(),
          )
        ],
      ),
      endDrawer: FavVetDrawer(),
      body: FavoriteDetalleVet(),
    );

    // return GetX<VeterinariasController>(
    //   builder: (_) {
    //     return Scaffold(
    //       key: _scaffoldKey,
    //       appBar: appBar(
    //         texto: 'Veterinarias favoritas',
    //         acc: [
    //           IconButton(
    //             icon: Icon(Icons.more_vert_rounded), 
    //             onPressed: () => _scaffoldKey.currentState.openEndDrawer(),
    //           )
    //         ],
    //       ),
    //       endDrawer: FavVetDrawer(),
    //       body: Column(
    //         children: [
    //           Expanded(
    //             child: ListView.builder(
    //               itemCount: _.favoriteVets.length,
    //               itemBuilder: (BuildContext context, int index) {
    //                 return buildVets(_.favoriteVets[index]);
    //               },
    //             ),
    //           ),
    //           Container(
    //             height: 60,
    //             width: double.maxFinite,
    //             child: SizedBox(
    //               width: double.maxFinite,
    //               child: TextButton(
    //                 child: Text('Ver más veterinarias'), 
    //                 onPressed: ()=>Get.to(ReservaList()), 
    //               ),
    //             ),
    //           ),
    //         ],
    //       ),
    //     );
    //   },
    // );
  }
}
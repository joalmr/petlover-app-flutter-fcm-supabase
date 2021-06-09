import 'package:flutter/material.dart';
import 'vet_detalle/fav/drawer/favVet.dart';
import 'vet_detalle/fav/favorita_detalle.dart';

class FavroiteVets extends StatelessWidget {
  final GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      endDrawer: FavVetDrawer(),
      body: Stack(
        children: [
          FavoriteDetalleVet(),
          Positioned(
            top: 5.0,
            right: 8.0,
            child: SafeArea(
              child: CircleAvatar(
                child: IconButton(
                  icon: Icon(Icons.menu), 
                  onPressed: () => _scaffoldKey.currentState.openEndDrawer(),
                ),
              ),
            ),
          ),
        ],
      ),
    );

    // return GetX<VeterinariasController>(
    //   builder: (_) {
    //     return Scaffold(
    //       key: _scaffoldKey,
    //       appBar: appBar(
    //         texto: 'Veterinarias favoritas',
    //         acc: null
    //       ),
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
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:proypet/design/styles/styles.dart';
import 'package:proypet/source/veterinarias/domain/controller/lista_vets_controller.dart';
import 'package:proypet/source/veterinarias/presentation/view/veterinarias_view.dart';

class FavVetDrawer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GetX<VeterinariasController>(builder: (_){
      return Drawer(
        child: Container(
          padding: const EdgeInsets.only(left: 16.0, right: 16.0),
          decoration: BoxDecoration(
            color: Theme.of(context).scaffoldBackgroundColor,
            boxShadow: [BoxShadow(color: Colors.black45)],
          ),
          width: 300,
          child: SafeArea(
            child: Column(
              children: <Widget>[
                SizedBox(height: 40.0),
                Text(
                  'Veterinarias favoritas',
                  style: TextStyle(
                    fontWeight: FontWeight.w400,
                    fontSize: 24.0,
                    letterSpacing: 3.0,
                    color: Get.textTheme.subtitle2.color,
                  ),
                ),
                SizedBox(height: 20.0),
                Expanded(
                  child: ListView.builder(
                    itemCount: _.favoriteVets.length,
                    itemBuilder: (BuildContext context, int index) {
                      final favvet = _.favoriteVets[index];
                      return Container(
                        width: 300,
                        margin: EdgeInsets.symmetric(vertical: 5.0, horizontal: 1.0),
                        padding: EdgeInsets.symmetric(vertical: 5.0, horizontal: 2.5),
                        decoration: BoxDecoration(
                          borderRadius: borderRadius,
                          color: Get.context.theme.cardColor,
                        ),
                        child: InkWell(
                          borderRadius: borderRadius,
                          onTap: () {
                            _.xGetVet(favvet.id);
                            // Get.back();
                          },
                          child: Row(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              CircleAvatar(
                                child: Padding(
                                  padding: EdgeInsets.all(1),
                                  child: ClipRRect(
                                    borderRadius: BorderRadius.all(Radius.circular(100)),
                                    child: Image(
                                      image: CachedNetworkImageProvider(favvet.logo),
                                      fit: BoxFit.cover,
                                    ),
                                  ),
                                ),
                                backgroundColor: colorGray1,
                                radius: 15,
                              ),
                              SizedBox(width: 5),
                              Container(
                                width: 230,
                                child: Text(
                                  favvet.name,
                                  maxLines: 3,
                                ),
                              ),
                            ],
                          ),
                        ),
                      );
                    },
                  ),
                ),
                Container(
                  height: 60,
                  width: double.maxFinite,
                  child: SizedBox(
                    width: double.maxFinite,
                    child: TextButton(
                      child: Text('Ver más veterinarias'), 
                      onPressed: ()=>Get.to(ReservaList()), 
                    ),
                  ),
                ),
              ],
            ),
            // SingleChildScrollView(
            //   physics: BouncingScrollPhysics(),
            //   child: 
            // ),
          ),
        ),
      );
      },
    );
  }
}

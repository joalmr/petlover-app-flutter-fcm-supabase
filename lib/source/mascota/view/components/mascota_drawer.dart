import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:proypet/design/styles/styles.dart';
import 'package:proypet/source/mascota/controller/mascota_drawer_controller.dart';
import 'package:proypet/source/mascota/view/editar/editar_mascota.dart';

class MascotaDrawer extends StatelessWidget {
  const MascotaDrawer({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<MascotaDrawerController>(
      init: MascotaDrawerController(),
      builder: (_) => ClipPath(
        child: Drawer(
          child: Container(
            padding: const EdgeInsets.only(left: 16.0, right: 16.0),
            decoration: BoxDecoration(
                color: Theme.of(context).scaffoldBackgroundColor,
                boxShadow: [BoxShadow(color: Colors.black45)]),
            width: 300,
            child: SafeArea(
              child: SingleChildScrollView(
                physics: BouncingScrollPhysics(),
                child: Column(
                  children: <Widget>[
                    SizedBox(height: 40.0),
                    Text(
                      _.petC.pet.name,
                      style: TextStyle(
                        fontWeight: FontWeight.w400,
                        fontSize: 24.0,
                        letterSpacing: 3.0,
                        color: Get.textTheme.subtitle2.color,
                      ),
                    ),
                    SizedBox(height: 20.0),
                    Divider(),
                    ListTile(
                      leading: Icon(Icons.edit,
                          color: Get.textTheme.subtitle2.color),
                      title: Text('Editar datos',
                          style: TextStyle(fontWeight: FontWeight.w400)),
                      onTap: () =>
                          Get.to(MascotaEditarPage()), //mascotaData: _.petC.pet
                    ),
                    ListTile(
                      leading: Icon(Icons.bookmark,
                          color: Get.textTheme.subtitle2.color),
                      title: Text('Fallecido',
                          style: TextStyle(fontWeight: FontWeight.w400)),
                      onTap: () => Get.dialog((_.petC.pet.status != 0)
                          ? _fallecido(_)
                          : _errorFallecido(_)),
                    ),
                    ListTile(
                      leading: Icon(Icons.delete_forever, color: colorRed),
                      title: Text('Eliminar mascota',
                          style: TextStyle(
                              color: colorRed, fontWeight: FontWeight.w400)),
                      onTap: () => Get.dialog(_eliminar(_)),
                    )
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }

  _fallecido(MascotaDrawerController control) {
    return FadeIn(
      child: AlertDialog(
        contentPadding: EdgeInsets.symmetric(horizontal: 20.0, vertical: 15.0),
        title: null, //Text('Fallecido'),
        content: Text('Lamentamos la perdida de tu ser querido.'),
        actions: <Widget>[
          TextButton(
              onPressed: () => Get.back(),
              child: Text('Cancelar',
                  style: Get.textTheme.subtitle2.apply(fontWeightDelta: 2))),
          TextButton(
              onPressed: () => control.falleceMascota(true),
              child: Text('Falleció mi mascota',
                  style: Get.textTheme.subtitle2
                      .apply(fontWeightDelta: 2, color: colorRed))),
        ],
      ),
    );
  }

  _errorFallecido(MascotaDrawerController control) {
    return FadeIn(
      child: AlertDialog(
        title: null, //Text('Fallecido'),
        content: Text('Cometiste un error?'),
        actions: <Widget>[
          TextButton(
            onPressed: () => Get.back(),
            child: Text('Cancelar',
                style: Get.textTheme.subtitle2.apply(fontWeightDelta: 2)),
          ),
          TextButton(
              onPressed: () => control.falleceMascota(false),
              child: Text('Sí, cometí un error',
                  style: Get.textTheme.subtitle2
                      .apply(fontWeightDelta: 2, color: colorMain))),
        ],
      ),
    );
  }

  _eliminar(MascotaDrawerController control) {
    return FadeIn(
      child: AlertDialog(
        title: Text('Eliminar'),
        content: Text('Seguro que desea eliminar a ?'), //${mascota.name}
        actions: <Widget>[
          TextButton(
              onPressed: () => Get.back(),
              child: Text('Cancelar',
                  style: Get.textTheme.subtitle2.apply(fontWeightDelta: 2))),
          TextButton(
              onPressed: () => control.eliminaMascota(),
              child: Text('Sí, eliminar',
                  style: Get.textTheme.subtitle2
                      .apply(fontWeightDelta: 2, color: colorRed))),
        ],
      ),
    );
  }
}

import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_it/get_it.dart';
import 'package:proypet/src/models/mascota/mascota_model.dart';
import 'package:proypet/src/provider/home_store.dart';
import 'package:proypet/src/views/pages/mascota/mascota_editar_page.dart';
import 'package:proypet/src/services/mascota_provider.dart';
import 'package:proypet/src2/app/styles/styles.dart';

class MascotaDrawer extends StatefulWidget {
  final MascotaModel modelMascota;
  MascotaDrawer({@required this.modelMascota});

  @override
  _MascotaDrawerState createState() => _MascotaDrawerState(mascota: modelMascota);
}

class _MascotaDrawerState extends State<MascotaDrawer> {
  MascotaModel mascota;
  _MascotaDrawerState({@required this.mascota});
  final Color active = Colors.grey.shade800;
  final Color divider = Colors.grey.shade600;
  final mascotaProvider = MascotaProvider();

  HomeStore homeStore;
  @override
  void initState() {
    super.initState();
    homeStore = GetIt.I.get<HomeStore>();
  }

  @override
  Widget build(BuildContext context) {
    return ClipPath(
      child: Drawer(
        child: Container(
          padding: const EdgeInsets.only(left: 16.0, right: 16.0),
          decoration: BoxDecoration(color: Theme.of(context).scaffoldBackgroundColor, boxShadow: [BoxShadow(color: Colors.black45)]),
          width: 300,
          child: SafeArea(
            child: SingleChildScrollView(
              physics: BouncingScrollPhysics(),
              child: dataList(),
            ),
          ),
        ),
      ),
    );
  }

  dataList() {
    return Column(
      children: <Widget>[
        SizedBox(height: 40.0),
        Text(mascota.name,
            style: TextStyle(fontWeight: FontWeight.w400, fontSize: 24.0, letterSpacing: 3.0, color: Theme.of(context).textTheme.subtitle2.color)),
        SizedBox(height: 20.0),
        Divider(),
        ListTile(
            leading: Icon(Icons.edit, color: Theme.of(context).textTheme.subtitle2.color),
            title: Text('Editar datos', style: TextStyle(fontWeight: FontWeight.w400)),
            onTap: () => Get.to(MascotaEditarPage(mascotaData: mascota))),
        ListTile(
            leading: Icon(Icons.bookmark, color: Theme.of(context).textTheme.subtitle2.color),
            title: Text('Fallecido', style: TextStyle(fontWeight: FontWeight.w400)),
            onTap: () => showDialog(
                context: context,
                builder: (BuildContext context) {
                  return (mascota.status != 0) ? _fallecido() : _errorFallecido();
                })),
        ListTile(
            leading: Icon(Icons.delete_forever, color: colorRed),
            title: Text('Eliminar mascota', style: TextStyle(color: colorRed, fontWeight: FontWeight.w400)),
            onTap: () => showDialog(context: context, builder: (BuildContext context) => _eliminar()))
      ],
    );
  }

/////////////////////////////////////////////////
  _eliminar() {
    return FadeIn(
      child: AlertDialog(
        backgroundColor: Theme.of(context).backgroundColor,
        title: Text('Eliminar'),
        content: Text('Seguro que desea eliminar a ${mascota.name}?'),
        actions: <Widget>[
          FlatButton(onPressed: () => Get.back(), child: Text('Cancelar', style: Theme.of(context).textTheme.subtitle2.apply(fontWeightDelta: 2))),
          FlatButton(
              onPressed: () => homeStore.eliminaMascota(mascota.id),
              child: Text('Sí, eliminar', style: Theme.of(context).textTheme.subtitle2.apply(fontWeightDelta: 2, color: colorRed))),
        ],
      ),
    );
  }

/////////////////////////////////////////////////
  _fallecido() {
    return FadeIn(
      child: AlertDialog(
        contentPadding: EdgeInsets.symmetric(horizontal: 20.0, vertical: 15.0),
        title: null, //Text('Fallecido'),
        content: Text('Lamentamos la perdida de tu ser querido.'),
        actions: <Widget>[
          FlatButton(onPressed: () => Get.back(), child: Text('Cancelar', style: Theme.of(context).textTheme.subtitle2.apply(fontWeightDelta: 2))),
          FlatButton(
              onPressed: () => homeStore.falleceMascota(mascota, true),
              child: Text('Falleció mi mascota', style: Theme.of(context).textTheme.subtitle2.apply(fontWeightDelta: 2, color: colorRed))),
        ],
      ),
    );
  }

  _errorFallecido() {
    return FadeIn(
      child: AlertDialog(
        title: null, //Text('Fallecido'),
        content: Text('Cometiste un error?'),
        actions: <Widget>[
          FlatButton(
            onPressed: () => Get.back(),
            child: Text('Cancelar', style: Theme.of(context).textTheme.subtitle2.apply(fontWeightDelta: 2)),
          ),
          FlatButton(
              onPressed: () => homeStore.falleceMascota(mascota, false),
              child: Text('Sí, cometí un error', style: Theme.of(context).textTheme.subtitle2.apply(fontWeightDelta: 2, color: colorMain))),
        ],
      ),
    );
  }
/////////////////////////////////////////////////
}

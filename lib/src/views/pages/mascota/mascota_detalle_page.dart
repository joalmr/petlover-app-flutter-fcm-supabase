import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:get/get.dart';
import 'package:get_it/get_it.dart';
import 'package:proypet/src/models/mascota/historia_model.dart';
import 'package:proypet/src/models/mascota/mascota_model.dart';
import 'package:proypet/src/models/mascota/pet_model.dart';
import 'package:proypet/src/provider/home_store.dart';
import 'package:proypet/src/services/mascota_provider.dart';
import 'package:proypet/src/views/components/enddrawer/mascota_drawer.dart';
import 'package:proypet/src/views/components/transicion/fadeView.dart';

import 'package:proypet/src/styles/styles.dart';
import 'package:proypet/src/utils/calcula_edad.dart';
import 'package:proypet/src/utils/icons_map.dart';

class MascotaDetallePage extends StatefulWidget {
  @override
  _MascotaDetallePageState createState() => _MascotaDetallePageState(); //mascota: mascota
}

class _MascotaDetallePageState extends State<MascotaDetallePage> {
  final GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey<ScaffoldState>();
  final mascotaProvider = MascotaProvider();

  HomeStore homeStore;
  // bool cargandoBuild = true;

  @override
  void initState() {
    super.initState();
    homeStore = GetIt.I.get<HomeStore>();
  }

  // @override
  // void dispose() {
  //   super.dispose();
  // }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    final String mascotaId = ModalRoute.of(context).settings.arguments;
    homeStore.verMiMascota(mascotaId);
  }

  @override
  Widget build(BuildContext context) {
    return Observer(
      builder: (_) => homeStore.cargandoMiPet
          ? Scaffold(body: LinearProgressIndicator())
          : Scaffold(
              key: _scaffoldKey,
              body: FadeView(child: onDetail(homeStore.miPet)),
              endDrawer: MascotaDrawer(
                modelMascota: homeStore.miMascota,
              ),
            ),
    );
  }

  Widget onDetail(PetModel petModel) {
    MascotaModel mascota = petModel.pet;
    return Stack(
      children: <Widget>[
        Container(
          // height: MediaQuery.of(context).size.height,
          child: SingleChildScrollView(
            child: Stack(
              children: <Widget>[
                Container(
                  child: Image(
                    image: CachedNetworkImageProvider(mascota.picture),
                    height: 350,
                    width: double.infinity,
                    fit: BoxFit.cover,
                  ),
                ),
                Container(
                  margin: EdgeInsets.only(top: 330.0, bottom: 7.5, left: 5.0, right: 5.0),
                  height: MediaQuery.of(context).size.height - 330.0,
                  decoration: BoxDecoration(
                    borderRadius: borderRadius,
                    color: Theme.of(context).backgroundColor,
                  ),
                  child: SingleChildScrollView(
                    physics: BouncingScrollPhysics(),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: <Widget>[
                        datoMascota(mascota),
                        listaHistorial(context, petModel.history),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
        Positioned(
          top: 0,
          left: 0,
          right: 0,
          child: AppBar(
            backgroundColor: Colors.transparent,
            elevation: 0,
            centerTitle: true,
            title: Text("", style: Theme.of(context).textTheme.subtitle1.apply(fontWeightDelta: 2)),
            actions: <Widget>[
              IconButton(icon: Icon(Icons.settings), onPressed: () => _scaffoldKey.currentState.openEndDrawer()),
            ],
          ),
        )
      ],
    );
  }

  datoMascota(pet) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Text(pet.name, style: Theme.of(context).textTheme.headline6.copyWith(fontWeight: FontWeight.w900)),
              Text(pet.breedName, style: Theme.of(context).textTheme.subtitle1.copyWith(fontWeight: FontWeight.bold)),
              (pet.status != 0) ? Text(calculateAge(DateTime.parse(pet.birthdate)), style: Theme.of(context).textTheme.subtitle2) : SizedBox(height: 0)
            ],
          ),
          Column(
            children: <Widget>[
              Text('${pet.weight} kg.', style: Theme.of(context).textTheme.subtitle1.apply(fontWeightDelta: 2)),
              (pet.status == 0)
                  ? Text('Fallecido', style: Theme.of(context).textTheme.subtitle2.apply(fontWeightDelta: 2).copyWith(fontStyle: FontStyle.italic))
                  : SizedBox(height: 0)
            ],
          )
        ],
      ),
    );
  }

  listaHistorial(BuildContext context, List<HistoriaModel> historias) {
    return ListView.builder(
        physics: NeverScrollableScrollPhysics(),
        shrinkWrap: true,
        itemCount: historias.length,
        itemBuilder: (context, int index) {
          return FlatButton(
            onPressed: () => Get.toNamed('detallehistoriamascota', arguments: {
              "detalle": historias[index].details,
              "precio": historias[index].amount,
              "proximacita": historias[index].nextdate,
              "motivo": historias[index].reason
            }),
            child: Padding(
              padding: const EdgeInsets.symmetric(vertical: 10.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  Expanded(
                    child: Row(
                      children: <Widget>[
                        CircleAvatar(
                          backgroundColor: Colors.transparent,
                          backgroundImage: CachedNetworkImageProvider(historias[index].establishmentLogo),
                          radius: 20.0,
                        ),
                        SizedBox(width: 7.0),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            Text(
                              historias[index].establishment,
                              style: Theme.of(context).textTheme.subtitle2.apply(fontWeightDelta: 2),
                            ),
                            iconosHistoria(historias[index].details)
                          ],
                        ),
                      ],
                    ),
                  ),
                  Column(
                    children: <Widget>[
                      Text(
                        historias[index].createdAt.toString().split(' ')[0],
                        style: Theme.of(context).textTheme.subtitle2.apply(fontWeightDelta: 2).copyWith(fontSize: 12.0),
                      ),
                      Text(
                        historias[index].createdAt.toString().split(' ')[1],
                        style: Theme.of(context).textTheme.subtitle2.apply(fontWeightDelta: 2),
                        textAlign: TextAlign.center,
                      ),
                    ],
                  ),
                ],
              ),
            ),
          );
        });
  }

  iconosHistoria(json) {
    List<String> listaIcon = [];
    if (json.toString().contains("grooming")) listaIcon.add("grooming");
    if (json.toString().contains("surgery")) listaIcon.add("surgery");
    if (json.toString().contains("deworming")) listaIcon.add("deworming");
    if (json.toString().contains("vaccination")) listaIcon.add("vaccination");
    if (json.toString().contains("consultation")) listaIcon.add("consultation");

    return Row(
      children: <Widget>[
        (json.toString().contains("grooming"))
            ? Padding(
                padding: const EdgeInsets.symmetric(horizontal: 2.0, vertical: 2.0),
                child: Icon(iconMap["grooming"], size: 18.0, color: Theme.of(context).textTheme.subtitle2.color),
              )
            : SizedBox(),
        (json.toString().contains("surgery"))
            ? Padding(
                padding: const EdgeInsets.symmetric(horizontal: 2.0, vertical: 2.0),
                child: Icon(iconMap["surgery"], size: 18.0, color: Theme.of(context).textTheme.subtitle2.color),
              )
            : SizedBox(),
        (json.toString().contains("deworming"))
            ? Padding(
                padding: const EdgeInsets.symmetric(horizontal: 2.0, vertical: 2.0),
                child: Icon(iconMap["deworming"], size: 18.0, color: Theme.of(context).textTheme.subtitle2.color),
              )
            : SizedBox(),
        (json.toString().contains("vaccination"))
            ? Padding(
                padding: const EdgeInsets.symmetric(horizontal: 2.0, vertical: 2.0),
                child: Icon(iconMap["vaccination"], size: 18.0, color: Theme.of(context).textTheme.subtitle2.color),
              )
            : SizedBox(),
        (json.toString().contains("consultation"))
            ? Padding(
                padding: const EdgeInsets.symmetric(horizontal: 2.0, vertical: 2.0),
                child: Icon(iconMap["consultation"], size: 18.0, color: Theme.of(context).textTheme.subtitle2.color),
              )
            : SizedBox(),
      ],
    );
  }
}

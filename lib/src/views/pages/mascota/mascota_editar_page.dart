import 'dart:async';
import 'dart:io';
import 'package:animate_do/animate_do.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:datetime_picker_formfield/datetime_picker_formfield.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:get/get.dart';
import 'package:get_it/get_it.dart';
import 'package:image_cropper/image_cropper.dart';
import 'package:image_picker/image_picker.dart';
import 'package:intl/intl.dart';
import 'package:proypet/src/models/mascota/mascota_model.dart';
import 'package:proypet/src/models/raza/raza_model.dart';
import 'package:proypet/src/store/home_store.dart';
import 'package:proypet/src2/app/views/components/appbar_menu.dart';
import 'package:proypet/src2/app/views/components/form_control/button_primary.dart';
import 'package:proypet/src2/app/views/components/form_control/ddl_control.dart';
import 'package:proypet/src2/app/views/components/form_control/text_from.dart';
import 'package:proypet/src2/app/views/components/transition/fadeViewSafeArea.dart';

import 'package:proypet/src2/app/styles/styles.dart';
import 'package:proypet/src2/data/services/mascota_service.dart';
import 'package:proypet/src2/data/services/raza_servicio.dart';
import 'package:select_dialog/select_dialog.dart';

final tipopet = [
  {'id': '1', 'name': 'Gato'},
  {'id': '2', 'name': 'Perro'}
];
final tiposex = [
  {'id': '0', 'name': 'Hembra'},
  {'id': '1', 'name': 'Macho'}
];

class MascotaEditarPage extends StatefulWidget {
  final MascotaModel mascotaData;
  MascotaEditarPage({@required this.mascotaData});

  @override
  _MascotaEditarPageState createState() => _MascotaEditarPageState(mascotaData: mascotaData);
}

class _MascotaEditarPageState extends State<MascotaEditarPage> {
  MascotaModel mascotaData;
  _MascotaEditarPageState({@required this.mascotaData});

  final formKey = GlobalKey<FormState>();
  final scaffoldKey = GlobalKey<ScaffoldState>();
  final mascotaProvider = new MascotaService();
  final razaProvider = new RazaService();

  bool btnBool = true;
  File foto;

  RazaModel razaLista;

  Future<RazaModel> traeRazas() => razaProvider.getBreed(mascotaData.specieId.toString());

  TextEditingController _inputPetController = new TextEditingController();
  Breed datoSeleccionado;

  obtenerRaza() async {
    razaLista = await razaProvider.getBreed(mascotaData.specieId.toString());
    var item = razaLista.breeds.where((x) => x.id == mascotaData.breedId);
    datoSeleccionado = item.first;
    _inputPetController.text = item.first.name;
    setState(() {});
  }

  HomeStore homeStore;

  @override
  void initState() {
    super.initState();
    homeStore = GetIt.I.get<HomeStore>();

    homeStore.setMascotaIdPet(mascotaData.id);
    homeStore.setMascotaNombre(mascotaData.name);
    homeStore.setMascotaEspecie(mascotaData.specieId); //no modificable
    homeStore.setMascotaRaza(mascotaData.breedId);
    homeStore.setMascotaFecha(mascotaData.birthdate);
    homeStore.setMascotaGenero(mascotaData.genre);

    obtenerRaza();
  }

  @override
  void dispose() {
    super.dispose();
    homeStore.setMascotaNombre('');
    homeStore.setMascotaFecha('');
    homeStore.setMascotaEspecie(1);
    homeStore.setMascotaRaza(null);
    homeStore.setMascotaGenero(0);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: scaffoldKey,
      appBar: appbar(null, 'Editar mascota', null),
      body: (razaLista == null)
          ? LinearProgressIndicator()
          : FadeViewSafeArea(
              child: SingleChildScrollView(
                child: Form(
                  key: formKey,
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        SizedBox(height: 25.0),
                        Padding(
                          padding: const EdgeInsets.symmetric(vertical: 5.0),
                          child: Center(
                            child: Stack(
                              children: <Widget>[
                                CircleAvatar(backgroundImage: _mostrarFoto(), radius: 80.0),
                                Positioned(
                                    bottom: 1.5,
                                    right: 10.0,
                                    child: CircleAvatar(
                                      child: IconButton(
                                        icon: Icon(Icons.camera_enhance, color: Colors.white),
                                        onPressed: () => showDialog(
                                            context: context,
                                            builder: (BuildContext context) {
                                              return FadeIn(
                                                child: SimpleDialog(
                                                  children: <Widget>[
                                                    SimpleDialogOption(child: const Text('Tomar foto'), onPressed: _tomarFoto),
                                                    SimpleDialogOption(child: const Text('Seleccionar foto'), onPressed: _seleccionarFoto),
                                                  ],
                                                ),
                                              );
                                            }),
                                      ),
                                      backgroundColor: colorMain,
                                      radius: 22.0,
                                    ))
                              ],
                            ),
                          ),
                        ),
                        FormularioText(
                          labelText: 'Nombre',
                          hintText: 'Nombre de mascota',
                          icon: Icons.pets,
                          obscureText: false,
                          onChanged: (value) => homeStore.setMascotaNombre(value),
                          textCap: TextCapitalization.words,
                          valorInicial: mascotaData.name,
                          boardType: TextInputType.text,
                        ),
                        Padding(
                          padding: const EdgeInsets.only(top: 10, bottom: 10),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: <Widget>[
                              Text('Seleccione tipo de mascota'),
                              SizedBox(height: 7.5),
                              ddlMainOut(context, mascotaData.specieId.toString(), tipopet, null, mascotaData.specieName),
                            ],
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(top: 10, bottom: 10),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: <Widget>[
                              Text('Seleccione raza'),
                              SizedBox(height: 7.5),
                              TextField(
                                enableInteractiveSelection: false,
                                controller: _inputPetController,
                                onTap: () {
                                  FocusScope.of(context).requestFocus(new FocusNode());
                                  _razasPet();
                                },
                                cursorColor: colorMain,
                                decoration: InputDecoration(
                                  suffixIcon: Padding(
                                    padding: const EdgeInsets.only(right: 10),
                                    child: Icon(Icons.keyboard_arrow_down, color: colorMain),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(top: 10, bottom: 10),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: <Widget>[
                              Text('Fecha de nacimiento'),
                              SizedBox(height: 7.5),
                              _crearFecha(context),
                            ],
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(top: 10, bottom: 10),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: <Widget>[
                              Text('Sexo'),
                              SizedBox(height: 7.5),
                              _sexoEdit(),
                            ],
                          ),
                        ),
                        SizedBox(height: 25.0),
                        buttonPri('Guardar cambios', _onEdit),
                        SizedBox(height: 10.0),
                      ],
                    ),
                  ),
                ),
              ),
            ),
    );
  }

  Future<List<Breed>> _getData(String filter) async {
    // print(filter);
    List<Breed> lista = List<Breed>();
    razaLista.breeds.forEach((element) {
      var palabra = element.name;
      bool contiene = palabra.toLowerCase().contains(filter.toLowerCase()); //.contains(filter);
      if (contiene) {
        lista.add(element);
      }
    });

    var models = lista;
    return models;
  }

  _razasPet() {
    return SelectDialog.showModal<Breed>(
      context,
      label: "Razas",
      titleStyle: Get.textTheme.subtitle1,
      showSearchBox: true,
      emptyBuilder: (context) => Center(child: Text('No se encontró')),
      errorBuilder: (context, exception) => Center(child: Text('Oops!')),
      items: razaLista.breeds,
      selectedValue: datoSeleccionado,
      searchBoxDecoration: InputDecoration(hintText: 'Buscar raza', prefixIcon: Icon(Icons.search, color: colorMain)),
      onFind: (String filter) => _getData(filter),
      itemBuilder: (BuildContext context, Breed item, bool isSelected) {
        return Container(
          decoration: !isSelected ? null : BoxDecoration(borderRadius: BorderRadius.circular(5), color: colorMain),
          child: ListTile(
            selected: isSelected,
            title: Text(
              item.name,
              style: isSelected ? Get.textTheme.subtitle2.copyWith(color: Colors.white) : Get.textTheme.subtitle2,
            ),
          ),
        );
      },
      onChange: (selected) {
        homeStore.setMascotaRaza(selected.id);
        setState(() {
          datoSeleccionado = selected;
          _inputPetController.text = selected.name;
          // mascotaData.breedId = selected.id;
        });
      },
    );
  }

  _mostrarFoto() {
    if (foto != null)
      return FileImage(foto);
    else
      return CachedNetworkImageProvider(mascotaData.picture);
  }

  _seleccionarFoto() async {
    _procesarImagen(ImageSource.gallery);
  }

  _tomarFoto() async {
    _procesarImagen(ImageSource.camera);
  }

  _procesarImagen(ImageSource origen) async {
    var imagen = await ImagePicker.pickImage(source: origen);

    File croppedFile = await ImageCropper.cropImage(
      sourcePath: imagen.path,
      maxHeight: 400,
      maxWidth: 400,
      cropStyle: CropStyle.circle,
      compressFormat: ImageCompressFormat.jpg,
      compressQuality: 80,
      aspectRatioPresets: [
        CropAspectRatioPreset.square,
      ],
      androidUiSettings: AndroidUiSettings(
        toolbarTitle: 'Recortar',
        toolbarColor: colorMain,
        toolbarWidgetColor: Colors.white,
        initAspectRatio: CropAspectRatioPreset.square,
        lockAspectRatio: true,
        activeControlsWidgetColor: colorMain,
        showCropGrid: false,
      ),
      iosUiSettings: IOSUiSettings(
        title: 'Recortar',
        minimumAspectRatio: 1.0,
        aspectRatioLockEnabled: true,
      ),
    );

    if (foto != null) {
      //limpieza
    }

    setState(() => foto = croppedFile);
    Get.back();
  }

  Widget _sexoEdit() {
    return Observer(
        builder: (_) => ddlMain(context, homeStore.generoMascota.toString(), tiposex, (opt) {
              homeStore.setMascotaGenero(int.tryParse(opt));
            }));
  }

  Widget _crearFecha(BuildContext context) {
    final format = DateFormat("yyyy-MM-dd");
    var currentValue = DateTime.parse(mascotaData.birthdate);
    return DateTimeField(
      initialValue: currentValue,
      format: format,
      onChanged: (dt) => homeStore.setMascotaFecha(dt.toString()),
      enableInteractiveSelection: false,
      cursorColor: colorMain,
      onShowPicker: (context, currentValue) {
        return showDatePicker(
          context: context,
          initialDate: currentValue ?? DateTime.now(),
          firstDate: new DateTime(DateTime.now().year - 25),
          lastDate: DateTime.now(),
          initialDatePickerMode: DatePickerMode.day,
          builder: (context, child) => Theme(
              data: ThemeData.light().copyWith(
                  accentColor: colorMain,
                  colorScheme: ColorScheme.light(
                    primary: colorMain,
                    onPrimary: Colors.white,
                    surface: colorMain,
                    onSurface: Get.textTheme.subtitle2.color,
                  ),
                  dialogBackgroundColor: Theme.of(context).backgroundColor,
                  buttonTheme: ButtonThemeData(textTheme: ButtonTextTheme.primary)),
              child: child),
        );
      },
      decoration: InputDecoration(
        hintText: 'Fecha de nacimiento',
        prefixIcon: Icon(Icons.calendar_today, color: colorMain),
        suffixIcon: Icon(null),
      ),
    );
  }

  void _onEdit() => homeStore.mascotaEdit(foto);
}

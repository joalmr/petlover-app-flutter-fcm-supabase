import 'dart:async';
import 'dart:io';
import 'package:animate_do/animate_do.dart';
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
import 'package:proypet/src/services/mascota_provider.dart';
import 'package:proypet/src/services/raza_provider.dart';
import 'package:proypet/src2/app/views/components/appbar_menu.dart';
import 'package:proypet/src2/app/views/components/form_control/button_primary.dart';
import 'package:proypet/src2/app/views/components/form_control/ddl_control.dart';
import 'package:proypet/src2/app/views/components/form_control/text_from.dart';
import 'package:proypet/src2/app/views/components/transition/fadeViewSafeArea.dart';

import 'package:proypet/src2/app/styles/styles.dart';

import 'package:select_dialog/select_dialog.dart';

final tipopet = [
  {'id': '1', 'name': 'Gato'},
  {'id': '2', 'name': 'Perro'}
];
final tiposex = [
  {'id': '0', 'name': 'Hembra'},
  {'id': '1', 'name': 'Macho'}
];

class MascotaAgregarPage extends StatefulWidget {
  @override
  _MascotaAgregarPageState createState() => _MascotaAgregarPageState();
}

class _MascotaAgregarPageState extends State<MascotaAgregarPage> {
  String _fecha = '';
  // final _shape = BorderRadius.circular(10.0);
  final formKey = GlobalKey<FormState>();
  final scaffoldKey = GlobalKey<ScaffoldState>();
  final mascotaProvider = new MascotaProvider();
  final razaProvider = new RazaProvider();
  TextEditingController _inputFechaController = new TextEditingController();

  // bool btnBool = true;
  File foto;
  String datoPet = tipopet[0]['id'];

  MascotaModel mascotaData = new MascotaModel();

  RazaModel razaLista;

  Future<RazaModel> traeRazas() => razaProvider.getBreed(datoPet);

  TextEditingController _inputPetController = new TextEditingController();
  Breed datoSeleccionado;

  obtenerRaza() async {
    razaLista = await razaProvider.getBreed(homeStore.especieMascotaID.toString());
    datoSeleccionado = razaLista.breeds.first;
    _inputPetController.text = datoSeleccionado.name;
    homeStore.setMascotaRaza(razaLista.breeds.first.id);
    setState(() {});
  }

  HomeStore homeStore;

  @override
  void initState() {
    super.initState();
    homeStore = GetIt.I.get<HomeStore>();

    homeStore.setMascotaEspecie(int.tryParse(datoPet));
    homeStore.setMascotaGenero(0);

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
    // mascotaData.specieId = int.tryParse(datoPet);
    return Scaffold(
      key: scaffoldKey,
      appBar: appbar(null, 'Agregar mascota', null),
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
                                                    SimpleDialogOption(
                                                      child: const Text('Tomar foto'),
                                                      onPressed: _tomarFoto,
                                                    ),
                                                    SimpleDialogOption(
                                                      child: const Text('Seleccionar foto'),
                                                      onPressed: _seleccionarFoto,
                                                    ),
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
                        SizedBox(height: 10.0),
                        FormularioText(
                          labelText: 'Nombre',
                          hintText: 'Nombre de mascota',
                          icon: Icons.pets,
                          obscureText: false,
                          onChanged: (value) => homeStore.setMascotaNombre(value),
                          textCap: TextCapitalization.words,
                          valorInicial: null,
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
                              Observer(
                                builder: (_) => ddlMain(context, homeStore.especieMascotaID.toString(), tipopet, (opt) {
                                  homeStore.setMascotaEspecie(int.tryParse(opt));
                                  obtenerRaza();
                                }),
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
                              _sexo(),
                            ],
                          ),
                        ),
                        SizedBox(height: 25.0),
                        Observer(builder: (_) => buttonPri('Agregar mascota', _onAdd)),
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
      titleStyle: Theme.of(context).textTheme.subtitle1,
      showSearchBox: true,
      emptyBuilder: (context) => Center(child: Text('No se encontró')),
      errorBuilder: (context, exception) => Center(child: Text('Oops!')),
      items: razaLista.breeds,
      selectedValue: datoSeleccionado,
      searchBoxDecoration: InputDecoration(
        hintText: 'Buscar raza',
        prefixIcon: Icon(Icons.search, color: colorMain),
      ),
      onFind: (String filter) => _getData(filter),
      itemBuilder: (BuildContext context, Breed item, bool isSelected) {
        return Container(
          decoration: !isSelected ? null : BoxDecoration(borderRadius: BorderRadius.circular(5), color: colorMain),
          child: ListTile(
            selected: isSelected,
            title: Text(
              item.name,
              style: isSelected ? Theme.of(context).textTheme.subtitle2.copyWith(color: Colors.white) : Theme.of(context).textTheme.subtitle2,
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

  Widget _crearFecha(BuildContext context) {
    //petData
    return TextFormField(
        enableInteractiveSelection: false,
        controller: _inputFechaController,
        onTap: () {
          FocusScope.of(context).requestFocus(new FocusNode());
          _selectDate(context); //petData
        },
        // onChanged: (value) => homeStore.setMascotaFecha(value),
        // onSaved: (value) => homeStore.setMascotaFecha(value), //mascotaData.birthdate = value,
        cursorColor: colorMain,
        decoration: InputDecoration(
          hintText: 'Fecha de nacimiento',
          prefixIcon: Icon(Icons.calendar_today, color: colorMain),
        ));
  }

  _selectDate(BuildContext context) async {
    //petData
    DateTime picked = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
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
                onSurface: Theme.of(context).textTheme.subtitle2.color,
              ),
              dialogBackgroundColor: Theme.of(context).backgroundColor,
              buttonTheme: ButtonThemeData(textTheme: ButtonTextTheme.primary)),
          child: child),
    );

    if (picked != null) {
      final f = new DateFormat('yyyy-MM-dd');
      setState(() {
        _fecha = f.format(picked);
        _inputFechaController.text = _fecha;
        homeStore.setMascotaFecha(_fecha);
      });
    }
  }

  Widget _sexo() {
    return Observer(builder: (_) => ddlMain(context, homeStore.generoMascota.toString(), tiposex, (opt) => homeStore.setMascotaGenero(int.tryParse(opt))));
  }

  _mostrarFoto() {
    //petData
    if (foto != null) return FileImage(foto);
    return AssetImage('images/no-image.png');
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
        ));

    if (foto != null) {
      //limpieza
    }

    setState(() => foto = croppedFile);
    Get.back();
    // Navigator.pop(context);
  }

  void _onAdd() => homeStore.mascotaAdd(foto);
}

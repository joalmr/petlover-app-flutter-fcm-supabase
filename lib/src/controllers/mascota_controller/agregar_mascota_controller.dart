import 'dart:io';
import 'dart:math';

import 'package:datetime_picker_formfield/datetime_picker_formfield.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_cropper/image_cropper.dart';
import 'package:image_picker/image_picker.dart';
import 'package:intl/intl.dart';
import 'package:proypet/src/app/styles/styles.dart';
import 'package:proypet/src/app/views/components/form_control/ddl_control.dart';
import 'package:proypet/src/app/views/components/snackbar.dart';
import 'package:proypet/src/app/views/components/thx_page.dart';
import 'package:proypet/src/app/views/pages/mascota/data/sexo_pet.dart';
import 'package:proypet/src/app/views/pages/mascota/data/tipo_pet.dart';
import 'package:proypet/src/controllers/home_controller/home_controller.dart';
import 'package:proypet/src/data/models/model/raza/raza_model.dart';
import 'package:proypet/src/data/models/update/mascota/pet_model.dart';
import 'package:proypet/src/data/services/mascota_service.dart';
import 'package:proypet/src/data/services/raza_servicio.dart';
import 'package:proypet/src/utils/add_msg.dart';
import 'package:select_dialog/select_dialog.dart';

class MascotaAgregarController extends GetxController {
  final homeC = Get.find<HomeController>();
  final mascotaService = MascotaService();
  final razaService = RazaService();

  RxBool loading = true.obs;
  RxBool cargaRaza = false.obs;

  RazaModel razaLista;
  Breed razaSeleccionada;
  String razaName;

  TextEditingController razaTextC = TextEditingController();
  //
  Rx<File> _foto = File('').obs;
  RxString _nombre = ''.obs;
  RxInt _especie = int.tryParse(tipopet[0]['id']).obs;
  int razaId;
  RxString _fecha = ''.obs;
  RxInt _sexo = int.parse(tiposex[0]['id']).obs; // = 0.obs;

  RxBool btnCarga = false.obs;

  final format = DateFormat("yyyy-MM-dd");

  set foto(File value) => _foto.value = value;
  File get foto => _foto.value;

  set nombre(String value) => _nombre.value = value;
  String get nombre => _nombre.value;

  set fecha(String value) => _fecha.value = value;
  String get fecha => _fecha.value;

  set sexo(int value) => _sexo.value = value;
  int get sexo => _sexo.value;

  set especie(int value) => _especie.value = value;
  int get especie => _especie.value;

  @override
  void onInit() {
    super.onInit();
    _obtenerRaza();
    fecha = format.format(DateTime.now());
  }

  @override
  void onClose() {
    super.onClose();
    foto.delete();
    nombre = '';
    fecha = '';
  }

  obtenerRaza() {
    cargaRaza.value = true;
    _obtenerRaza();
  }

  void _obtenerRaza() async {
    razaLista = await razaService.getBreed(especie.toString());
    razaSeleccionada = razaLista.breeds.first;
    razaName = razaLista.breeds.first.name;
    razaId = razaLista.breeds.first.id;
    razaTextC.text = razaName;
    loading.value = false;
    cargaRaza.value = false;
  }

  razasPet(context) {
    FocusScope.of(context).requestFocus(new FocusNode());
    _razasPet(context);
  }

  _razasPet(context) {
    return SelectDialog.showModal<Breed>(
      context,
      label: "Razas",
      titleStyle: Get.textTheme.subtitle1,
      showSearchBox: true,
      emptyBuilder: (context) => Center(child: Text('No se encontró')),
      errorBuilder: (context, exception) => Center(child: Text('Oops!')),
      items: razaLista.breeds,
      selectedValue: razaSeleccionada,
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
        razaName = selected.name;
        razaId = selected.id;
        razaTextC.text = razaName;
      },
    );
  }

  Future<List<Breed>> _getData(String filter) async {
    List<Breed> lista = List<Breed>();
    razaLista.breeds.forEach((element) {
      var palabra = element.name;
      bool contiene = palabra.toLowerCase().contains(filter.toLowerCase());
      if (contiene) {
        lista.add(element);
      }
    });

    var models = lista;
    return models;
  }

  mostrarFoto() {
    return _mostrarFoto();
  }

  _mostrarFoto() {
    if (foto.path != '') return FileImage(foto);
    return AssetImage('images/no-image.png');
  }

  seleccionarFoto() {
    return _seleccionarFoto();
  }

  _seleccionarFoto() async {
    _procesarImagen(ImageSource.gallery);
  }

  tomarFoto() {
    return _tomarFoto();
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

    // if (foto != null) {} //limpieza
    foto = croppedFile;
    Get.back();
  }

  Widget crearFecha(BuildContext context) {
    return DateTimeField(
      initialValue: DateTime.now(),
      format: format,
      onChanged: (dt) => fecha = dt.toString(),
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

  Widget sexoEdit(context) {
    return ddlMain(context, sexo.toString(), tiposex, (opt) {
      sexo = int.tryParse(opt);
    });
  }

  void mascotaAdd() {
    _mascotaAdd();
  }

  bool get sinDatos => nombre.isEmpty && fecha.isEmpty;
  bool get sinNombreMascota => nombre.isEmpty && fecha.isNotEmpty;
  bool get sinFechaMascota => nombre.isNotEmpty && fecha.isEmpty;

  Future<void> _mascotaAdd() async {
    btnCarga.value = true;

    if (sinDatos) {
      mostrarSnackbar('Ingrese datos de la mascota.', colorRed);
      btnCarga.value = false;
    } else if (sinNombreMascota || sinFechaMascota) {
      if (sinNombreMascota) mostrarSnackbar('Ingrese nombre de la mascota.', colorRed);
      if (sinFechaMascota) mostrarSnackbar('Ingrese nacimiento de la mascota.', colorRed);
      btnCarga.value = false;
    } else {
      MascotaModel2 mascotaData = new MascotaModel2();
      mascotaData.name = nombre;
      mascotaData.birthdate = fecha;
      mascotaData.genre = sexo;
      mascotaData.specieId = especie;
      mascotaData.breedId = razaId;

      Map resp = await mascotaService.savePet(mascotaData, foto);

      if (resp['ok']) {
        homeC.getSummary();
        btnCarga.value = false;
        await Get.to(
          ThxPage(
            resp['petImg'],
            thxPet[Random().nextInt(thxPet.length)],
          ),
        );
      } else {
        mostrarSnackbar('Oops, intentalo más tarde.', colorRed);
        btnCarga.value = false;
      }
    }
  }
  //
}

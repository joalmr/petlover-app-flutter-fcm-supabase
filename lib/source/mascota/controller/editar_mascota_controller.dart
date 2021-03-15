import 'dart:async';
import 'dart:io';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:datetime_picker_formfield/datetime_picker_formfield.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_cropper/image_cropper.dart';
import 'package:image_picker/image_picker.dart';
import 'package:intl/intl.dart';
import 'package:proypet/components/form_control/ddl_control.dart';
import 'package:proypet/components/snackbar.dart';
import 'package:proypet/design/styles/styles.dart';
import 'package:proypet/source/home/controller/home_controller.dart';
import 'package:proypet/source/mascota/view/data/sexo_pet.dart';
import 'package:proypet/source/breeds/model/raza_model.dart';
import 'package:proypet/source/mascota/service/mascota_service.dart';
import 'package:proypet/source/mascota/service/pet_service.dart';
import 'package:proypet/source/breeds/service/raza_servicio.dart';
import 'package:select_dialog/select_dialog.dart';

import 'detalle_mascota_controller.dart';

class MascotaEditarController extends GetxController {
  final homeC = Get.find<HomeController>();
  final petC = Get.find<MascotaDetalleController>();
  final mascotaService = new MascotaService();
  final razaService = RazaService();
  final petService = new PetService();

  RxBool loading = true.obs;

  String petId;

  RazaModel razaLista;
  Breed razaSeleccionada;
  String razaName;

  TextEditingController razaTextC = TextEditingController();

  Rx<File> _foto = File('').obs;
  RxString _nombre = ''.obs;
  int razaId;
  RxString _fecha = ''.obs;
  RxInt _sexo = 0.obs;

  RxBool btnCarga = false.obs;

  set foto(File value) => _foto.value = value;
  File get foto => _foto.value;

  set nombre(String value) => _nombre.value = value;
  String get nombre => _nombre.value;

  set fecha(String value) => _fecha.value = value;
  String get fecha => _fecha.value;

  set sexo(int value) => _sexo.value = value;
  int get sexo => _sexo.value;

  @override
  void onInit() {
    super.onInit();
    _obtenerRaza();
    _iniciaValores();

    petId = petC.mascotaId;
  }

  _iniciaValores() {
    nombre = petC.pet.name;
    fecha = petC.pet.birthdate;
    razaId = petC.pet.breedId;
    sexo = petC.pet.genre;
  }

  void _obtenerRaza() async {
    razaLista = await razaService.getBreed(petC.pet.specieId.toString());
    var item = razaLista.breeds.where((x) => x.id == petC.pet.breedId);
    razaSeleccionada = item.first;
    razaName = item.first.name;
    razaTextC.text = razaName;
    loading.value = false;
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
      searchBoxDecoration: InputDecoration(
          hintText: 'Buscar raza',
          prefixIcon: Icon(Icons.search, color: colorMain)),
      onFind: (String filter) => _getData(filter),
      itemBuilder: (BuildContext context, Breed item, bool isSelected) {
        return Container(
          decoration: !isSelected
              ? null
              : BoxDecoration(
                  borderRadius: BorderRadius.circular(5), color: colorMain),
          child: ListTile(
            selected: isSelected,
            title: Text(
              item.name,
              style: isSelected
                  ? Get.textTheme.subtitle2.copyWith(color: Colors.white)
                  : Get.textTheme.subtitle2,
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
    List<Breed> lista = <Breed>[];
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
    if (foto.path.isNotEmpty)
      return FileImage(foto);
    else
      return CachedNetworkImageProvider(petC.pet.picture);
  }

  seleccionarFoto() => _seleccionarFoto();

  _seleccionarFoto() async {
    _procesarImagen(ImageSource.gallery);
  }

  tomarFoto() => _tomarFoto();

  _tomarFoto() async {
    _procesarImagen(ImageSource.camera);
  }

  _procesarImagen(ImageSource origen) async {
    var imagen = await ImagePicker().getImage(source: origen);

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

    foto = croppedFile;
    Get.back();
  }

  Widget crearFecha(BuildContext context) {
    final format = DateFormat("yyyy-MM-dd");
    var currentValue = DateTime.parse(petC.pet.birthdate);
    return DateTimeField(
      initialValue: currentValue,
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
                  buttonTheme:
                      ButtonThemeData(textTheme: ButtonTextTheme.primary)),
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

  bool get sinDatos => nombre.isEmpty && fecha.isEmpty;
  bool get sinNombreMascota => nombre.isEmpty && fecha.isNotEmpty;
  bool get sinFechaMascota => nombre.isNotEmpty && fecha.isEmpty;

  void mascotaEdit() => _mascotaEdit();

  Future<void> _mascotaEdit() async {
    btnCarga.value = true;
    if (sinDatos) {
      mostrarSnackbar('Ingrese datos de la mascota', colorRed);
      btnCarga.value = false;
    } else if (sinNombreMascota || sinFechaMascota) {
      if (sinNombreMascota)
        mostrarSnackbar('Ingrese nombre de la mascota', colorRed);
      if (sinFechaMascota)
        mostrarSnackbar('Ingrese nacimiento de la mascota', colorRed);
      btnCarga.value = false;
    } else {
      petC.pet.name = nombre;
      petC.pet.birthdate = fecha;
      petC.pet.genre = sexo;
      petC.pet.breedId = razaId;
      bool resp = await mascotaService.editPet(petC.pet, foto);
      if (resp) {
        homeC.getSummary();
        btnCarga.value = false;
        mostrarSnackbar("Edición correcta", colorMain);
        Timer(Duration(milliseconds: 1500), () => Get.offAllNamed('/'));
      } else {
        mostrarSnackbar('Oops, intentalo más tarde', colorRed);
        btnCarga.value = false;
      }
    }
  }
}

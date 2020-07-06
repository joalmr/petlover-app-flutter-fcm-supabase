import 'dart:async';
import 'dart:io';
import 'package:animate_do/animate_do.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:datetime_picker_formfield/datetime_picker_formfield.dart';
import 'package:flutter/material.dart';
import 'package:image_cropper/image_cropper.dart';
import 'package:image_picker/image_picker.dart';
import 'package:intl/intl.dart';
import 'package:proypet/src/models/mascota/mascota_model.dart';
import 'package:proypet/src/models/raza/raza_model.dart';
import 'package:proypet/src/providers/mascota_provider.dart';
import 'package:proypet/src/providers/raza_provider.dart';
import 'package:proypet/src/views/components/appbar_menu.dart';
// import 'package:proypet/src/views/components/ddl_control.dart';
import 'package:proypet/src/views/components/form_control/button_primary.dart';
import 'package:proypet/src/views/components/form_control/ddl_control.dart';
import 'package:proypet/src/views/components/form_control/text_from.dart';
import 'package:proypet/src/views/components/snackbar.dart';
import 'package:proypet/src/views/components/transicion/pagina_app.dart';

import 'package:proypet/src/styles/styles.dart';

final tipopet = [
  {
    'id': '1',
    'name': 'Gato',
  },
  {'id': '2', 'name': 'Perro'}
];
final tiposex = [
  {
    'id': '0',
    'name': 'Hembra',
  },
  {'id': '1', 'name': 'Macho'}
];

class MascotaEditarPage extends StatefulWidget {
  final MascotaModel mascotaData;
  MascotaEditarPage({
    @required this.mascotaData,
  });

  @override
  _MascotaEditarPageState createState() =>
      _MascotaEditarPageState(mascotaData: mascotaData);
}

class _MascotaEditarPageState extends State<MascotaEditarPage> {
  MascotaModel mascotaData;
  _MascotaEditarPageState({
    @required this.mascotaData,
  });

  final formKey = GlobalKey<FormState>();
  final scaffoldKey = GlobalKey<ScaffoldState>();
  final mascotaProvider = new MascotaProvider();
  final razaProvider = new RazaProvider();

  bool btnBool = true;
  File foto;
  String datoPet = '';
  String opcRaza = '';
  RazaModel razaLista;

  Future<RazaModel> traeRazas() => razaProvider.getBreed(datoPet);

  obtenerRaza() async {
    razaLista = await razaProvider.getBreed(datoPet);
    var item = razaLista.breeds.where((x) => x.id == mascotaData.breedId);
    opcRaza = "${item.first.id}|${item.first.name}";
    mascotaData.breedId = item.first.id;
    setState(() {});
  }

  @override
  void initState() {
    datoPet = mascotaData.specieId.toString();
    //implement initState
    obtenerRaza();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: scaffoldKey,
      appBar: appbar(
        null,
        'Editar mascota',
        null,
      ),
      body: (razaLista == null)
          ? LinearProgressIndicator()
          : FadeView(
              child: SingleChildScrollView(
                child: Form(
                    key: formKey,
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 20),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          SizedBox(
                            height: 25.0,
                          ),
                          Padding(
                              padding:
                                  const EdgeInsets.symmetric(vertical: 5.0),
                              child: Center(
                                child: Stack(
                                  children: <Widget>[
                                    CircleAvatar(
                                      backgroundImage: _mostrarFoto(),
                                      radius: 80.0,
                                    ),
                                    Positioned(
                                        bottom: 1.5,
                                        right: 10.0,
                                        child: CircleAvatar(
                                          child: IconButton(
                                            icon: Icon(Icons.camera_enhance,
                                                color: Colors.white),
                                            onPressed: () => showDialog(
                                                context: context,
                                                builder:
                                                    (BuildContext context) {
                                                  return FadeIn(
                                                    child: SimpleDialog(
                                                      children: <Widget>[
                                                        SimpleDialogOption(
                                                          child: const Text(
                                                              'Tomar foto'),
                                                          onPressed: _tomarFoto,
                                                        ),
                                                        SimpleDialogOption(
                                                          child: const Text(
                                                              'Seleccionar foto'),
                                                          onPressed:
                                                              _seleccionarFoto,
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
                              ) //Text('Foto de mi mascota'),
                              ),
                          SizedBox(
                            height: 10.0,
                          ),
                          Padding(
                            padding: const EdgeInsets.symmetric(vertical: 5.0),
                            child: FormularioText(
                              hintText: 'Nombre de mascota',
                              icon: Icons.pets,
                              obscureText: false,
                              onSaved: (value) => mascotaData.name = value,
                              textCap: TextCapitalization.words,
                              valorInicial: mascotaData.name,
                              boardType: TextInputType.text,
                            ),
                          ),
                          SizedBox(
                            height: 10.0,
                          ),
                          Padding(
                            padding: const EdgeInsets.only(bottom: 2.5),
                            child: Text('Seleccione tipo de mascota'),
                          ),
                          Padding(
                            padding: const EdgeInsets.symmetric(vertical: 5.0),
                            child: ddlMainOut(context, datoPet, tipopet, null,
                                mascotaData.specieName),
                          ),
                          SizedBox(
                            height: 10.0,
                          ),
                          Padding(
                            padding: const EdgeInsets.only(bottom: 2.5),
                            child: Text('Seleccione raza'),
                          ),
                          Padding(
                            padding: const EdgeInsets.symmetric(vertical: 5.0),
                            child: ddlFutureSearch(
                                context, opcRaza, razaLista.breeds, (opt) {
                              setState(() {
                                opcRaza = opt.toString();
                                mascotaData.breedId =
                                    int.tryParse(opt.split("|")[0]);
                                // mascotaData.breedId=int.tryParse(opt);
                              });
                            }),
                          ),
                          SizedBox(
                            height: 10.0,
                          ),
                          Padding(
                            padding: const EdgeInsets.only(bottom: 2.5),
                            child: Text('Fecha de nacimiento'),
                          ),
                          // DateTimePickerFormField(),
                          Padding(
                            padding: const EdgeInsets.symmetric(vertical: 5.0),
                            child: _crearFecha(context),
                          ),
                          SizedBox(
                            height: 10.0,
                          ),
                          Padding(
                            padding: const EdgeInsets.only(bottom: 2.5),
                            child: Text('Sexo'),
                          ),
                          _sexoEdit(),
                          SizedBox(
                            height: 25.0,
                          ),
                          buttonPri('Guardar cambios', btnBool ? _onAdd : null),
                          // Center(
                          //     child: //()=>agregarDialog()
                          //     //(petData==null)?'Agregar mascota':'Guardar cambios'
                          //     ),
                          SizedBox(
                            height: 10.0,
                          ),
                        ],
                      ),
                    )),
              ),
            ),
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
        ));

    if (foto != null) {
      //limpieza
    }

    setState(() {
      foto = croppedFile;
    });
    Navigator.pop(context);
  }

  Widget _sexoEdit() {
    return Padding(
        padding: const EdgeInsets.symmetric(vertical: 5.0),
        child: ddlMain(context, mascotaData.genre.toString(), tiposex, (opt) {
          setState(() {
            mascotaData.genre = int.tryParse(opt);
          });
        }));
  }

  Widget _crearFecha(BuildContext context) {
    final format = DateFormat("yyyy-MM-dd");
    var currentValue = DateTime.parse(mascotaData.birthdate);
    return DateTimeField(
      initialValue: currentValue,
      format: format,
      onChanged: (dt) => setState(() => mascotaData.birthdate = dt.toString()),
      enableInteractiveSelection: false,
      cursorColor: colorMain,
      onShowPicker: (context, currentValue) {
        return showDatePicker(
          context: context,
          initialDate: currentValue ??
              DateTime.now(), //DateTime.parse(mascotaData.birthdate),
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

  void _onAdd() async {
    try {
      print(foto);

      setState(() {
        formKey.currentState.save();
        btnBool = false;
      });

      if (mascotaData.name.trim() == '') {
        mostrarSnackbar('Ingrese nombre de la mascota.', colorRed, scaffoldKey);
        Timer(Duration(milliseconds: 1500), () {
          setState(() {
            btnBool = true;
          });
        });
      } else {
        // mascotaData.birthdate = currentValue;
        bool resp;
        if (mascotaData.birthdate.trim() == '')
          setState(() {
            mostrarSnackbar(
                'Ingrese nacimiento de la mascota.', colorRed, scaffoldKey);
            Timer(Duration(milliseconds: 1500), () {
              setState(() {
                btnBool = true;
              });
            });
          });
        else {
          resp = await mascotaProvider.editPet(mascotaData, foto);
          boolEdit(resp);
        }
      }
    } catch (e) {
      setState(() {
        mostrarSnackbar(
            'No se guardaron los datos de la mascota.', colorRed, scaffoldKey);
        Timer(Duration(milliseconds: 1500), () {
          setState(() {
            btnBool = true;
          });
        });
      });
    }
  }

  boolEdit(resp) {
    if (resp) {
      mostrarSnackbar(
          'Se guardó los datos de la mascota.', colorMain, scaffoldKey);
      Navigator.of(context).pushNamedAndRemoveUntil(
          '/navInicio', ModalRoute.withName('/navInicio'));
      // Navigator.of(context).pushReplacementNamed('detallemascota', arguments: mascotaData.id);
      //'detallemascota', arguments: mascotas[index].id
    } else {
      mostrarSnackbar(
          'No se guardaron los datos de la mascota.', colorRed, scaffoldKey);
      Timer(Duration(milliseconds: 1500), () {
        setState(() {
          btnBool = true;
        });
      });
    }
  }
}

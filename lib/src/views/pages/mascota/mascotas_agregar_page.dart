import 'dart:async';
import 'dart:io';
import 'package:animate_do/animate_do.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:image_cropper/image_cropper.dart';
import 'package:image_picker/image_picker.dart';
import 'package:intl/intl.dart';
import 'package:proypet/src/models/mascota/mascota_model.dart';
import 'package:proypet/src/models/raza/raza_model.dart';
import 'package:proypet/src/providers/mascota_provider.dart';
import 'package:proypet/src/providers/raza_provider.dart';
import 'package:proypet/src/components/appbar_menu.dart';
import 'package:proypet/src/components/form_control/button_primary.dart';
import 'package:proypet/src/components/form_control/ddl_control.dart';
import 'package:proypet/src/components/form_control/text_from.dart';
import 'package:proypet/src/components/snackbar.dart';
import 'package:proypet/src/components/thx_page.dart';
import 'package:proypet/src/components/transicion/pagina_app.dart';
import 'package:proypet/src/styles/styles.dart';
import 'package:proypet/src/utils/add_msg.dart';
import 'dart:math' as Math;

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

  bool btnBool = true;
  File foto;
  String datoPet = tipopet[0]['id'];
  String opcRaza = ''; //'390|Gatos Mestizo de pelo corto';
  MascotaModel mascotaData = new MascotaModel();

  String fechaEdit = '';
  String sexo = "0";
  RazaModel razaLista;

  Future<RazaModel> traeRazas() => razaProvider.getBreed(datoPet);

  obtenerRaza() async {
    razaLista = await razaProvider.getBreed(datoPet);
    // mascotaData.breedId = razaLista.breeds.first.id;
    opcRaza = "${razaLista.breeds.first.id}|${razaLista.breeds.first.name}";
    setState(() {});
  }

  @override
  void initState() {
    //implement initState
    obtenerRaza();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    mascotaData.specieId = int.tryParse(datoPet);
    mascotaData.breedId = int.tryParse(opcRaza.split("|")[0]);
    return Scaffold(
      key: scaffoldKey,
      appBar: appbar(
        null,
        'Agregar mascota',
        null,
      ),
      body: (razaLista == null)
          ? LinearProgressIndicator()
          : FadeView(
              child: SingleChildScrollView(
                child: Form(
                  key: formKey,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      SizedBox(
                        height: 25.0,
                      ),
                      Padding(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 25.0, vertical: 5.0),
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
                                            builder: (BuildContext context) {
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
                          )),
                      SizedBox(
                        height: 10.0,
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 25.0, vertical: 5.0),
                        child: FormularioText(
                          hintText: 'Nombre de mascota',
                          icon: Icons.pets,
                          obscureText: false,
                          onSaved: (value) => mascotaData.name = value,
                          textCap: TextCapitalization.words,
                          valorInicial: null,
                          boardType: TextInputType.text,
                        ),
                      ),
                      SizedBox(
                        height: 10.0,
                      ),
                      Padding(
                        padding: const EdgeInsets.only(
                            left: 25.0, right: 25.0, bottom: 2.5),
                        child: Text('Seleccione tipo de mascota'),
                      ),
                      Padding(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 25.0, vertical: 5.0),
                          child: ddlMain(context, datoPet, tipopet, (opt) {
                            setState(() {
                              datoPet = opt;
                              opcRaza = '';
                              mascotaData.specieId = int.tryParse(opt);
                              obtenerRaza();
                            });
                          })),
                      SizedBox(
                        height: 10.0,
                      ),
                      Padding(
                        padding: const EdgeInsets.only(
                            left: 25.0, right: 25.0, bottom: 2.5),
                        child: Text('Seleccione raza'),
                      ),
                      Padding(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 25.0, vertical: 5.0),
                          child: ddlFutureSearch(
                              context, opcRaza, razaLista.breeds, (opt) {
                            setState(() {
                              opcRaza = opt.toString();
                              mascotaData.breedId =
                                  int.tryParse(opt.split("|")[0]);
                            });
                          })),
                      SizedBox(
                        height: 10.0,
                      ),
                      Padding(
                        padding: const EdgeInsets.only(
                            left: 25.0, right: 25.0, bottom: 2.5),
                        child: Text('Fecha de nacimiento'),
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 25.0, vertical: 5.0),
                        child: _crearFecha(context), //,petData
                      ),
                      SizedBox(
                        height: 10.0,
                      ),
                      Padding(
                        padding: const EdgeInsets.only(
                            left: 25.0, right: 25.0, bottom: 2.5),
                        child: Text('Sexo'),
                      ),
                      _sexo(),
                      SizedBox(
                        height: 25.0,
                      ),
                      Center(
                          child: buttonPri(
                              'Agregar mascota', btnBool ? _onAdd : null)),
                      SizedBox(
                        height: 10.0,
                      ),
                    ],
                  ),
                ),
              ),
            ),
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
        onSaved: (value) => mascotaData.birthdate = value,
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
      });
    }
  }

  Widget _sexo() {
    return Padding(
        padding: const EdgeInsets.symmetric(horizontal: 25.0, vertical: 5.0),
        child: ddlMain(context, sexo, tiposex, (opt) {
          setState(() {
            sexo = opt;
          });
        }));
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

    setState(() {
      foto = croppedFile;
    });
    Navigator.pop(context);
  }

  void _onAdd() async {
    try {
      setState(() {
        formKey.currentState.save();
        btnBool = false;
      });
      if (mascotaData.name.trim() == '' || mascotaData.birthdate.trim() == '') {
        if (mascotaData.name.trim() == '' &&
            mascotaData.birthdate.trim() != '') {
          mostrarSnackbar(
              'Ingrese nombre de la mascota.', colorRed, scaffoldKey);
        } else if (mascotaData.birthdate.trim() == '' &&
            mascotaData.name.trim() != '') {
          mostrarSnackbar(
              'Ingrese nacimiento de la mascota.', colorRed, scaffoldKey);
        } else {
          mostrarSnackbar(
              'Ingrese datos de la mascota.', colorRed, scaffoldKey);
        }
        //
        Timer(Duration(milliseconds: 1500), () {
          setState(() {
            btnBool = true;
          });
        });
        //
      } else {
        mascotaData.genre = int.tryParse(sexo);
        // print(foto);
        Map resp = await mascotaProvider.savePet(mascotaData, foto);
        boolSave(resp);
      }
    } catch (e) {
      setState(() {
        mostrarSnackbar('No se agregó la mascota.', colorRed, scaffoldKey);
        Timer(Duration(milliseconds: 1500), () {
          setState(() {
            btnBool = true;
          });
        });
      });
    }
  }

  boolSave(resp) {
    print(resp); //
    if (resp['ok']) {
      Navigator.push(
          context,
          MaterialPageRoute(
              builder: (_) => ThxPage(
                  CachedNetworkImageProvider(resp['petImg']),
                  thxPet[Math.Random().nextInt(thxPet.length)])));
    } else
      setState(() {
        mostrarSnackbar('No se agregó la mascota.', colorRed, scaffoldKey);
        Timer(Duration(milliseconds: 1500), () {
          setState(() {
            btnBool = true;
          });
        });
      });
  }
}

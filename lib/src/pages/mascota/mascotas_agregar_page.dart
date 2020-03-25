import 'dart:async';
import 'dart:io';
import 'package:flutter/material.dart';
import 'package:image_cropper/image_cropper.dart';
import 'package:image_picker/image_picker.dart';
import 'package:proypet/src/model/mascota/mascota_model.dart';
import 'package:proypet/src/model/raza/raza_model.dart';
import 'package:proypet/src/pages/shared/appbar_menu.dart';
import 'package:intl/intl.dart';
import 'package:proypet/src/pages/shared/ddl_control.dart';
import 'package:proypet/src/pages/shared/form_control/button_primary.dart';
import 'package:proypet/src/pages/shared/form_control/text_from.dart';
import 'package:proypet/src/pages/shared/snackbar.dart';
import 'package:proypet/src/pages/shared/styles/styles.dart';
import 'package:proypet/src/providers/mascota_provider.dart';
import 'package:proypet/src/providers/raza_provider.dart';

final tipopet = [{'id':'1','name':'Gato',},{'id':'2','name':'Perro'}];

class MascotaAgregarPage extends StatefulWidget {
  @override
  _MascotaAgregarPageState createState() => _MascotaAgregarPageState();
}

class _MascotaAgregarPageState extends State<MascotaAgregarPage> {
  String _fecha ='';
  final _shape = BorderRadius.circular(10.0);  
  final formKey = GlobalKey<FormState>();
  final scaffoldKey = GlobalKey<ScaffoldState>();
  final mascotaProvider = new MascotaProvider();
  final razaProvider = new RazaProvider();
  TextEditingController _inputFechaController=new TextEditingController();

  bool btnBool = true;
  File foto;
  String datoPet = tipopet[0]['id'];
  String opcRaza= '390'; // : razaGato[0]['cod'] ;
  MascotaModel mascotaData = new MascotaModel();

  String fechaEdit = '';
  bool sexo=false;

  @override
  Widget build(BuildContext context) {
    final MascotaModel petData = ModalRoute.of(context).settings.arguments;
    if(petData==null){ //agregar
      mascotaData.specieId = int.tryParse(datoPet);
      mascotaData.breedId = int.tryParse(opcRaza);      
    }

    else{ //editar
      mascotaData=petData;//tiene que estar para el metodo mostrar imagen
      datoPet=mascotaData.specieId.toString();
      fechaEdit = mascotaData.birthdate.toString().split(' ')[0];
    }

    return Scaffold(
      key: scaffoldKey,
      appBar: appbar(
        // null,
        Text((mascotaData==null) ? 'Agregar mascota' : 'Editar mascota',
          style: TextStyle(
            fontSize: 16.0,
            fontWeight: FontWeight.normal
          ),
        ),
        null,
      ),
      body: Stack(
        children: <Widget>[
            SingleChildScrollView(
              child: Form(
                key: formKey,
                child: Column(                
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    SizedBox(height: 25.0,),
                    Padding(
                      padding: const EdgeInsets.fromLTRB(35.0, 0, 35.0, 10.0),
                      child: Center(
                        child: Stack(
                          children: <Widget>[
                            CircleAvatar(
                              backgroundImage: _mostrarFoto(petData),//AssetImage('images/no-image.png'),
                              radius: 80.0,
                            ),
                            Positioned(
                              bottom: 1.5,
                              right: 10.0,
                              child: CircleAvatar(
                                child: IconButton(
                                  icon: Icon(Icons.camera_enhance,color: Colors.white), 
                                  onPressed: ()=>showDialog(
                                  context: context,
                                  builder: (BuildContext context){
                                    return SimpleDialog(
                                      //title: const Text('Select assignment'),
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
                                    );
                                  }
                                ),                                  
                                ),
                                backgroundColor: colorMain,
                                radius: 22.0,
                              )
                            )
                          ],
                        ),
                      ) //Text('Foto de mi mascota'),
                    ),
                    SizedBox(height: 10.0,),
                    textForm('Nombre de mascota', Icons.pets, false, (value)=>mascotaData.name=value, TextCapitalization.words, (petData==null) ? null : mascotaData.name),
                    SizedBox(height: 10.0,),
                    Padding(
                      padding: const EdgeInsets.fromLTRB(35.0, 0, 35.0, 10.0),
                      child: Text('Seleccione tipo de mascota'),
                    ),
                    Padding(
                      padding: const EdgeInsets.fromLTRB(35.0, 0, 35.0, 10.0),
                      child: (petData==null) ? ddlMain(datoPet, tipopet, 
                        (opt){ setState(() {
                          datoPet=opt; 
                          mascotaData.specieId = int.tryParse(opt);
                          if(datoPet=='1') opcRaza='390';
                          else opcRaza='1';
                        }
                      );}) : ddlMainOut(datoPet, tipopet, null, mascotaData.specieName),
                    ),
                    SizedBox(height: 10.0,),
                    Padding(
                      padding: const EdgeInsets.fromLTRB(35.0, 0, 35.0, 10.0),
                      child: Text('Seleccione raza'),
                    ),
                    FutureBuilder(
                      future: razaProvider.getBreed(datoPet),
                      builder: (BuildContext context, AsyncSnapshot<RazaModel> snapshot) {
                        if(!snapshot.hasData){
                          return Center(child: CircularProgressIndicator());
                        }
                        else{
                          return Padding(
                            padding: const EdgeInsets.fromLTRB(35.0, 0, 35.0, 10.0),
                            child: (petData==null) ? ddlFuture( opcRaza , snapshot.data.breeds , 
                              (opt){ setState(() { 
                                opcRaza=opt;
                                mascotaData.breedId = int.tryParse(opt);
                              }); }
                            ) : ddlFuture( mascotaData.breedId.toString() , snapshot.data.breeds , 
                              (opt){ setState(() { 
                                mascotaData.breedId=int.tryParse(opt);
                              }); }
                            ),
                          );
                        } 
                      },
                    ),
                    SizedBox(height: 10.0,),
                    Padding(
                      padding: const EdgeInsets.fromLTRB(35.0, 0, 35.0, 10.0),
                      child: Text('Fecha de nacimiento'),
                    ),
                    Padding(
                      padding: const EdgeInsets.fromLTRB(35.0, 0, 35.0, 10.0),
                      child: _crearFecha(context,petData),
                    ),
                    SizedBox(height: 10.0,),                    
                    Padding(
                      padding: const EdgeInsets.fromLTRB(35.0, 0, 35.0, 10.0),
                      // child: _sexo(),
                      child: (petData==null) ? _sexo() : _sexoEdit(),
                    ),
                    SizedBox(height: 25.0,),
                    Center(
                      child: buttonPri((petData==null)?'Agregar mascota':'Guardar cambios', btnBool ? _onAdd : null ) //()=>agregarDialog()
                    ),
                  ],
                ),
              ),
            ),
        ],
      ),
    );
  }
  

  Widget _crearFecha(BuildContext context, petData){
    return Material(
      elevation: 0.0,
      borderRadius: _shape,
      color: Colors.grey[200],
      child: TextFormField(
        enableInteractiveSelection: false,
        controller: _inputFechaController,
        onTap: (){
          FocusScope.of(context).requestFocus(new FocusNode());
          _selectDate(context);
        },
        onSaved: (value)=>mascotaData.birthdate=value,
        cursorColor: colorMain,
        decoration: (petData==null) ? InputDecoration(
          //labelText: fechaEdit,
          hintText: 'Fecha de nacimiento',
          hintStyle: TextStyle(fontSize: 14.0),
          prefixIcon: Material(
            //elevation: 0.0,
            borderRadius: _shape,
            color: Colors.grey[200],
            child: Icon(
              Icons.calendar_today,
              color: colorMain,
            ),
          ),
          border: InputBorder.none,
          contentPadding: EdgeInsets.symmetric(horizontal: 12.0, vertical: 12.0)
        ) : InputDecoration(
          labelText: fechaEdit,
          hintText: 'Fecha de nacimiento',
          hintStyle: TextStyle(fontSize: 14.0),
          prefixIcon: Material(
            //elevation: 0.0,
            borderRadius: _shape,
            color: Colors.grey[200],
            child: Icon(
              Icons.calendar_today,
              color: colorMain,
            ),
          ),
          border: InputBorder.none,
          contentPadding: EdgeInsets.symmetric(horizontal: 12.0, vertical: 12.0)
        ),
      ),
    );
  }

  _selectDate(BuildContext context) async {
    DateTime picked = await showDatePicker(
      context: context, 
      initialDate: new DateTime.now(), 
      //firstDate: new DateTime(DateTime.now().year,DateTime.now().month,DateTime.now().day), 
      firstDate: new DateTime(DateTime.now().year-25),
      lastDate: DateTime.now(),
      initialDatePickerMode: DatePickerMode.year
    );

    if(picked!=null){
      final f = new DateFormat('yyyy-MM-dd');
      setState(() {
        _fecha= f.format(picked);
        _inputFechaController.text = _fecha;
        // fechaNace=_fecha;
      });
    }
  }

  Widget _sexo(){
    return SwitchListTile(
      value: sexo,//petReq.genre,
      title: Text('Sexo'),
      subtitle: sexo ? Text('Macho') : Text('Hembra'),
      activeColor: colorMain,
      onChanged: (value)=> setState((){
        sexo = value;
      }),
    );
  }

  Widget _sexoEdit(){
    return SwitchListTile(
      value: mascotaData.genre,
      title: Text('Sexo'),
      subtitle: mascotaData.genre ? Text('Macho') : Text('Hembra'),
      activeColor: colorMain,
      onChanged: (value)=> setState((){
        print(value);
        mascotaData.genre = value;
      }),
    );
  }
 
  _mostrarFoto(petData){
    if(petData!=null && foto==null) return NetworkImage(mascotaData.picture);
    if(foto!=null) return FileImage(foto);
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
      maxHeight: 350,
      maxWidth: 350,
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
      )
    );

    // var result = await FlutterImageCompress.compressAndGetFile(
    //     croppedFile.path, 
    //     croppedFile.path,
    //     quality: 65,
    //   );
    
    if(foto!=null){
      //limpieza
    }
    
    setState(() {
      foto = croppedFile;
    });
    // print(foto.lengthSync());
    Navigator.pop(context);
  }

  void _onAdd() async {
    try {
      setState(() {
        formKey.currentState.save();
        btnBool = false;      
      });
      
      if(mascotaData.name.trim()=='') setState(() {
        mostrarSnackbar('Debe completar los datos de la mascota.', Colors.red[300], scaffoldKey);  
        btnBool = true;      
      });

      else {
        bool resp; 
        if(mascotaData.id==null){
          if(mascotaData.birthdate.trim()=='') setState(() {
            mostrarSnackbar('Debe completar los datos de la mascota.', Colors.red[300], scaffoldKey);  
            btnBool = true;      
          });
          else{
            mascotaData.genre=sexo;
            resp = await mascotaProvider.savePet(mascotaData, foto);
            boolSave(resp);
          }          
        }
        else{
          if(mascotaData.birthdate=="" && fechaEdit!=""){
            mascotaData.birthdate=fechaEdit;
          }
          resp = await mascotaProvider.editPet(mascotaData, foto);
          boolSave(resp);
        }
      }
    }
    catch(e) {
      setState(() {
        mostrarSnackbar('No se agregadó la mascota.', Colors.red[300], scaffoldKey);
        btnBool = true;      
      });
    }
  }
  //Colors.red[300]
  boolSave(resp){
    if(resp){
      mostrarSnackbar('Mascota agregada.', colorMain, scaffoldKey);  
      Timer(
        Duration(milliseconds: 2500), (){
          Navigator.pop(context);
        }
      );
    
    }
    else setState(() {
      mostrarSnackbar('No se agregadó la mascota.', Colors.red[300], scaffoldKey);  
      btnBool = true;      
    });
  }
}
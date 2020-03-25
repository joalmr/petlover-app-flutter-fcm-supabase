import 'dart:async';
import 'dart:io';
import 'package:flutter/material.dart';
import 'package:image_cropper/image_cropper.dart';
import 'package:image_picker/image_picker.dart';
import 'package:proypet/src/model/mascota/mascota_model.dart';
import 'package:proypet/src/model/mascota/mascota_req.dart';
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
  MascotaReq petReq = new MascotaReq();////////////////////////////////////////////////
  TextEditingController _inputFechaController=new TextEditingController();

  bool btnBool = true;
  File foto;
  String datoPet = tipopet[0]['id'];
  String opcRaza= '390'; // : razaGato[0]['cod'] ;
  MascotaModel mascotaEdit = new MascotaModel();

  // bool boolSexo=false;

  String fechaEdit = '';

  @override
  Widget build(BuildContext context) {
    final MascotaModel petData = ModalRoute.of(context).settings.arguments;
    // petReq.specie= int.tryParse(datoPet);
    // petReq.breed= int.tryParse(opcRaza);
    if(petData==null){ //agregar
      mascotaEdit.specieId = int.tryParse(datoPet);
      mascotaEdit.breedId = int.tryParse(opcRaza);      
    }

    else{ //editar
      mascotaEdit=petData;//tiene que estar para el metodo mostrar imagen
      datoPet=mascotaEdit.specieId.toString();
      fechaEdit = mascotaEdit.birthdate.toString().split(' ')[0];
      if(mascotaEdit.genre==1) petReq.genre=true;
      else petReq.genre=false;
    }

    return Scaffold(
      key: scaffoldKey,
      appBar: appbar(
        // null,
        Text((mascotaEdit==null) ? 'Agregar mascota' : 'Editar mascota',
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
                    textForm('Nombre de mascota', Icons.pets, false, (value)=>mascotaEdit.name=value, TextCapitalization.words, (petData==null) ? null : mascotaEdit.name),
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
                          mascotaEdit.specieId = int.tryParse(opt);
                          if(datoPet=='1') opcRaza='390';
                          else opcRaza='1';
                        }
                      );}) : ddlMainOut(datoPet, tipopet, null, mascotaEdit.specieName),
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
                                mascotaEdit.breedId = int.tryParse(opt);
                              }); }
                            ) : ddlFuture( mascotaEdit.breedId.toString() , snapshot.data.breeds , 
                              (opt){ setState(() { 
                                mascotaEdit.breedId=int.tryParse(opt);
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
                      child: _sexo(),
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
        onSaved: (value)=>petReq.birthdate=value,
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
      value: petReq.genre,
      title: Text('Sexo'),
      subtitle: petReq.genre ? Text('Macho') : Text('Hembra'),
      activeColor: colorMain,
      onChanged: (value)=> setState((){
        print(value);
        petReq.genre = value;
      }),
    );
  }
 
  _mostrarFoto(petData){
    if(petData!=null && foto==null) return NetworkImage(mascotaEdit.picture);
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
      
      if(mascotaEdit.name.trim()=='') setState(() {
        mostrarSnackbar('Debe completar los datos de la mascota.', Colors.red[300], scaffoldKey);  
        btnBool = true;      
      });

      else {
        bool resp; 
        petReq.name = mascotaEdit.name;
        petReq.specie = mascotaEdit.specieId;
        petReq.breed = mascotaEdit.breedId;
        // if(mascotaEdit.genre==1) petReq.genre=true;
        // if(mascotaEdit.genre==0) petReq.genre=false;
        // petReq.birthdate=
        if(mascotaEdit.id==null){
          if(petReq.birthdate.trim()=='') setState(() {
            mostrarSnackbar('Debe completar los datos de la mascota.', Colors.red[300], scaffoldKey);  
            btnBool = true;      
          });
          else{
            resp = await mascotaProvider.savePet(petReq, foto);
            boolSave(resp);
          }          
        }
        else{
          petReq.idKey = mascotaEdit.id;
          if(petReq.birthdate=="" && fechaEdit!=""){
            petReq.birthdate=fechaEdit;
          }
          // petReq.genre = boolEdit;
          resp = await mascotaProvider.editPet(petReq, foto);
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
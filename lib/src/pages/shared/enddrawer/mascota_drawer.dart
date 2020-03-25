import 'package:flutter/material.dart';
import 'package:proypet/src/model/mascota/pet_model.dart';
import 'package:proypet/src/pages/shared/styles/styles.dart';
import 'package:proypet/src/providers/mascota_provider.dart';


class MascotaDrawer extends StatefulWidget {
  final String idPet;
  // final MascotaModel modelMascota;
  MascotaDrawer({@required this.idPet});

  @override
  _MascotaDrawerState createState() => _MascotaDrawerState(idPet: idPet);
}

class _MascotaDrawerState extends State<MascotaDrawer> {
  final String idPet;
  _MascotaDrawerState({@required this.idPet});
  final Color primary = Colors.white;
  final Color active = Colors.grey.shade800;
  final Color divider = Colors.grey.shade600;
  // final _prefs = new PreferenciasUsuario();
  final mascotaProvider = MascotaProvider(); 

  @override
  Widget build(BuildContext context) {
    return ClipPath(
      child: Drawer(
        child: Container(
          padding: const EdgeInsets.only(left: 16.0, right: 32.0),
          decoration: BoxDecoration(
              color: primary, boxShadow: [BoxShadow(color: Colors.black45)]),
          width: 300,
          child: SafeArea(
            child: SingleChildScrollView(
              child: dataList(),
            ),
          ),
        ),
      ),
    );
  }

  dataList(){
    return FutureBuilder(
      future: mascotaProvider.getPet(idPet),
      builder: (BuildContext context, AsyncSnapshot<PetModel> snapshot) {
        if(!snapshot.hasData){
          return Container(
            height: MediaQuery.of(context).size.height/2,
            child: Center(
              child: CircularProgressIndicator(),
            ),
          );
        }
        else{
          final pet = snapshot.data.pet;
          return Column(
            children: <Widget>[                  
              SizedBox(height: 40.0,),
              Text(pet.name,
                style: TextStyle(
                  fontWeight: FontWeight.w400,
                  fontSize: 24.0,
                  letterSpacing: 3.0,
                  color: Colors.black54,                      
                ),
              ),
              SizedBox(height: 20.0,),
              Divider(),
              ListTile(
                leading: Icon(Icons.edit),
                title: Text('Editar datos', style: TextStyle(
                  fontWeight: FontWeight.w400,
                ),),
                onTap: ()=>Navigator.pushNamed(context, 'agregarmascota', arguments: pet),
              ),
              ListTile(
                leading: Icon(Icons.delete_forever, color: colorRed,),
                title: Text('Eliminar mascota', style: TextStyle(
                  color: colorRed,
                  fontWeight: FontWeight.w400,
                ),),
                onTap: ()=>showDialog(
                  context: context,
                  builder: (BuildContext context){
                    return AlertDialog(
                      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10.0)),
                      title: Text('Eliminar'),
                      content: Text('Seguro que desea eliminar a ${pet.name}?'),
                      actions: <Widget>[
                        FlatButton(
                          onPressed: ()=>Navigator.pop(context), 
                          child: Text('Cancelar')
                        ),
                        FlatButton(
                          onPressed: () async {
                            bool resp = await mascotaProvider.deletePet(pet.id);
                            if(resp){
                              Navigator.of(context).pushNamedAndRemoveUntil('/nav', ModalRoute.withName('/nav'));
                              // Navigator.pushAndRemoveUntil(context,                                      
                              //   MaterialPageRoute(builder: (BuildContext context) => NavigationBar(currentTabIndex: 1,)),
                              //   ModalRoute.withName('/mismascotas')
                              // );
                            }
                            else{
                              Navigator.pop(context);
                            }
                          },
                          child: Text('Sí, eliminar')
                        )
                      ],
                    );
                  }
                )
              )
            ],
          );
        }
        
      },
    );
  }

  
  // bool valConsulta=true;
  // bool valVacuna=true;
  // bool valBanio=true;
  // bool valDesparacita=true;

//
//switchBool('Consultas',valConsulta),
// SwitchListTile(
//   value: valConsulta,
//   title: Text('Consultas'),
//   activeColor: colorMain,
//   onChanged: (value)=> setState((){
//     valConsulta = value;
//   }),
// ),
// //
// SwitchListTile(
//   value: valVacuna,
//   title: Text('Consultas'),
//   activeColor: colorMain,
//   onChanged: (value)=> setState((){
//     valVacuna = value;
//   }),
// ),
// //
// SwitchListTile(
//   value: valBanio,
//   title: Text('Consultas'),
//   activeColor: colorMain,
//   onChanged: (value)=> setState((){
//     valBanio = value;
//   }),
// ),
// //
// SwitchListTile(
//   value: valDesparacita,
//   title: Text('Consultas'),
//   activeColor: colorMain,
//   onChanged: (value)=> setState((){
//     valDesparacita = value;
//   }),
// ),
// // _switch('Vacunas', valVacuna=true),
// _switch('Baños', valBanio=true),
// _switch('Desparasitaciones', valDesparacita=true),
// FlatButton(
//   child: Container(
//     width: double.infinity,
//     child: Text('Filtrar', 
//       style: TextStyle(
//         color: colorMain,
//         fontWeight: FontWeight.w600,
//       ),
//       textAlign: TextAlign.center,
//     )
//   ),
//   onPressed: (){},
// ),

  // Widget _switch(String texto, valBool){
  //   return SwitchListTile(
  //     value: valBool,
  //     title: Text(texto),
  //     activeColor: colorMain,
  //     onChanged: (value)=> setState((){
  //       valBool = value;
  //     }),
  //   );
  // }

  // switchBool(String texto, bool valor){
  //   return SwitchListTile(
  //     value: valor,
  //     title: Text(texto),
  //     activeColor: colorMain,
  //     onChanged: (value)=> setState((){
  //       valor = value;
  //     }),
  //   );
  // }

}
import 'package:flutter/material.dart';
import 'package:proypet/main.dart';
import 'package:proypet/src/pages/model/mascota_model.dart';

class MascotaDetallePage extends StatelessWidget {
  final int idmascota;

  MascotaDetallePage({@required this.idmascota});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Container(
            height: MediaQuery.of(context).size.height,
          ),
          Container(
            height: 450.0,
            child: Stack(
              children: <Widget>[
                Image(
                  image: AssetImage(mascotaList[idmascota].foto),
                  fit: BoxFit.cover,
                  width: double.infinity,
                  height: 300.0,                  
                ),
                Positioned(
                  bottom: 0,
                  child: Container(
                    height: 200.0,
                    width: MediaQuery.of(context).size.width,
                    foregroundDecoration: BoxDecoration(
                      color: colorMain,
                      borderRadius: BorderRadius.circular(25.0),
                    ),
                  ),
                ),
                Positioned(
                  bottom: 0,
                  child: Container(
                    height: 195.0,
                    width: MediaQuery.of(context).size.width,
                    padding: EdgeInsets.symmetric(vertical: 15.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: <Widget>[
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 25.0),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: <Widget>[
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: <Widget>[
                                  Text(mascotaList[idmascota].nombre,
                                    style: TextStyle(
                                      fontSize: 20.0,
                                      fontWeight: FontWeight.w600,
                                      color: Colors.white
                                    )
                                  ),
                                  Text(mascotaList[idmascota].raza,
                                    style: TextStyle(
                                      fontSize: 15.0,
                                      fontWeight: FontWeight.w600,
                                      color: Colors.white
                                    )
                                  )
                                ],
                              ),
                              Row(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: <Widget>[
                                  Icon(Icons.cake,color: Colors.white,size: 28.0,),
                                  Column(
                                    children: <Widget>[
                                      Row(
                                        crossAxisAlignment: CrossAxisAlignment.end,
                                        mainAxisAlignment: MainAxisAlignment.start,
                                        children: <Widget>[
                                          Text(mascotaList[idmascota].edad.split(' ')[0],style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold,fontSize: 18.0)),
                                          Text(mascotaList[idmascota].edad.split(' ')[1] ,style: TextStyle(color: Colors.white)),
                                        ],
                                      ),
                                      Row(
                                        crossAxisAlignment: CrossAxisAlignment.start,
                                        mainAxisAlignment: MainAxisAlignment.start,
                                        children: <Widget>[
                                          Text(mascotaList[idmascota].edad.split(' ')[2],style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold)),
                                          Text(mascotaList[idmascota].edad.split(' ')[3] ,style: TextStyle(color: Colors.white)),
                                        ],
                                      )
                                      
                                      //Text(mascotaList[idmascota].edad.split(' ')[2]+' '+mascotaList[idmascota].edad.split(' ')[3] ,style: TextStyle(color: Colors.white))
                                    ],
                                  )
                                  
                                ],
                              )
                            ],
                          ),
                        ),
                        SizedBox(height: 15.0),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: <Widget>[
                            Container(
                              height: 90.0,
                              width: 65.0,
                              decoration: BoxDecoration(
                                color: Colors.black.withOpacity(0.15),
                                borderRadius: BorderRadius.circular(10.0),
                                border: Border.all(width: 2.0, color: Colors.white)
                              ),
                              padding: EdgeInsets.all(5.0),
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: <Widget>[
                                  Icon(Icons.pets,color: Colors.white),
                                  Center(child: Text('data',style: TextStyle(color: Colors.white)))
                                ],
                              )  ,
                            ),
                            Container(
                              height: 90.0,
                              width: 65.0,
                              decoration: BoxDecoration(
                                color: Colors.black.withOpacity(0.15),
                                borderRadius: BorderRadius.circular(10.0),
                                border: Border.all(width: 2.0, color: Colors.white)
                              ),
                              padding: EdgeInsets.all(5.0),
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: <Widget>[
                                  Icon(Icons.pets,color: Colors.white),
                                  Center(child: Text('data',style: TextStyle(color: Colors.white)))
                                ],
                              )  ,
                            ),
                            Container(
                              height: 90.0,
                              width: 65.0,
                              decoration: BoxDecoration(
                                color: Colors.black.withOpacity(0.15),
                                borderRadius: BorderRadius.circular(10.0),
                                border: Border.all(width: 2.0, color: Colors.white)
                              ),
                              padding: EdgeInsets.all(5.0),
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: <Widget>[
                                  Icon(Icons.pets,color: Colors.white),
                                  Center(child: Text('data',style: TextStyle(color: Colors.white)))
                                ],
                              )  ,
                            ),
                            Container(
                              height: 90.0,
                              width: 65.0,
                              decoration: BoxDecoration(
                                color: Colors.black.withOpacity(0.15),
                                borderRadius: BorderRadius.circular(10.0),
                                border: Border.all(width: 2.0, color: Colors.white)
                              ),
                              padding: EdgeInsets.all(5.0),
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: <Widget>[
                                  Icon(Icons.pets,color: Colors.white),
                                  Center(child: Text('data',style: TextStyle(color: Colors.white)))
                                ],
                              )  ,
                            ),
                            
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),

          Positioned(
            bottom: 0,
            child: Container(
              height: 390.0,
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20.0),
                child: Text('Historial',style: TextStyle(fontWeight: FontWeight.bold,fontSize: 22.0),),
              ),
            ),
          ),
          Positioned(
            bottom: 0,
            child: Container(
              height: 355,
              width: MediaQuery.of(context).size.width,
              child: ListView(
                  padding: EdgeInsets.symmetric(horizontal: 20.0),
                  children: <Widget>[
                      Column(
                      children: <Widget>[
                        Divider(height: 20.0),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: <Widget>[
                            Expanded(
                              child: Row(
                                children: <Widget>[
                                  CircleAvatar(
                                    backgroundImage: NetworkImage('https://beta.proypet.com/Uploads/Imagenes/Logo/LOGO_2095.PNG'),
                                    radius: 25.0,
                                  ),
                                  SizedBox(width: 7.0),
                                  Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: <Widget>[
                                      Text(
                                        'Veterinaria prueba',
                                        style: TextStyle(
                                          color: Colors.black87,
                                          fontSize: 17.0,
                                          fontWeight: FontWeight.w600
                                        ),
                                      ),
                                      Icon(Icons.local_hospital,size: 18.0,color: Colors.black.withOpacity(.5)),
                                    ],
                                  ),
                                ],
                              ),
                            ),
                            Column(
                              children: <Widget>[
                                Text(
                                  "10/01/19",
                                  style: TextStyle(color: Colors.black.withOpacity(.71),fontSize: 12.0,fontWeight: FontWeight.w600),
                                ),
                                Text(
                                  "17:00",
                                  style: TextStyle(color: colorMain[700],fontSize: 16.0,fontWeight: FontWeight.w600),
                                  textAlign: TextAlign.center,
                                ),
                              ],
                            ),
                          ],
                        ),
                        Divider(height: 20.0),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: <Widget>[
                            Expanded(
                              child: Row(
                                children: <Widget>[
                                  CircleAvatar(
                                    backgroundImage: NetworkImage('https://beta.proypet.com/Uploads/Imagenes/Logo/LOGO_2095.PNG'),
                                    radius: 25.0,
                                  ),
                                  SizedBox(width: 7.0),
                                  Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: <Widget>[
                                      Text(
                                        'Veterinaria prueba',
                                        style: TextStyle(
                                          color: Colors.black87,
                                          fontSize: 17.0,
                                          fontWeight: FontWeight.w600
                                        ),
                                      ),
                                      Icon(Icons.local_hospital,size: 18.0,color: Colors.black.withOpacity(.5)),
                                    ],
                                  ),
                                ],
                              ),
                            ),
                            Column(
                              children: <Widget>[
                                Text(
                                  "10/01/19",
                                  style: TextStyle(color: Colors.black.withOpacity(.71),fontSize: 12.0,fontWeight: FontWeight.w600),
                                ),
                                Text(
                                  "17:00",
                                  style: TextStyle(color: colorMain[700],fontSize: 16.0,fontWeight: FontWeight.w600),
                                  textAlign: TextAlign.center,
                                ),
                              ],
                            ),
                          ],
                        ),
                        Divider(height: 20.0),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: <Widget>[
                            Expanded(
                              child: Row(
                                children: <Widget>[
                                  CircleAvatar(
                                    backgroundImage: NetworkImage('https://beta.proypet.com/Uploads/Imagenes/Logo/LOGO_2095.PNG'),
                                    radius: 25.0,
                                  ),
                                  SizedBox(width: 7.0),
                                  Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: <Widget>[
                                      Text(
                                        'Veterinaria prueba',
                                        style: TextStyle(
                                          color: Colors.black87,
                                          fontSize: 17.0,
                                          fontWeight: FontWeight.w600
                                        ),
                                      ),
                                      Icon(Icons.local_hospital,size: 18.0,color: Colors.black.withOpacity(.5)),
                                    ],
                                  ),
                                ],
                              ),
                            ),
                            Column(
                              children: <Widget>[
                                Text(
                                  "10/01/19",
                                  style: TextStyle(color: Colors.black.withOpacity(.71),fontSize: 12.0,fontWeight: FontWeight.w600),
                                ),
                                Text(
                                  "17:00",
                                  style: TextStyle(color: colorMain[700],fontSize: 16.0,fontWeight: FontWeight.w600),
                                  textAlign: TextAlign.center,
                                ),
                              ],
                            ),
                          ],
                        ),
                        Divider(height: 20.0),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: <Widget>[
                            Expanded(
                              child: Row(
                                children: <Widget>[
                                  CircleAvatar(
                                    backgroundImage: NetworkImage('https://beta.proypet.com/Uploads/Imagenes/Logo/LOGO_2095.PNG'),
                                    radius: 25.0,
                                  ),
                                  SizedBox(width: 7.0),
                                  Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: <Widget>[
                                      Text(
                                        'Veterinaria prueba',
                                        style: TextStyle(
                                          color: Colors.black87,
                                          fontSize: 17.0,
                                          fontWeight: FontWeight.w600
                                        ),
                                      ),
                                      Icon(Icons.local_hospital,size: 18.0,color: Colors.black.withOpacity(.5)),
                                    ],
                                  ),
                                ],
                              ),
                            ),
                            Column(
                              children: <Widget>[
                                Text(
                                  "10/01/19",
                                  style: TextStyle(color: Colors.black.withOpacity(.71),fontSize: 12.0,fontWeight: FontWeight.w600),
                                ),
                                Text(
                                  "17:00",
                                  style: TextStyle(color: colorMain[700],fontSize: 16.0,fontWeight: FontWeight.w600),
                                  textAlign: TextAlign.center,
                                ),
                              ],
                            ),
                          ],
                        ),
                        Divider(height: 20.0),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: <Widget>[
                            Expanded(
                              child: Row(
                                children: <Widget>[
                                  CircleAvatar(
                                    backgroundImage: NetworkImage('https://beta.proypet.com/Uploads/Imagenes/Logo/LOGO_2095.PNG'),
                                    radius: 25.0,
                                  ),
                                  SizedBox(width: 7.0),
                                  Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: <Widget>[
                                      Text(
                                        'Veterinaria prueba',
                                        style: TextStyle(
                                          color: Colors.black87,
                                          fontSize: 17.0,
                                          fontWeight: FontWeight.w600
                                        ),
                                      ),
                                      Icon(Icons.local_hospital,size: 18.0,color: Colors.black.withOpacity(.5)),
                                    ],
                                  ),
                                ],
                              ),
                            ),
                            Column(
                              children: <Widget>[
                                Text(
                                  "10/01/19",
                                  style: TextStyle(color: Colors.black.withOpacity(.71),fontSize: 12.0,fontWeight: FontWeight.w600),
                                ),
                                Text(
                                  "17:00",
                                  style: TextStyle(color: colorMain[700],fontSize: 16.0,fontWeight: FontWeight.w600),
                                  textAlign: TextAlign.center,
                                ),
                              ],
                            ),
                          ],
                        ),
                        Divider(height: 20.0),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: <Widget>[
                            Expanded(
                              child: Row(
                                children: <Widget>[
                                  CircleAvatar(
                                    backgroundImage: NetworkImage('https://beta.proypet.com/Uploads/Imagenes/Logo/LOGO_2095.PNG'),
                                    radius: 25.0,
                                  ),
                                  SizedBox(width: 7.0),
                                  Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: <Widget>[
                                      Text(
                                        'Veterinaria prueba',
                                        style: TextStyle(
                                          color: Colors.black87,
                                          fontSize: 17.0,
                                          fontWeight: FontWeight.w600
                                        ),
                                      ),
                                      Icon(Icons.local_hospital,size: 18.0,color: Colors.black.withOpacity(.5)),
                                    ],
                                  ),
                                ],
                              ),
                            ),
                            Column(
                              children: <Widget>[
                                Text(
                                  "10/01/19",
                                  style: TextStyle(color: Colors.black.withOpacity(.71),fontSize: 12.0,fontWeight: FontWeight.w600),
                                ),
                                Text(
                                  "17:00",
                                  style: TextStyle(color: colorMain[700],fontSize: 16.0,fontWeight: FontWeight.w600),
                                  textAlign: TextAlign.center,
                                ),
                              ],
                            ),
                          ],
                        ),
                        Divider(height: 20.0),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: <Widget>[
                            Expanded(
                              child: Row(
                                children: <Widget>[
                                  CircleAvatar(
                                    backgroundImage: NetworkImage('https://beta.proypet.com/Uploads/Imagenes/Logo/LOGO_2095.PNG'),
                                    radius: 25.0,
                                  ),
                                  SizedBox(width: 7.0),
                                  Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: <Widget>[
                                      Text(
                                        'Veterinaria prueba',
                                        style: TextStyle(
                                          color: Colors.black87,
                                          fontSize: 17.0,
                                          fontWeight: FontWeight.w600
                                        ),
                                      ),
                                      Icon(Icons.local_hospital,size: 18.0,color: Colors.black.withOpacity(.5)),
                                    ],
                                  ),
                                ],
                              ),
                            ),
                            Column(
                              children: <Widget>[
                                Text(
                                  "10/01/19",
                                  style: TextStyle(color: Colors.black.withOpacity(.71),fontSize: 12.0,fontWeight: FontWeight.w600),
                                ),
                                Text(
                                  "17:00",
                                  style: TextStyle(color: colorMain[700],fontSize: 16.0,fontWeight: FontWeight.w600),
                                  textAlign: TextAlign.center,
                                ),
                              ],
                            ),
                          ],
                        ),
                        Divider(height: 20.0),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: <Widget>[
                            Expanded(
                              child: Row(
                                children: <Widget>[
                                  CircleAvatar(
                                    backgroundImage: NetworkImage('https://beta.proypet.com/Uploads/Imagenes/Logo/LOGO_2095.PNG'),
                                    radius: 25.0,
                                  ),
                                  SizedBox(width: 7.0),
                                  Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: <Widget>[
                                      Text(
                                        'Veterinaria prueba',
                                        style: TextStyle(
                                          color: Colors.black87,
                                          fontSize: 17.0,
                                          fontWeight: FontWeight.w600
                                        ),
                                      ),
                                      Icon(Icons.local_hospital,size: 18.0,color: Colors.black.withOpacity(.5)),
                                    ],
                                  ),
                                ],
                              ),
                            ),
                            Column(
                              children: <Widget>[
                                Text(
                                  "10/01/19",
                                  style: TextStyle(color: Colors.black.withOpacity(.71),fontSize: 12.0,fontWeight: FontWeight.w600),
                                ),
                                Text(
                                  "17:00",
                                  style: TextStyle(color: colorMain[700],fontSize: 16.0,fontWeight: FontWeight.w600),
                                  textAlign: TextAlign.center,
                                ),
                              ],
                            ),
                          ],
                        ),
                        Divider(height: 20.0),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: <Widget>[
                            Expanded(
                              child: Row(
                                children: <Widget>[
                                  CircleAvatar(
                                    backgroundImage: NetworkImage('https://beta.proypet.com/Uploads/Imagenes/Logo/LOGO_2095.PNG'),
                                    radius: 25.0,
                                  ),
                                  SizedBox(width: 7.0),
                                  Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: <Widget>[
                                      Text(
                                        'Veterinaria prueba',
                                        style: TextStyle(
                                          color: Colors.black87,
                                          fontSize: 17.0,
                                          fontWeight: FontWeight.w600
                                        ),
                                      ),
                                      Icon(Icons.local_hospital,size: 18.0,color: Colors.black.withOpacity(.5)),
                                    ],
                                  ),
                                ],
                              ),
                            ),
                            Column(
                              children: <Widget>[
                                Text(
                                  "10/01/19",
                                  style: TextStyle(color: Colors.black.withOpacity(.71),fontSize: 12.0,fontWeight: FontWeight.w600),
                                ),
                                Text(
                                  "17:00",
                                  style: TextStyle(color: colorMain[700],fontSize: 16.0,fontWeight: FontWeight.w600),
                                  textAlign: TextAlign.center,
                                ),
                              ],
                            ),
                          ],
                        ),
                        Divider(height: 20.0),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: <Widget>[
                            Expanded(
                              child: Row(
                                children: <Widget>[
                                  CircleAvatar(
                                    backgroundImage: NetworkImage('https://beta.proypet.com/Uploads/Imagenes/Logo/LOGO_2095.PNG'),
                                    radius: 25.0,
                                  ),
                                  SizedBox(width: 7.0),
                                  Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: <Widget>[
                                      Text(
                                        'Veterinaria prueba',
                                        style: TextStyle(
                                          color: Colors.black87,
                                          fontSize: 17.0,
                                          fontWeight: FontWeight.w600
                                        ),
                                      ),
                                      Icon(Icons.local_hospital,size: 18.0,color: Colors.black.withOpacity(.5)),
                                    ],
                                  ),
                                ],
                              ),
                            ),
                            Column(
                              children: <Widget>[
                                Text(
                                  "10/01/19",
                                  style: TextStyle(color: Colors.black.withOpacity(.71),fontSize: 12.0,fontWeight: FontWeight.w600),
                                ),
                                Text(
                                  "17:00",
                                  style: TextStyle(color: colorMain[700],fontSize: 16.0,fontWeight: FontWeight.w600),
                                  textAlign: TextAlign.center,
                                ),
                              ],
                            ),
                          ],
                        ),
                        Divider(height: 20.0),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: <Widget>[
                            Expanded(
                              child: Row(
                                children: <Widget>[
                                  CircleAvatar(
                                    backgroundImage: NetworkImage('https://beta.proypet.com/Uploads/Imagenes/Logo/LOGO_2095.PNG'),
                                    radius: 25.0,
                                  ),
                                  SizedBox(width: 7.0),
                                  Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: <Widget>[
                                      Text(
                                        'Veterinaria prueba',
                                        style: TextStyle(
                                          color: Colors.black87,
                                          fontSize: 17.0,
                                          fontWeight: FontWeight.w600
                                        ),
                                      ),
                                      Icon(Icons.local_hospital,size: 18.0,color: Colors.black.withOpacity(.5)),
                                    ],
                                  ),
                                ],
                              ),
                            ),
                            Column(
                              children: <Widget>[
                                Text(
                                  "10/01/19",
                                  style: TextStyle(color: Colors.black.withOpacity(.71),fontSize: 12.0,fontWeight: FontWeight.w600),
                                ),
                                Text(
                                  "17:00",
                                  style: TextStyle(color: colorMain[700],fontSize: 16.0,fontWeight: FontWeight.w600),
                                  textAlign: TextAlign.center,
                                ),
                              ],
                            ),
                          ],
                        ),
                        Divider(height: 20.0),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: <Widget>[
                            Expanded(
                              child: Row(
                                children: <Widget>[
                                  CircleAvatar(
                                    backgroundImage: NetworkImage('https://beta.proypet.com/Uploads/Imagenes/Logo/LOGO_2095.PNG'),
                                    radius: 25.0,
                                  ),
                                  SizedBox(width: 7.0),
                                  Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: <Widget>[
                                      Text(
                                        'Veterinaria prueba',
                                        style: TextStyle(
                                          color: Colors.black87,
                                          fontSize: 17.0,
                                          fontWeight: FontWeight.w600
                                        ),
                                      ),
                                      Icon(Icons.local_hospital,size: 18.0,color: Colors.black.withOpacity(.5)),
                                    ],
                                  ),
                                ],
                              ),
                            ),
                            Column(
                              children: <Widget>[
                                Text(
                                  "10/01/19",
                                  style: TextStyle(color: Colors.black.withOpacity(.71),fontSize: 12.0,fontWeight: FontWeight.w600),
                                ),
                                Text(
                                  "17:00",
                                  style: TextStyle(color: colorMain[700],fontSize: 16.0,fontWeight: FontWeight.w600),
                                  textAlign: TextAlign.center,
                                ),
                              ],
                            ),
                          ],
                        ),
                        Divider(height: 20.0),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: <Widget>[
                            Expanded(
                              child: Row(
                                children: <Widget>[
                                  CircleAvatar(
                                    backgroundImage: NetworkImage('https://beta.proypet.com/Uploads/Imagenes/Logo/LOGO_2095.PNG'),
                                    radius: 25.0,
                                  ),
                                  SizedBox(width: 7.0),
                                  Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: <Widget>[
                                      Text(
                                        'Veterinaria prueba',
                                        style: TextStyle(
                                          color: Colors.black87,
                                          fontSize: 17.0,
                                          fontWeight: FontWeight.w600
                                        ),
                                      ),
                                      Icon(Icons.local_hospital,size: 18.0,color: Colors.black.withOpacity(.5)),
                                    ],
                                  ),
                                ],
                              ),
                            ),
                            Column(
                              children: <Widget>[
                                Text(
                                  "10/01/19",
                                  style: TextStyle(color: Colors.black.withOpacity(.71),fontSize: 12.0,fontWeight: FontWeight.w600),
                                ),
                                Text(
                                  "17:00",
                                  style: TextStyle(color: colorMain[700],fontSize: 16.0,fontWeight: FontWeight.w600),
                                  textAlign: TextAlign.center,
                                ),
                              ],
                            ),
                          ],
                        ),
                        Divider(height: 20.0),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: <Widget>[
                            Expanded(
                              child: Row(
                                children: <Widget>[
                                  CircleAvatar(
                                    backgroundImage: NetworkImage('https://beta.proypet.com/Uploads/Imagenes/Logo/LOGO_2095.PNG'),
                                    radius: 25.0,
                                  ),
                                  SizedBox(width: 7.0),
                                  Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: <Widget>[
                                      Text(
                                        'Veterinaria prueba',
                                        style: TextStyle(
                                          color: Colors.black87,
                                          fontSize: 17.0,
                                          fontWeight: FontWeight.w600
                                        ),
                                      ),
                                      Icon(Icons.local_hospital,size: 18.0,color: Colors.black.withOpacity(.5)),
                                    ],
                                  ),
                                ],
                              ),
                            ),
                            Column(
                              children: <Widget>[
                                Text(
                                  "10/01/19",
                                  style: TextStyle(color: Colors.black.withOpacity(.71),fontSize: 12.0,fontWeight: FontWeight.w600),
                                ),
                                Text(
                                  "17:00",
                                  style: TextStyle(color: colorMain[700],fontSize: 16.0,fontWeight: FontWeight.w600),
                                  textAlign: TextAlign.center,
                                ),
                              ],
                            ),
                          ],
                        ),
                        Divider(height: 20.0),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: <Widget>[
                            Expanded(
                              child: Row(
                                children: <Widget>[
                                  CircleAvatar(
                                    backgroundImage: NetworkImage('https://beta.proypet.com/Uploads/Imagenes/Logo/LOGO_2095.PNG'),
                                    radius: 25.0,
                                  ),
                                  SizedBox(width: 7.0),
                                  Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: <Widget>[
                                      Text(
                                        'Veterinaria prueba',
                                        style: TextStyle(
                                          color: Colors.black87,
                                          fontSize: 17.0,
                                          fontWeight: FontWeight.w600
                                        ),
                                      ),
                                      Icon(Icons.local_hospital,size: 18.0,color: Colors.black.withOpacity(.5)),
                                    ],
                                  ),
                                ],
                              ),
                            ),
                            Column(
                              children: <Widget>[
                                Text(
                                  "10/01/19",
                                  style: TextStyle(color: Colors.black.withOpacity(.71),fontSize: 12.0,fontWeight: FontWeight.w600),
                                ),
                                Text(
                                  "17:00",
                                  style: TextStyle(color: colorMain[700],fontSize: 16.0,fontWeight: FontWeight.w600),
                                  textAlign: TextAlign.center,
                                ),
                              ],
                            ),
                          ],
                        ),
                        Divider(height: 20.0),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: <Widget>[
                            Expanded(
                              child: Row(
                                children: <Widget>[
                                  CircleAvatar(
                                    backgroundImage: NetworkImage('https://beta.proypet.com/Uploads/Imagenes/Logo/LOGO_2095.PNG'),
                                    radius: 25.0,
                                  ),
                                  SizedBox(width: 7.0),
                                  Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: <Widget>[
                                      Text(
                                        'Veterinaria prueba',
                                        style: TextStyle(
                                          color: Colors.black87,
                                          fontSize: 17.0,
                                          fontWeight: FontWeight.w600
                                        ),
                                      ),
                                      Icon(Icons.local_hospital,size: 18.0,color: Colors.black.withOpacity(.5)),
                                    ],
                                  ),
                                ],
                              ),
                            ),
                            Column(
                              children: <Widget>[
                                Text(
                                  "10/01/19",
                                  style: TextStyle(color: Colors.black.withOpacity(.71),fontSize: 12.0,fontWeight: FontWeight.w600),
                                ),
                                Text(
                                  "17:00",
                                  style: TextStyle(color: colorMain[700],fontSize: 16.0,fontWeight: FontWeight.w600),
                                  textAlign: TextAlign.center,
                                ),
                              ],
                            ),
                          ],
                        ),
                        Divider(height: 20.0),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: <Widget>[
                            Expanded(
                              child: Row(
                                children: <Widget>[
                                  CircleAvatar(
                                    backgroundImage: NetworkImage('https://beta.proypet.com/Uploads/Imagenes/Logo/LOGO_2095.PNG'),
                                    radius: 25.0,
                                  ),
                                  SizedBox(width: 7.0),
                                  Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: <Widget>[
                                      Text(
                                        'Veterinaria prueba',
                                        style: TextStyle(
                                          color: Colors.black87,
                                          fontSize: 17.0,
                                          fontWeight: FontWeight.w600
                                        ),
                                      ),
                                      Icon(Icons.local_hospital,size: 18.0,color: Colors.black.withOpacity(.5)),
                                    ],
                                  ),
                                ],
                              ),
                            ),
                            Column(
                              children: <Widget>[
                                Text(
                                  "10/01/19",
                                  style: TextStyle(color: Colors.black.withOpacity(.71),fontSize: 12.0,fontWeight: FontWeight.w600),
                                ),
                                Text(
                                  "17:00",
                                  style: TextStyle(color: colorMain[700],fontSize: 16.0,fontWeight: FontWeight.w600),
                                  textAlign: TextAlign.center,
                                ),
                              ],
                            ),
                          ],
                        ),
                        Divider(height: 20.0),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: <Widget>[
                            Expanded(
                              child: Row(
                                children: <Widget>[
                                  CircleAvatar(
                                    backgroundImage: NetworkImage('https://beta.proypet.com/Uploads/Imagenes/Logo/LOGO_2095.PNG'),
                                    radius: 25.0,
                                  ),
                                  SizedBox(width: 7.0),
                                  Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: <Widget>[
                                      Text(
                                        'Veterinaria prueba',
                                        style: TextStyle(
                                          color: Colors.black87,
                                          fontSize: 17.0,
                                          fontWeight: FontWeight.w600
                                        ),
                                      ),
                                      Icon(Icons.local_hospital,size: 18.0,color: Colors.black.withOpacity(.5)),
                                    ],
                                  ),
                                ],
                              ),
                            ),
                            Column(
                              children: <Widget>[
                                Text(
                                  "10/01/19",
                                  style: TextStyle(color: Colors.black.withOpacity(.71),fontSize: 12.0,fontWeight: FontWeight.w600),
                                ),
                                Text(
                                  "17:00",
                                  style: TextStyle(color: colorMain[700],fontSize: 16.0,fontWeight: FontWeight.w600),
                                  textAlign: TextAlign.center,
                                ),
                              ],
                            ),
                          ],
                        ),
                      ],
                    ),
                      
                    ],
                  
                  // child: Column(
                  //   crossAxisAlignment: CrossAxisAlignment.start,
                  //   mainAxisAlignment: MainAxisAlignment.start,
                  //   )
                ),
            ),
          ),
          //
          Positioned(
            top: 0,
            left: 0,
            right: 0,
            child: AppBar(
              backgroundColor: Colors.transparent,
              elevation: 0,
              centerTitle: true,
              title: Text("",style: TextStyle(
                fontSize: 16.0,
                fontWeight: FontWeight.normal
              ),),
            ),
          )

        ]
      ),
    );
  }
}
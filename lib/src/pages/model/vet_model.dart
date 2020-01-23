import 'package:google_maps_flutter/google_maps_flutter.dart';

class Vet {
  int idvet;
  String nombre;
  String estrellas;
  String votantes;
  String direccion;
  String distancia;
  String descripcion;
  LatLng locationCoords;
  List<String> imagen;
  String logo;
  List<String> servicio;
  List<String> imagenServicio;
  

  Vet({
    this.idvet,
    this.nombre,
    this.estrellas,
    this.votantes,
    this.direccion,
    this.distancia,
    this.descripcion,
    this.locationCoords,
    this.imagen,
    this.logo,
    this.servicio,
    this.imagenServicio
  });
}

class Servicio {
  String servicio;
  String imagenServicio;

  Servicio(List<String> servicio, List<String> imagenServicio);
}

final List<Vet> vetLocales = [
  Vet(
      idvet:1,
      nombre: 'Pirulino pirulin, pirulin pimpom, la unica camisa y el unico pantalon',
      estrellas: '4.1',
      votantes: '+1.2K',
      direccion: 'Abc 1234',
      distancia: '1 km',
      descripcion:
          'Lorem ipsum dolor sit, amet consectetur adipisicing elit. Ratione architecto autem quasi nisi',
      locationCoords: LatLng(-12.009395, -77.105314),
      imagen: ['images/vet_prueba.jpg','images/imagesvet.jpg'],
      logo:'https://beta.proypet.com/Uploads/Imagenes/Logo/LOGO_2095.PNG',
      servicio: ['Servicio 1','Servicio 3'],
      imagenServicio: ['images/veterinaria2.png','images/veterinaria3.png']
      ),
  Vet(
      idvet:2,
      nombre: 'Veterinaria Prueba',
      estrellas: '3.5',
      votantes: '+1.2M',
      direccion: 'Abc 1234',
      distancia: '1.3 km',
      descripcion:
          'Lorem ipsum dolor sit, amet consectetur adipisicing elit. Ratione architecto autem quasi nisi',
      locationCoords: LatLng(-12.008109, -77.102396),
      imagen: ['images/vet_prueba.jpg','images/imagesvet.jpg'],
      logo:'https://beta.proypet.com/Uploads/Imagenes/Logo/LOGO_81.JPEG',
      servicio: ['Servicio 1','Servicio 2','Servicio 3','Servicio 1','Servicio 2','Servicio 3','Servicio 1','Servicio 2','Servicio 3','Servicio 1','Servicio 2','Servicio 3'],
      imagenServicio: ['images/veterinaria2.png','images/veterinaria3.png','images/veterinaria.png','images/veterinaria2.png','images/veterinaria3.png','images/veterinaria.png','images/veterinaria2.png','images/veterinaria3.png','images/veterinaria.png','images/veterinaria2.png','images/veterinaria3.png','images/veterinaria.png']
      ),
  Vet(
      idvet:3,
      nombre: 'Veterinaria Prueba',
      estrellas: '3.7',
      votantes: '+2.3K',
      direccion: 'Abc 1234',
      distancia: '1.4 km',
      descripcion:
          'Lorem ipsum dolor sit, amet consectetur adipisicing elit. Ratione architecto autem quasi nisi',
      locationCoords: LatLng(-12.053141, -77.085230),
      imagen: ['images/vet_prueba.jpg','images/imagesvet.jpg'],
      logo:'https://beta.proypet.com/Uploads/Imagenes/Logo/LOGO_82.JPG',
      servicio: ['Servicio 1','Servicio 2','Servicio 3'],
      imagenServicio: ['images/veterinaria2.png','images/veterinaria3.png','images/veterinaria.png']
      ),
  Vet(
      idvet:4,
      nombre: 'Veterinaria Prueba',
      estrellas: '4.8',
      votantes: '+3.2K',
      direccion: 'Abc 1234',
      distancia: '2 km',
      descripcion:
          'Lorem ipsum dolor sit, amet consectetur adipisicing elit. Ratione architecto autem quasi nisi',
      locationCoords: LatLng(-12.072574, -77.164833),
      imagen: ['images/vet_prueba.jpg','images/imagesvet.jpg'],
      logo:'https://beta.proypet.com/Uploads/Imagenes/Logo/LOGO_2.PNG',
      servicio: ['Servicio 1','Servicio 2','Servicio 3'],
      imagenServicio: ['images/veterinaria2.png','images/veterinaria3.png','images/veterinaria.png']
      ),
  Vet(
      idvet:5,
      nombre: 'Veterinaria Prueba',
      estrellas: '3.3',
      votantes: '102',
      direccion: 'Abc 1234',
      distancia: '3.5 km',
      descripcion:
          'Lorem ipsum dolor sit, amet consectetur adipisicing elit. Ratione architecto autem quasi nisi',
      locationCoords: LatLng(-12.074524, -77.163759),
      imagen: ['images/vet_prueba.jpg','images/imagesvet.jpg'],
      logo:'https://beta.proypet.com/Uploads/Imagenes/Logo/LOGO_2096.PNG',
      servicio: ['Servicio 1','Servicio 2','Servicio 3'],
      imagenServicio: ['images/veterinaria2.png','images/veterinaria3.png','images/veterinaria.png']
      )
];


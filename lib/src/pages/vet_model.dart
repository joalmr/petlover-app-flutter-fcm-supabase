import 'package:google_maps_flutter/google_maps_flutter.dart';

class Vet {
  String nombre;
  String direccion;
  String descripcion;
  String imagen;
  LatLng locationCoords;

  Vet(
      {this.nombre,
      this.direccion,
      this.descripcion,
      this.imagen,
      this.locationCoords});
}

final List<Vet> vetLocales = [
  Vet(
      nombre: 'Veterinaria Prueba',
      direccion: 'Abc 1234',
      descripcion:
          'Lorem ipsum dolor sit, amet consectetur adipisicing elit. Ratione architecto autem quasi nisi',
      locationCoords: LatLng(-12.009395, -77.105314),
      imagen: 'https://beta.proypet.com/Uploads/Imagenes/Logo/LOGO_2095.PNG'
      ),
  Vet(
      nombre: 'Veterinaria Prueba',
      direccion: 'Abc 1234',
      descripcion:
          'Lorem ipsum dolor sit, amet consectetur adipisicing elit. Ratione architecto autem quasi nisi',
      locationCoords: LatLng(-12.008109, -77.102396),
      imagen: 'https://beta.proypet.com/Uploads/Imagenes/Logo/LOGO_2095.PNG'
      ),
  Vet(
      nombre: 'Veterinaria Prueba',
      direccion: 'Abc 1234',
      descripcion:
          'Lorem ipsum dolor sit, amet consectetur adipisicing elit. Ratione architecto autem quasi nisi',
      locationCoords: LatLng(-12.053141, -77.085230),
      imagen: 'https://beta.proypet.com/Uploads/Imagenes/Logo/LOGO_2095.PNG'
      ),
  Vet(
      nombre: 'Veterinaria Prueba',
      direccion: 'Abc 1234',
      descripcion:
          'Lorem ipsum dolor sit, amet consectetur adipisicing elit. Ratione architecto autem quasi nisi',
      locationCoords: LatLng(-12.072574, -77.164833),
      imagen: 'https://beta.proypet.com/Uploads/Imagenes/Logo/LOGO_2095.PNG'
      ),
  Vet(
      nombre: 'Veterinaria Prueba',
      direccion: 'Abc 1234',
      descripcion:
          'Lorem ipsum dolor sit, amet consectetur adipisicing elit. Ratione architecto autem quasi nisi',
      locationCoords: LatLng(-12.074524, -77.163759),
      imagen: 'https://beta.proypet.com/Uploads/Imagenes/Logo/LOGO_2095.PNG'
      )
];


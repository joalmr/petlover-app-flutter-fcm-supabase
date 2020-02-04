class Mascota{
  int idMascota;
  String nombre;
  String raza;
  String edad;
  String foto;
  String peso;

  Mascota({
    this.idMascota,
    this.nombre,
    this.raza,
    this.edad,
    this.foto,
    this.peso,
  });
}

final List<Mascota> mascotaList = [
  Mascota(
    idMascota: 1,
    nombre: 'Greco',
    raza: 'Cocker spaniel',
    edad: '4 años 1 mes',
    foto: 'images/greco.png',
    peso: '12.45'
  ),
  Mascota(
    idMascota: 2,
    nombre: 'Perikito pimpim',
    raza: 'Braco',
    edad: '5 años 3 meses',
    foto: 'images/perro2.jpg',
    peso: '14.65'
  ),
  Mascota(
    idMascota: 3,
    nombre: 'Perrin',
    raza: 'Perro peruano',
    edad: '2 años',
    foto: 'images/perro3.png',
    peso: '10.25'
  ),

];
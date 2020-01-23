class Mascota{
  int idMascota;
  String nombre;
  String raza;
  String edad;
  String foto;

  Mascota({
    this.idMascota,
    this.nombre,
    this.raza,
    this.edad,
    this.foto
  });
}

final List<Mascota> mascotaList = [
  Mascota(
    idMascota: 1,
    nombre: 'Greco',
    raza: 'Cocker spaniel',
    edad: '4 años 1 mes',
    foto: 'images/greco.png'
  ),
  Mascota(
    idMascota: 2,
    nombre: 'Perikito pimpim',
    raza: 'Bulldog frances',
    edad: '5 años 3 meses',
    foto: 'images/greco.png'
  ),
  Mascota(
    idMascota: 2,
    nombre: 'Perrin',
    raza: 'Bulldog ingles',
    edad: '2 años',
    foto: 'images/greco.png'
  ),

];
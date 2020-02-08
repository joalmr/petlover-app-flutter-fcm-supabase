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

calculateAge(DateTime birthDate) {
  DateTime currentDate = DateTime.now();
  String resp;
  int age = currentDate.year - birthDate.year;
  int month1 = currentDate.month;
  int month2 = birthDate.month;
  if (month2 > month1) {
    age--;
    month2=month2-month1;
  } else if (month1 == month2) {
    int day1 = currentDate.day;
    int day2 = birthDate.day;
    if (day2 > day1) {
      age--;
    }
  }
  String rAnio=' años';
  String rMes=' meses';
  if(age==1){ rAnio=' año';}
  if(month2==1){rMes=' mes';}
  resp = age.toString()+ rAnio +' '+ month2.toString()+rMes;
  return resp;
}
//.now().add(new Duration(days: -700))
final List<Mascota> mascotaList = [
  Mascota(
    idMascota: 1,
    nombre: 'Greco',
    raza: 'Cocker spaniel',
    edad: calculateAge(DateTime.parse('2015-12-15')).toString(),
    foto: 'images/greco.png',
    peso: '12.45'
  ),
  Mascota(
    idMascota: 2,
    nombre: 'Perikito pimpim',
    raza: 'Braco',
    edad: calculateAge(DateTime.parse('2020-01-01')).toString(),
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
  Mascota(
    idMascota: 4,
    nombre: 'Chulin',
    raza: 'Perro peruano',
    edad: '2 años',
    foto: 'images/perro3.png',
    peso: '10.25'
  )

];
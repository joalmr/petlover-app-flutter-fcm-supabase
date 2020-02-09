// class DdlMascota{
//   int idMascota;
//   String nombre;
//   DdlMascota({
//     this.idMascota,
//     this.nombre
//   });
// }

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
    edad: calculateAge(DateTime.parse('2020-01-21')).toString(),
    foto: 'images/perro2.jpg',
    peso: '14.65'
  ),
  Mascota(
    idMascota: 3,
    nombre: 'Perrin',
    raza: 'Perro peruano',
    edad: calculateAge(DateTime.parse('2020-02-03')).toString(),
    foto: 'images/perro3.png',
    peso: '6.25'
  ),
  Mascota(
    idMascota: 4,
    nombre: 'Chulin',
    raza: 'Perro peruano',
    edad: calculateAge(DateTime.parse('2019-02-15')).toString(),
    foto: 'images/perro3.png',
    peso: '8.35'
  ),
  Mascota(
    idMascota: 4,
    nombre: 'Perez',
    raza: 'Perro peruano',
    edad: calculateAge(DateTime.parse('2020-01-08')).toString(),
    foto: 'images/perro3.png',
    peso: '10.25'
  )

];

calculateAge(DateTime birthDate) {
  String resp; 
  int edad,mes,dia,diferencia;
  DateTime currentDate = DateTime.now();
  Duration difference = currentDate.difference(birthDate);
  diferencia = difference.inDays;
  edad = diferencia ~/ 365;
  mes = (diferencia ~/ 30)%12;
  dia = ((diferencia % 365)%30);

  String rAnio=' años';
  String rMes=' meses';
  String rDia=' días';

  if(edad==1) rAnio=' año';
  if(mes==1) rMes=' mes';
  if(dia==1) rDia=' día';

  if(edad==0 && mes>0){
    resp = mes.toString() + rMes;
  }
  if(edad==0 && mes==0){
    resp =  dia.toString() + rDia;
  }
  if(edad>0 && mes==0){
    resp = edad.toString() + rAnio;
  }
  if(edad>0 && mes>0){
    resp = edad.toString() + rAnio +' '+ mes.toString() + rMes;
  }
  
  return resp;
}
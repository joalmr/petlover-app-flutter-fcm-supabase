class Proxima{
  int idProxima;//idreserva
  String fotoMascota;
  String nombreVet;
  String direccionVet;
  String diaVet;
  String horaVet;

  Proxima({
    this.idProxima,
    this.fotoMascota,
    this.nombreVet,
    this.direccionVet,
    this.diaVet,
    this.horaVet,
  });
}

final List<Proxima> proximaList = [
  Proxima(
    idProxima: 1,
    fotoMascota: 'images/greco.png',
    nombreVet: 'Veterinaria Prueba',
    direccionVet: 'Abc 123',
    diaVet: 'Mañana',
    horaVet: '17:00'
  ),
  Proxima(
    idProxima: 2,
    fotoMascota: 'images/perro2.jpg',
    nombreVet: 'Vet 2',
    direccionVet: 'Abc 123',
    diaVet: '10/03',
    horaVet: '15:00'
  ),

];
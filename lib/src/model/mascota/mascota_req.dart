class MascotaReq {
  String idKey;
  String name;
  String birthdate;
  int specie;
  int breed;
  bool genre;
  

  MascotaReq({
    this.idKey,
    this.name,
    this.birthdate,
    this.specie,
    this.breed,
    this.genre = false,
  });
}

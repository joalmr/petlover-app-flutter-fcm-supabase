class MascotaReq {
  String name;
  String birthdate;
  int specie;
  int breed;
  bool genre;

  MascotaReq({
      this.name,
      this.birthdate,
      this.specie,
      this.breed,
      this.genre = false,
  });
}

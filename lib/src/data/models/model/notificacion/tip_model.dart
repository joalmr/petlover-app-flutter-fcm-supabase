class Tip{
  int id;
  String image;
  String title;

  Tip({
    this.id,
    this.image,
    this.title,
  });
}

//.now().add(new Duration(days: -700))
final List<Tip> tipList = [
  Tip(
    id: 1,
    image: 'images/proypetip/TIP1.png',
    title: '¿Cuándo siente frío tu perro?',
  ),
  Tip(
    id: 2,
    image: 'images/proypetip/TIP2.png',
    title: 'Cuidado con el mal aliento',
  ),
  Tip(
    id: 3,
    image: 'images/proypetip/TIP3.png',
    title: 'Alimento prohibido para mascotas',
  ),

];
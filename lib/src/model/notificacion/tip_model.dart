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
    image: 'images/proypetip1.jpg',
    title: 'Combate el frío',
  ),

];
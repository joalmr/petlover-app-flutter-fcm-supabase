class Destacado{
  int id;
  String image;
  String title;
  String text;
  String author;

  Destacado({
    this.id,
    this.image,
    this.title,
    this.text,
    this.author,
  });
}

//.now().add(new Duration(days: -700))
final List<Destacado> destacadoList = [
  Destacado(
    id: 1,
    image: 'images/mascotas.png',
    title: '¿Cómo atender a mi mascota durante el estado de emergencia?',
    text: 'Si tienes mascotas (perros, gatos u otro animal doméstico), revisa estas recomendaciones del Ministerio del Ambiente (Minam) para atender sus necesidades diarias y urgencias por motivos de salud, durante el periodo de aislamiento social obligatorio:\n\n'+
      'Por higiene, puedes sacar a tu perro para que haga sus necesidades. Asegúrate de llevarlo a sitios muy cercanos a tu casa, ser breve, usar mascarilla y mantener tu distancia social. Recuerda recoger sus heces antes de irte. No utilices esta salida como una excusa para incumplir la cuarentena.\n\n'+
      'Si tu perro no hace sus necesidades en el breve tiempo que lo sacaste, vuelve a intentarlo al día siguiente. Si las hace dentro de casa, limpia sin regañarlo. Él no sabe lo que está pasando; entiéndelo y no lo hagas sentir culpable.\n\n'+
      'Durante la restricción de salida de los domingos por la inmovilización social obligatoria, puedes sacar a tu perro a hacer sus necesidades lo más rápido posible como excepción, según el ministro del Interior, Carlos Morán. Toma en cuenta que no es un paseo, solo puedes salir cerca a la puerta de tu vivienda.\n\n'+
      'Aprovecha los domingos para bañar a tu mascota y enseñarle nuevos trucos. Pasar más tiempo con ellos los ayudará a relajarse.\n\n'+
      'Los centros veterinarios solo atenderán casos de emergencia, en los que la vida o la salud de las mascotas corra riesgo. Consulta con tu veterinario sobre sus servicios.\n\n'+
      'Podrás adquirir alimentos para mascotas en los centros de abastecimiento como supermercados o bodegas. Si tu mascota tiene una necesidad muy específica para su alimentación por temas de salud, también podrás comprar sus productos, como una de las excepciones del estado de emergencia.\n\n'+
      'Los importadores y distribuidores de arena sanitaria para gatos y alimentos para aves pueden seguir brindando el servicio esencial, pero hay que procurar parar de ser posible.',
    author: 'www.gob.pe'
  ),

];
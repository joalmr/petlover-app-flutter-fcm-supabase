class ListaVacuna {
  String name;
  String dateIn;

  ListaVacuna({
    this.name,
    this.dateIn,
  });
}

final List<ListaVacuna> vacunaLista = [
  ListaVacuna(
    name: 'Vacuna blabla 1',
    dateIn: '12-10-2020',
  ),
  ListaVacuna(
    name: 'Vacuna blabla 2',
    dateIn: '12-09-2020',
  ),
  ListaVacuna(
    name: 'Vacuna blabla 3',
    dateIn: '12-09-2020',
  ),
  ListaVacuna(
    name: 'Vacuna blabla 4',
    dateIn: '14-07-2020',
  ),
];

class ListaVacuna {
  String name;
  String dateIn;
  String dateReturn;

  ListaVacuna({
    this.name,
    this.dateIn,
    this.dateReturn,
  });
}

final List<ListaVacuna> vacunaLista = [
  ListaVacuna(
    name: 'Vacuna blabla 1',
    dateIn: '12-10-2020',
    dateReturn: '12-12-2020',
  ),
  ListaVacuna(
    name: 'Vacuna blabla 2',
    dateIn: '12-09-2020',
    dateReturn: '14-12-2020',
  ),
  ListaVacuna(
    name: 'Vacuna blabla 3',
    dateIn: '12-09-2020',
    dateReturn: '16-12-2020',
  ),
  ListaVacuna(
    name: 'Vacuna blabla 4',
    dateIn: '14-07-2020',
    dateReturn: '18-12-2020',
  ),
];

enum AppRoute {
  home('/'),
  newContact('/contact/new'),
  editContact('/contact/edit');

  const AppRoute(this.route);

  final String route;
}

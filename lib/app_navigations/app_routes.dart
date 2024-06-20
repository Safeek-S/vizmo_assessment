enum AppRoute {
  splashScreen('splashScreen'),
  eventsScreen('eventsScreen'),
  eventInfoScreen('eventInfoScreen');

  final String routeName;
  const AppRoute(this.routeName);

  @override
  String toString() {
    return routeName;
  }
}

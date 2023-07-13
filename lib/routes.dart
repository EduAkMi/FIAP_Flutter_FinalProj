enum Routes { splash, login, facts }

extension RouteName on Routes {
  String get name {
    switch (this) {
      case Routes.facts:
        return 'factsScreen';
      case Routes.login:
        return 'loginScreen';
      case Routes.splash:
        return 'splashScreen';
    }
  }
}

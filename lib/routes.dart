enum Routes { login, facts }

extension RouteName on Routes {
  String get name {
    switch (this) {
      case Routes.facts:
        return 'factsScreen';
      case Routes.login:
        return 'loginScreen';
    }
  }
}

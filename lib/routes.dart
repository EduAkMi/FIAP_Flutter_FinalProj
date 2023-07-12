enum Routes { login, home }

extension RouteName on Routes {
  String get name {
    switch (this) {
      case Routes.home:
        return 'homeScreen';
      case Routes.login:
        return 'loginScreen';
    }
  }
}

enum Routes { splash, login, signIn, signOn, facts, fact }

extension RouteName on Routes {
  String get name {
    switch (this) {
      case Routes.facts:
        return 'factsScreen';
      case Routes.fact:
        return 'factScreen';
      case Routes.login:
        return 'loginScreen';
      case Routes.signIn:
        return 'signInScreen';
      case Routes.signOn:
        return 'signOnScreen';
      case Routes.splash:
        return 'splashScreen';
    }
  }
}

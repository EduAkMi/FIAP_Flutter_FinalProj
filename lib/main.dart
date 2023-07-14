import 'package:final_project/modules/facts/views/fact_screen.dart';
import 'package:final_project/modules/login/views/sign_in_screen.dart';
import 'package:final_project/modules/login/views/sign_on_screen.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

import 'modules/facts/bloc/facts_cubit.dart';
import 'modules/facts/containers/facts_container.dart';
import 'modules/login/views/login_screen.dart';
import 'modules/splash/splash_screen.dart';
import 'routes.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'FlutterFinalProject',
      theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple), useMaterial3: true),
      initialRoute: Routes.splash.name,
      routes: {
        Routes.facts.name: (_) => FactsCubitProvider(child: FactsContainer()),
        Routes.fact.name: (context) => _getFactScreen(context),
        Routes.login.name: (_) => const LoginScreen(),
        Routes.signIn.name: (_) => SignInScreen(),
        Routes.signOn.name: (_) => SignOnScreen(),
        Routes.splash.name: (_) => const SplashScreen()
      },
    );
  }

  FactScreen _getFactScreen(BuildContext context) {
    final arguments = ModalRoute.of(context)?.settings.arguments as FactScreenParams;
    return FactScreen(params: arguments);
  }
}

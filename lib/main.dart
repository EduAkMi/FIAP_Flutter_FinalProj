import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

import 'modules/facts/bloc/facts_cubit.dart';
import 'modules/facts/containers/facts_container.dart';
import 'modules/login/login_screen.dart';
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
        Routes.login.name: (_) => LoginScreen(),
        Routes.splash.name: (_) => const SplashScreen()
      },
    );
  }
}

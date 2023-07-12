import 'package:final_project/modules/facts/bloc/facts_cubit.dart';
import 'package:final_project/modules/facts/containers/facts_container.dart';
import 'package:final_project/modules/login/login_screen.dart';
import 'package:final_project/routes.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

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
      initialRoute: Routes.facts.name,
      routes: {
        Routes.facts.name: (_) => FactsCubitProvider(child: FactsContainer()),
        Routes.login.name: (_) => LoginScreen()
      },
    );
  }
}

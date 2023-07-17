import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import '../../routes.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    Future.delayed(const Duration(seconds: 1)).then((_) {
      var currentUser = FirebaseAuth.instance.currentUser;
      String route;
      if (currentUser == null) {
        route = Routes.login.name;
      } else {
        route = Routes.facts.name;
      }
      Navigator.pushReplacementNamed(context, route);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
        color: Colors.greenAccent,
        child: const Center(
          child: SizedBox(
            child: Text(
              "!Splash\n\n\n\n\nScreen!",
              style: TextStyle(
                color: Colors.red
              ),
            ),
          ),
        ));
  }
}

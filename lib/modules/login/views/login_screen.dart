import 'package:flutter/material.dart';

import '../../../routes.dart';
import 'components/menu_button.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.teal,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              MenuButton(
                text: "Sign In",
                onPressed: () {
                  Navigator.pushNamed(context, Routes.signIn.name);
                },
              ),
              const SizedBox(height: 16),
              MenuButton(
                text: "Create account",
                onPressed: () {
                  Navigator.pushNamed(context, Routes.signOn.name);
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}

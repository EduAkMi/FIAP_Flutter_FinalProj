import 'package:flutter/material.dart';

import '../bloc/sign_in_cubit.dart';
import '../containers/sign_in_container.dart';
import 'components/menu_button.dart';

class SignInScreen extends StatelessWidget {
  SignInScreen({super.key});

  var email = '';
  var password = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.greenAccent,
      appBar: AppBar(
        backgroundColor: Colors.greenAccent,
        title: const Text(
          'Sign In',
          style: TextStyle(
            color: Colors.black,
          ),
        ),
        leading: IconButton(
          onPressed: () => Navigator.pop(context),
          icon: const Icon(
            Icons.arrow_back,
            color: Colors.black,
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextField(
              keyboardType: TextInputType.emailAddress,
              decoration: InputDecoration(
                fillColor: Colors.white54,
                filled: true,
                labelText: 'Email',
                focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide(
                    color: Theme.of(context).colorScheme.primary,
                    width: 2,
                  ),
                  borderRadius: BorderRadius.circular(16),
                ),
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(16),
                ),
              ),
              onChanged: (newEmail) {
                email = newEmail;
              },
            ),
            const SizedBox(height: 16),
            TextField(
              onChanged: (newPassword) {
                password = newPassword;
              },
              obscureText: true,
              decoration: InputDecoration(
                fillColor: Colors.white54,
                filled: true,
                labelText: 'Password',
                focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide(
                    color: Theme.of(context).colorScheme.primary,
                    width: 2,
                  ),
                  borderRadius: BorderRadius.circular(16),
                ),
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(16),
                ),
              ),
            ),
            const SizedBox(height: 32),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: MenuButton(
                text: 'Sign In',
                onPressed: () {
                  SignInContainer.signIn(email, password);
                },
              ),
            ),
            SignInProvider(child: SignInContainer()),
          ],
        ),
      ),
    );
  }
}

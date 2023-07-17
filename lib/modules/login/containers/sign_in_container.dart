import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../bloc/sign_in_cubit.dart';
import '../bloc/login_cubit_state.dart';

class SignInContainer extends BlocConsumer<SignInCubit, LoginCubitState> {
  static Function(String, String) signIn = (String email, String password) {};

  SignInContainer({
    super.key,
  }) : super(
          listener: (context, state) {
            if (state.status == LoginCubitStateStatus.error) {
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(
                  backgroundColor: Colors.red,
                  content: Text(
                    state.error ?? '',
                  ),
                ),
              );
            }
          },
          builder: (context, state) {
            signIn = (email, password) {
              SignInProvider.of(context).signInUser(
                context: context,
                email: email,
                password: password,
              );
            };
            switch (state.status) {
              case null:
                return const SizedBox();
              case LoginCubitStateStatus.loading:
                return const CircularProgressIndicator(
                  color: Colors.white,
                );
              case LoginCubitStateStatus.error:
                return const SizedBox();
            }
          },
        );
}

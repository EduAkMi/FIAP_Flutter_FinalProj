import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../bloc/login_cubit_state.dart';
import '../bloc/sign_on_cubit.dart';

class SignOnContainer extends BlocConsumer<SignOnCubit, LoginCubitState> {
  static Function(String, String) signOn = (String email, String password) {};

  SignOnContainer({
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
            signOn = (email, password) {
              SignOnProvider.of(context).signOnUser(
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

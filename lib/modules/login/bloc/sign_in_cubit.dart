import 'package:final_project/modules/login/bloc/login_cubit_state.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../routes.dart';

class SignInCubit extends Cubit<LoginCubitState> {
  SignInCubit()
      : super(
          const LoginCubitState(),
        );

  void _emitLoading() {
    emit(
      state.copyWith(
        status: LoginCubitStateStatus.loading,
      ),
    );
  }

  void _emitError(String error) {
    emit(
      state.copyWith(
        status: LoginCubitStateStatus.error,
        error: error,
      ),
    );
  }

  Future<void> signInUser({
    required BuildContext context,
    required String email,
    required String password,
  }) async {
    _emitLoading();
    final authInstance = FirebaseAuth.instance;

    authInstance
        .signInWithEmailAndPassword(
          email: email,
          password: password,
        )
        .then((_) => Navigator.pushReplacementNamed(context, Routes.facts.name))
        .onError((error, stackTrace) => _emitError(
              (error as FirebaseException).message ?? 'Erro desconhecido',
            ));
  }
}

class SignInProvider extends BlocProvider<SignInCubit> {
  SignInProvider({
    Key? key,
    Widget? child,
  }) : super(
          key: key,
          create: (_) => SignInCubit(),
          child: child,
        );

  static SignInCubit of(BuildContext context) => BlocProvider.of<SignInCubit>(context);
}

import 'package:final_project/modules/login/bloc/login_cubit_state.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../routes.dart';

class SignOnCubit extends Cubit<LoginCubitState> {
  SignOnCubit()
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

  Future<void> signOnUser({
    required BuildContext context,
    required String email,
    required String password,
  }) async {
    _emitLoading();
    final authInstance = FirebaseAuth.instance;

    authInstance
        .createUserWithEmailAndPassword(
      email: email,
      password: password,
    )
        .then((_) => Navigator.pushReplacementNamed(context, Routes.facts.name))
        .onError(
          (error, stackTrace) =>
          _emitError(
            (error as FirebaseException).message ?? 'Erro desconhecido',
          ),
    );
  }
}

class SignOnProvider extends BlocProvider<SignOnCubit> {
  SignOnProvider({
    Key? key,
    Widget? child,
  }) : super(
    key: key,
    create: (_) => SignOnCubit(),
    child: child,
  );

  static SignOnCubit of(BuildContext context) => BlocProvider.of<SignOnCubit>(context);
}

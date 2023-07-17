import 'package:equatable/equatable.dart';

enum LoginCubitStateStatus { loading, error }

class LoginCubitState extends Equatable {
  final LoginCubitStateStatus? status;
  final String? error;

  const LoginCubitState({
    this.status,
    this.error,
  });

  LoginCubitState copyWith({
    LoginCubitStateStatus? status,
    String? error,
  }) {
    return LoginCubitState(
      status: status ?? this.status,
      error: error ?? this.error,
    );
  }

  @override
  List<Object?> get props => [
    DateTime.now(),
  ];
}

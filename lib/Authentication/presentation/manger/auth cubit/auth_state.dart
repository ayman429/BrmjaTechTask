part of 'auth_cubit.dart';

sealed class AuthState {}

final class AuthInitial extends AuthState {}

final class AuthLoading extends AuthState {}

final class LoginSuccess extends AuthState {
  final String massege;

  LoginSuccess(this.massege);
}

final class SignUpSuccess extends AuthState {
  final String massege;

  SignUpSuccess(this.massege);
}

final class SendCodeSuccess extends AuthState {
  final String massege;

  SendCodeSuccess(this.massege);
}

final class VerfiyCodeSuccess extends AuthState {
  final String massege;

  VerfiyCodeSuccess(this.massege);
}

final class AuthFailure extends AuthState {
  final String errorMessage;

  AuthFailure(this.errorMessage);
}

final class SendCodeFailure extends AuthState {
  final String errorMessage;

  SendCodeFailure(this.errorMessage);
}

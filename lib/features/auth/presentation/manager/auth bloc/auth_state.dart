part of 'auth_bloc.dart';

@immutable
abstract class AuthState {}

final class AuthInitial extends AuthState {}

final class SignUpLoading extends AuthState {}

final class SignUpSuccess extends AuthState {}

final class SignUpFailure extends AuthState {
  final String errorMessage;

  SignUpFailure({
    required this.errorMessage,
  });
}

final class SignInLoading extends AuthState {}

final class SignInSuccess extends AuthState {}

final class SignInFailure extends AuthState {
  final String errorMessage;

  SignInFailure({
    required this.errorMessage,
  });
}

final class ForgotPassLoading extends AuthState {}

final class ForgotPassSuccess extends AuthState {}

final class ForgotPassFailure extends AuthState {
  final String errorMessage;

  ForgotPassFailure({
    required this.errorMessage,
  });
}

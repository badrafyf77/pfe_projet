part of 'auth_bloc.dart';

@immutable
abstract class AuthEvent {}

class SignUpEvent extends AuthEvent {
  final String email;
  final String password;

  SignUpEvent({
    required this.email,
    required this.password,
  });
}

class SignInEvent extends AuthEvent {
  final String email;
  final String password;
  
  SignInEvent({
    required this.email,
    required this.password,
  });
}


class ForgotPassEvent extends AuthEvent {
  final String email;
  
  ForgotPassEvent({
    required this.email,
  });
}
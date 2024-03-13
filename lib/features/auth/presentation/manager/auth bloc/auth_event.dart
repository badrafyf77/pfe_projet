part of 'auth_bloc.dart';

@immutable
abstract class AuthEvent {}

class SignUpEvent extends AuthEvent {
  final String email;
  final String password;
  final String nom;
  final String prenom;
  final String cin;
  final String phone;

  SignUpEvent({
    required this.email,
    required this.password,
    required this.nom,
    required this.prenom,
    required this.cin,
    required this.phone,
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
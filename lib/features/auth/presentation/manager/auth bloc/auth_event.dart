// ignore_for_file: public_member_api_docs, sort_constructors_first
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
  final Advisor advisor;

  SignUpEvent({
    required this.email,
    required this.password,
    required this.nom,
    required this.prenom,
    required this.cin,
    required this.phone,
    required this.advisor,
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

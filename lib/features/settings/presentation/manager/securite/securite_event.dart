part of 'securite_bloc.dart';

@immutable
sealed class SecuriteEvent {}

class ChangeEmailEvent extends SecuriteEvent {
  final String password;
  final String newEmail;

  ChangeEmailEvent({
    required this.password,
    required this.newEmail,
  });
}

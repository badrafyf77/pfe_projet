// ignore_for_file: public_member_api_docs, sort_constructors_first
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

class ChangePasswordEvent extends SecuriteEvent {
  final String oldPassword;
  final String newPassword;

  ChangePasswordEvent({
    required this.oldPassword,
    required this.newPassword,
  });
}

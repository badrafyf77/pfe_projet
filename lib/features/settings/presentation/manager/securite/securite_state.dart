part of 'securite_bloc.dart';

@immutable
sealed class SecuriteState {}

final class SecuriteInitial extends SecuriteState {}

final class ChangeEmailLoading extends SecuriteState {}

final class ChangeEmailSuccess extends SecuriteState {}

final class ChangeEmailFailure extends SecuriteState {
  final String errorMessage;

  ChangeEmailFailure({
    required this.errorMessage,
  });
}

final class ChangePasswordLoading extends SecuriteState {}

final class ChangePasswordSuccess extends SecuriteState {}

final class ChangePasswordFailure extends SecuriteState {
  final String errorMessage;

  ChangePasswordFailure({
    required this.errorMessage,
  });
}

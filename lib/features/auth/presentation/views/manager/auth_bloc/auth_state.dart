part of 'auth_bloc.dart';

@immutable
abstract class AuthState {}

final class AuthInitial extends AuthState {}

final class SignUpLoading extends AuthState {}

final class SignUpSuccess extends AuthState {}

final class SignUpFailure extends AuthState {
  final String errorMessage;

  SignUpFailure({required this.errorMessage});
}

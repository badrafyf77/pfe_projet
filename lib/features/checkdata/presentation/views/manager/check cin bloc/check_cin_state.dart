part of 'check_cin_bloc.dart';

@immutable
sealed class CheckCinState {}

final class CheckCinInitial extends CheckCinState {}

final class CheckCinLoading extends CheckCinState {}

final class CheckCinSuccess extends CheckCinState {}

final class CheckCinFailure extends CheckCinState {
  final String err;

  CheckCinFailure({
    required this.err,
  });
}
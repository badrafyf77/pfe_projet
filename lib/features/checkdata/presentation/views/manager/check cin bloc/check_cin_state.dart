part of 'check_cin_bloc.dart';

@immutable
abstract class CheckDocumentState {}

final class CheckCinInitial extends CheckDocumentState {}

final class CheckDocumentLoading extends CheckDocumentState {}

final class CheckDocumentSuccess extends CheckDocumentState {}

final class CheckCinFailure extends CheckDocumentState {
  final String err;

  CheckCinFailure({
    required this.err,
  });
}

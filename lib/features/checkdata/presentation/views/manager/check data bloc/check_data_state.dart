part of 'check_data_bloc.dart';

@immutable
abstract class CheckDataState {}

final class GetImageInitial extends CheckDataState {}

final class GetImageSucces extends CheckDataState {
  final XFile file;

  GetImageSucces({
    required this.file,
  });
}

final class CheckCinLoading extends CheckDataState {}

final class CheckCinSuccess extends CheckDataState {}

final class CheckCinFailure extends CheckDataState {
  final String err;

  CheckCinFailure({
    required this.err,
  });
}
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

final class GetImageFailure extends CheckDataState {
  final String errorMessage;

  GetImageFailure({
    required this.errorMessage,
  });
}

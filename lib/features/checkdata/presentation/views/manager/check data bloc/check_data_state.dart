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

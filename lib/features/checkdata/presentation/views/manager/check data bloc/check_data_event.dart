part of 'check_data_bloc.dart';

@immutable
abstract class CheckDataEvent {}

class GetImageEvent extends CheckDataEvent{
  final ImageSource source;

  GetImageEvent({
    required this.source,
  });
}

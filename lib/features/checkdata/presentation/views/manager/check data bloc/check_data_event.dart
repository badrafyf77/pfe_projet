// ignore_for_file: public_member_api_docs, sort_constructors_first
part of 'check_data_bloc.dart';

@immutable
abstract class CheckDataEvent {}

class GetImageEvent extends CheckDataEvent {
  final ImageSource source;

  GetImageEvent({
    required this.source,
  });
}

class CheckCinEvent extends CheckDataEvent {
  final String cin;
  final String base64;
  CheckCinEvent({
    required this.cin,
    required this.base64,
  });
}

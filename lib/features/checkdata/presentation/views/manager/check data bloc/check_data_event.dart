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

class CheckCin extends CheckDataEvent {
  final String base64;
  CheckCin({
    required this.base64,
  });
}

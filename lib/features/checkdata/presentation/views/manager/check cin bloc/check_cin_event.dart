part of 'check_cin_bloc.dart';

@immutable
abstract class CheckCinEvent {}

class CheckCin extends CheckCinEvent {
  final String cin;
  final String base64;
  CheckCin({
    required this.cin,
    required this.base64,
  });
}


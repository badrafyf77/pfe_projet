part of 'cin_checker_cubit.dart';

@immutable
abstract class CinStatuState {}

final class CinStatuInitial extends CinStatuState {}

final class CinStatuSuccess extends CinStatuState {
  final bool isCinVerified;

  CinStatuSuccess({required this.isCinVerified});
}

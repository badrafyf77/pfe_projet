part of 'cin_checker_cubit.dart';

@immutable
abstract class CinCheckerState {}

final class CinCheckerInitial extends CinCheckerState {}

final class CinCheckerSuccess extends CinCheckerState {
  final bool isCinVerified;

  CinCheckerSuccess({required this.isCinVerified});
}

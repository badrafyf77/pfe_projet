part of 'home_preferences_cubit.dart';

@immutable
abstract class HomePreferencesState {}

final class HomePreferencesInitial extends HomePreferencesState {}

final class HomePreferencesSuccess extends HomePreferencesState {}

final class HomePreferencesFailure extends HomePreferencesState {
  final String err;

  HomePreferencesFailure({
    required this.err,
  });
}

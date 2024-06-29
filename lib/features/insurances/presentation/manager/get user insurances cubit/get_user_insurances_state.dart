part of 'get_user_insurances_cubit.dart';

sealed class GetUserInsurancesState {}

final class GetUserInsurancesInitial extends GetUserInsurancesState {}

final class GetUserInsurancesLoading extends GetUserInsurancesState {}

final class GetUserInsurancesSuccess extends GetUserInsurancesState {
  final List<DevisInfo> devisList;

  GetUserInsurancesSuccess({required this.devisList});
}

final class GetUserInsurancesFailure extends GetUserInsurancesState {
  final String err;

  GetUserInsurancesFailure({required this.err});
}

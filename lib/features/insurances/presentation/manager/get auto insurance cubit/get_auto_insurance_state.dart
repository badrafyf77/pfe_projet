part of 'get_auto_insurance_cubit.dart';

sealed class GetAutoInsuranceState {}

final class GetAutoInsuranceInitial extends GetAutoInsuranceState {}

final class GetAutoInsuranceLoading extends GetAutoInsuranceState {}

final class GetAutoInsuranceSuccess extends GetAutoInsuranceState {
  final DevisInfo devisInfo;

  GetAutoInsuranceSuccess({required this.devisInfo});
}

final class GetAutoInsuranceFailure extends GetAutoInsuranceState {
  final String err;

  GetAutoInsuranceFailure({required this.err});
}

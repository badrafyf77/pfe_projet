part of 'stock_insurance_bloc.dart';

sealed class StockInsuranceState {}

final class StockInsuranceInitial extends StockInsuranceState {}

final class StockInsuranceLoading extends StockInsuranceState {}

final class StockInsuranceSuccess extends StockInsuranceState {}

final class StockInsuranceFailure extends StockInsuranceState {
  final String err;

  StockInsuranceFailure({required this.err});
}

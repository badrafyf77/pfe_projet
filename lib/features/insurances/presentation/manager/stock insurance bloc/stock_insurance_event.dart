part of 'stock_insurance_bloc.dart';

sealed class StockInsuranceEvent {}

class StockInsurance extends StockInsuranceEvent {
  final DevisInfo devisInfo;

  StockInsurance({required this.devisInfo});
}

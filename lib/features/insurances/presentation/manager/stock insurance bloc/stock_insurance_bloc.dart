import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pfe_projet/features/insurances/data/model/devis_info.dart';
import 'package:pfe_projet/features/insurances/data/repo/insurances_repo.dart';

part 'stock_insurance_event.dart';
part 'stock_insurance_state.dart';

class StockInsuranceBloc
    extends Bloc<StockInsuranceEvent, StockInsuranceState> {
  final InsurancesRepo _insurancesRepo;
  StockInsuranceBloc(this._insurancesRepo) : super(StockInsuranceInitial()) {
    on<StockInsuranceEvent>((event, emit) async {
      if (event is StockInsurance) {
        emit(StockInsuranceLoading());
        var result = await _insurancesRepo.stockInsurance(event.devisInfo);
        result.fold((left) {
          emit(StockInsuranceFailure(err: left.errMessage));
        }, (right) {
          emit(StockInsuranceSuccess());
        });
      }
    });
  }
}

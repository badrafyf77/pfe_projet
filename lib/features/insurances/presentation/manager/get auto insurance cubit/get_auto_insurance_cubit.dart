import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pfe_projet/features/insurances/data/model/devis_info.dart';
import 'package:pfe_projet/features/insurances/data/repo/insurances_repo.dart';

part 'get_auto_insurance_state.dart';

class GetAutoInsuranceCubit extends Cubit<GetAutoInsuranceState> {
  final InsurancesRepo _insurancesRepo;
  GetAutoInsuranceCubit(this._insurancesRepo)
      : super(GetAutoInsuranceInitial());

  Future<void> getInsurance(String id) async {
    emit(GetAutoInsuranceLoading());
    var result = await _insurancesRepo.getInsurance(id);
    result.fold((left) {
      emit(GetAutoInsuranceFailure(err: left.errMessage));
    }, (right) {
      emit(GetAutoInsuranceSuccess(devisInfo: right));
    });
  }
}

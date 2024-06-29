import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pfe_projet/features/insurances/data/model/devis_info.dart';
import 'package:pfe_projet/features/insurances/data/repo/insurances_repo.dart';

part 'get_user_insurances_state.dart';

class GetUserInsurancesCubit extends Cubit<GetUserInsurancesState> {
  final InsurancesRepo _insurancesRepo;
  GetUserInsurancesCubit(this._insurancesRepo)
      : super(GetUserInsurancesInitial());

  Future<void> getUserInsurances() async {
    emit(GetUserInsurancesLoading());
    var result = await _insurancesRepo.getUserInsurances();
    result.fold((left) {
      emit(GetUserInsurancesFailure(err: left.errMessage));
    }, (right) {
      emit(GetUserInsurancesSuccess(devisList: right));
    });
  }
}

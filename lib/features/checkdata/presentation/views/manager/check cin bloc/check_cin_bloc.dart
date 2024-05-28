import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'check_cin_event.dart';
part 'check_cin_state.dart';

class CheckCinBloc extends Bloc<CheckCinEvent, CheckCinState> {
  CheckCinBloc() : super(CheckCinInitial()) {
    on<CheckCinEvent>((event, emit) async {
      if (event is CheckCin) {
        emit(CheckCinLoading());
        await Future.delayed(const Duration(seconds: 3), () {});
        emit(CheckCinSuccess());
      }
    });
  }
}

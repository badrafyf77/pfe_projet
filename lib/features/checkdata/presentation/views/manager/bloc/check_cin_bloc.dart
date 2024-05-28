import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'check_cin_event.dart';
part 'check_cin_state.dart';

class CheckCinBloc extends Bloc<CheckCinEvent, CheckCinState> {
  CheckCinBloc() : super(CheckCinInitial()) {
    on<CheckCinEvent>((event, emit) {
      // TODO: implement event handler
    });
  }
}

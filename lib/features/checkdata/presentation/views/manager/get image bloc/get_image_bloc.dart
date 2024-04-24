import 'package:bloc/bloc.dart';
import 'package:image_picker/image_picker.dart';
import 'package:meta/meta.dart';

part 'get_image_event.dart';
part 'get_image_state.dart';

class GetImageBloc extends Bloc<GetImageEvent, GetImageState> {
  GetImageBloc() : super(GetImageInitial()) {
    on<GetImageEvent>((event, emit) {
      // TODO: implement event handler
    });
  }
}

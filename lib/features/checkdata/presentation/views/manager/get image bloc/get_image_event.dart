part of 'get_image_bloc.dart';

@immutable
abstract class GetImageEvent {
  final ImageSource source;

  const GetImageEvent({
    required this.source,
  });
}

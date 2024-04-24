part of 'get_image_bloc.dart';

@immutable
sealed class GetImageEvent {
  final ImageSource source;

  const GetImageEvent({
    required this.source,
  });
}

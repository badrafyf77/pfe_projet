// ignore_for_file: public_member_api_docs, sort_constructors_first
part of 'get_image_bloc.dart';

@immutable
abstract class GetImageEvent {}

class PickImageEvent extends GetImageEvent {
  final ImageSource source;

  PickImageEvent({
    required this.source,
  });
}
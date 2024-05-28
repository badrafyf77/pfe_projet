part of 'get_image_bloc.dart';

@immutable
abstract class GetImageState {}

final class GetImageInitial extends GetImageState {}

final class GetImageSucces extends GetImageState {
  final XFile file;

  GetImageSucces({
    required this.file,
  });
}

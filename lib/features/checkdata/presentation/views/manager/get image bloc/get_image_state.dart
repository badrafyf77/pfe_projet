part of 'get_image_bloc.dart';

@immutable
sealed class GetImageState {}

final class GetImageInitial extends GetImageState {}
final class GetImageSucces extends GetImageState {}
final class GetImageFailure extends GetImageState {}

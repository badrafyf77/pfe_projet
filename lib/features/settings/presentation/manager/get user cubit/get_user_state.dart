part of 'get_user_cubit.dart';

@immutable
abstract class GetUserState {}

final class GetUserInitial extends GetUserState {}

final class GetUserSuccess extends GetUserState {
  final UserInformation userInformation;

  GetUserSuccess({
    required this.userInformation,
  });
}

final class GetUserFailure extends GetUserState {
  final String errorMessage;

  GetUserFailure({
    required this.errorMessage,
  });
}

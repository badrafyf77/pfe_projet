part of 'messages_checker_state.dart';

@immutable
abstract class MessagesCheckerState {}

final class MessagesCheckerInitial extends MessagesCheckerState {}

final class MessagesCheckerSuccess extends MessagesCheckerState {}

final class MessagesCheckerFailure extends MessagesCheckerState {
  final String err;

  HomePreferencesFailure({
    required this.err,
  });
}

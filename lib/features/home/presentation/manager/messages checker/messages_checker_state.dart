part of 'messages_checker_cubit.dart';

@immutable
abstract class MessagesCheckerState {}

final class MessagesCheckerInitial extends MessagesCheckerState {}

final class MessagesCheckerSuccess extends MessagesCheckerState {
  final bool isMessagesReaded;

  MessagesCheckerSuccess({required this.isMessagesReaded});
}

final class MessagesCheckerFailure extends MessagesCheckerState {
  final String err;

  MessagesCheckerFailure({
    required this.err,
  });
}

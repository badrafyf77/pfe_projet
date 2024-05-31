part of 'messages_checker_cubit.dart';

@immutable
abstract class MessagesCheckerState {}

final class MessagesCheckerInitial extends MessagesCheckerState {}

final class MessagesCheckerSuccess extends MessagesCheckerState {
  final bool isMessagesReaded;

  MessagesCheckerSuccess({required this.isMessagesReaded});
}

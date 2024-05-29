part of 'get_messages_cubit.dart';

@immutable
abstract class GetMessagesState {}

final class GetMessagesInitial extends GetMessagesState {}

final class GetMessagesLoading extends GetMessagesState {}

final class GetMessagesSuccess extends GetMessagesState {
  final List<Message> messages;

  GetMessagesSuccess({
    required this.messages,
  });
}

final class GetMessagesFailure extends GetMessagesState {
  final String err;

  GetMessagesFailure({
    required this.err,
  });
}

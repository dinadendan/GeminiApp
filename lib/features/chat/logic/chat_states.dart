part of 'chat_cubit.dart';

abstract class ChatState {}

final class ChatInitial extends ChatState {}

final class ChatTypingState extends ChatState {
final bool isTyping;

ChatTypingState(this.isTyping);
}

/// messages

final class MessageSending extends ChatState {}

final class MessageSent extends ChatState {
final List<MessageModel> messages;

MessageSent(this.messages);
}
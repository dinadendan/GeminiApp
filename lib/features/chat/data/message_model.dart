class MessageModel {
  final String message;
  final String sender;
  final String time;

  MessageModel({
    required this.message,
    required this.sender,
    required this.time,
  });


}

List<MessageModel> messages = [];
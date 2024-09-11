import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gemini_app/features/chat/logic/chat_cubit.dart';
import '../data/message_model.dart';
import 'message_widget.dart';

class ListViewOfMessages extends StatelessWidget{
  final List<MessageModel> messages;

  const ListViewOfMessages({super.key, required this.messages});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      padding: EdgeInsets.symmetric(vertical: 10.h),
      controller: context.read<ChatCubit>().scrollController,
      itemCount: messages.length,
      itemBuilder: (context, index) {
        final message = messages[index];
        final isUserMessage = message.sender == "user";

        return MessageWidget(
          message: message.message,
          isFromUser: isUserMessage,

        );
      },
    );
  }
}

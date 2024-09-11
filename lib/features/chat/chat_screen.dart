import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gemini_app/features/chat/logic/chat_cubit.dart';
import 'package:gemini_app/features/chat/ui/listview_of_messages.dart';
import 'package:gemini_app/features/chat/ui/textField_widget.dart';

class ChatScreen extends StatelessWidget {
  const ChatScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: true,
        actions: [
          IconButton(
            icon: const Icon(Icons.delete),
            onPressed: () {
              context.read<ChatCubit>().clearMessages();
            },
          ),
        ],
      ),
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(vertical: 0.h, horizontal: 16.w),
          child: Column(
            children: [
              Expanded(
                child: BlocBuilder<ChatCubit, ChatState>(
                  builder: (context, state) {
                    if (state is MessageSent) {
                      return ListViewOfMessages(
                        messages: state.messages,
                      );
                    }
                    return const Center(child: Text('No messages yet !'));
                  },
                ),
              ),
              Padding(
                padding: EdgeInsets.only(top: 10.h, bottom: 20.h),
                child: const TextFieldWidget(),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

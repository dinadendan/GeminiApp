import 'package:flutter/material.dart';
import 'package:gemini_app/features/chat/ui/message_widget.dart';
import 'package:google_generative_ai/google_generative_ai.dart';

class ChatScreen extends StatefulWidget{
  const ChatScreen({super.key});

  @override
  State<ChatScreen> createState() => _ChatScreenState();
}

class _ChatScreenState extends State<ChatScreen> {

  late final GenerativeModel model ;
  late final ChatSession chatSession;

  final ScrollController scrollController = ScrollController();
  final TextEditingController textController = TextEditingController();
  final FocusNode textFieldFocus = FocusNode(debugLabel: 'TextField');
  bool loading = false;

  @override
  void initState(){
    super.initState();
    model=GenerativeModel(model: 'gemini-pro',
        apiKey: 'AIzaSyBduVgZNaUYhSJPBCuY5dX6eEKX8wmNrU0',
    );
    chatSession = model.startChat();
  }

  void scrollDown() {
    WidgetsBinding.instance.addPostFrameCallback((_) => scrollController.animateTo(
        scrollController.position.maxScrollExtent,
        duration: const Duration(
          milliseconds: 750,
        ),
        curve: Curves.easeOutCirc,
      ),
    );
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Expanded(
                  child: ListView.builder(
                    controller: scrollController,
                    itemCount: chatSession.history.length,
                    itemBuilder: (context,index) {
                      final Content content = chatSession.history.toList()[index];
                      final text = content.parts.whereType<TextPart>().map((e) => e.text).join('');
        
                      return MessageWidget(text: text, isFromUser: content.role== 'user');
                      },
        
                  ),
              ),
               Padding(
                padding: const EdgeInsets.symmetric(vertical: 25,horizontal: 15),
                child: Row(
                  children: [
                    Expanded(
                      child: TextField(
                        autofocus: true,
                        focusNode: textFieldFocus,
                        decoration: textFieldDecoration(context, 'Message to Gemini bot ...'),
                        controller: textController,
                        onSubmitted: (String value) {
                          sendChatMessage(value);
                        },
                      
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Future<void> sendChatMessage(String message) async {
    setState(() {
      loading = true;
    });

    try {
      final response = await chatSession.sendMessage(
        Content.text(message),
      );
      final text = response.text;

      if (text == null) {
        showError('Empty response.');
        return;
      } else {
        setState(() {
          loading = false;
          scrollDown();
        });
      }
    } catch (e) {
      showError(e.toString());
      setState(() {
        loading = false;
      });
    } finally {
      textController.clear();
      setState(() {
        loading = false;
      });
      textFieldFocus.requestFocus();
    }
  }

  void showError(String message) {
    showDialog<void>(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: const Text('Something went wrong'),
          content: SingleChildScrollView(
            child: Text(message),
          ),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: const Text('OK'),
            )
          ],
        );
      },
    );
  }

  InputDecoration textFieldDecoration(BuildContext context, String hintText) => InputDecoration(
      contentPadding: const EdgeInsets.all(15),
      hintText: hintText,
      border: OutlineInputBorder(
        borderRadius: const BorderRadius.all(
          Radius.circular(14),
        ),
        borderSide: BorderSide(
          color: Theme.of(context).colorScheme.secondary,
        ),
      ),
      focusedBorder: OutlineInputBorder(
        borderRadius: const BorderRadius.all(
          Radius.circular(14),
        ),
        borderSide: BorderSide(
          color: Theme.of(context).colorScheme.secondary,
        ),
      ),
    );


}

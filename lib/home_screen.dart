import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget{
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Gemini App'),
        titleTextStyle: const TextStyle(
            fontSize: 30,
            fontWeight: FontWeight.w600,
        ),
        centerTitle: true,
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 120,horizontal: 15),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                'Hello,\nHow can i help you today ?',
              style: TextStyle(
                fontSize: 26,
                fontWeight: FontWeight.w700
              ),
              ),
              const SizedBox(
                height: 40,
              ),
              ElevatedButton(
                  onPressed: (){
                  },
                  child: const Text('Start a Chat ')
              ),

            ],
          ),
        ),
      ),
    );
  }
}

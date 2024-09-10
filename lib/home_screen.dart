import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gemini_app/core/helper/extensions.dart';
import 'package:gemini_app/core/routing/routes.dart';

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
          padding: EdgeInsets.symmetric(vertical: 120.h,horizontal: 15.w),
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
              SizedBox(
                width: 200,
                child: ElevatedButton(
                    onPressed: (){
                      context.pushNamed(Routes.chatScreen);
                    },
                    child: const Text('Start a Chat '),

                ),
              ),

            ],
          ),
        ),
      ),
    );
  }
}

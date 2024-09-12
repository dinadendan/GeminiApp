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
        title: Image.asset('assets/images/logo.png',
          scale: 2,
        ),
        centerTitle: true,
      ),
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.only(top: 120.h,left: 15.w,right: 15.w),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Hello,\nHow can i help you today ?',
              style: TextStyle(
                fontSize: 26.sp,
                fontWeight: FontWeight.w700
              ),
              ),
              SizedBox(
                height: 40.h,
              ),
              SizedBox(
                width: 200.w,
                height: 45.h,
                child: ElevatedButton(
                    onPressed: (){
                      context.pushNamed(Routes.chatScreen);
                    },
                    child: Text('Start a Chat ',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 16.sp
                    ),),


                ),
              ),
              SizedBox(
                height: 25.h,
              ),
              Center(
                child: Image.asset('assets/images/bot2.png',
                scale: 2,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

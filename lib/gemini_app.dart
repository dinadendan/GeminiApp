import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gemini_app/core/routing/app_router.dart';
import 'package:gemini_app/core/routing/routes.dart';
import 'package:gemini_app/features/chat/logic/chat_cubit.dart';

class GeminiApp extends StatelessWidget {
  final AppRouter appRouter;
  const GeminiApp({super.key, required this.appRouter});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(375, 812),
      minTextAdapt: true,
      child: BlocProvider(
        create: (context) => ChatCubit(),

        child: MaterialApp(
          title: 'Gemini App',
          theme: ThemeData(
            colorScheme: ColorScheme.fromSeed(
              brightness: Brightness.dark,
              seedColor: const Color.fromARGB(255, 171, 222, 244),
            ),
            useMaterial3: true,
          ),
          debugShowCheckedModeBanner: false,
          initialRoute: Routes.homeScreen,
          onGenerateRoute: appRouter.generateRoute,
        ),
      ),
    );
  }
}
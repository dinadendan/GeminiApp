import 'package:flutter/material.dart';
import 'package:gemini_app/core/routing/app_router.dart';
import 'package:gemini_app/core/routing/routes.dart';

void main() {
  runApp( MyApp(
    appRouter: AppRouter(),
  ));
}

class MyApp extends StatelessWidget {
  final AppRouter appRouter;

  const MyApp({super.key, required this.appRouter});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
        theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(
          brightness: Brightness.dark,
          seedColor: const Color.fromARGB(255, 171, 222, 244),
        ),
        useMaterial3: true,
      ),
        initialRoute: Routes.homeScreen,
        onGenerateRoute: appRouter.generateRoute
      // home: const HomeScreen(),
    );
  }
}


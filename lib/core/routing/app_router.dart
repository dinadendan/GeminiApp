
import 'package:flutter/material.dart';
import 'package:gemini_app/core/routing/routes.dart';
import 'package:gemini_app/features/chat/chat_screen.dart';
import 'package:gemini_app/features/home/ui/home_screen.dart';

class AppRouter {
  Route? generateRoute(RouteSettings settings) {

    switch (settings.name) {
      case Routes.homeScreen:
        return MaterialPageRoute(
          builder: (_) => const HomeScreen(),
        );

      case Routes.chatScreen:
        return MaterialPageRoute(
          builder: (_) => const ChatScreen(),
        );

      default:
        return null;

    }
  }
}
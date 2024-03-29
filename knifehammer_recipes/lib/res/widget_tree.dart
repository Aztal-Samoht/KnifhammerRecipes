import 'package:flutter/material.dart';
import 'package:knifehammer_recipes/res/auth.dart';
import 'package:knifehammer_recipes/screens/home_screen.dart';
import 'package:knifehammer_recipes/screens/login_register_screen.dart';

class WidgetTree extends StatefulWidget {
  static String id = 'tree';
  const WidgetTree({super.key});

  @override
  State<WidgetTree> createState() => _WidgetTreeState();
}

class _WidgetTreeState extends State<WidgetTree> {
  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
      stream: Auth().authStateChanges,
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          return HomeScreen();
        } else {
          return const LoginScreen();
        }
      },
    );
  }
}

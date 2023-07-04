import 'package:flutter/material.dart';
import 'package:knifehammer_recipes/res/widget_tree.dart';
import 'package:knifehammer_recipes/screens/home_screen.dart';
import 'package:knifehammer_recipes/screens/login_register_screen.dart';

class RecipeUtil {
  static Map<String, Widget Function(BuildContext)> getRoutes() => {
        WidgetTree.id: (context) => const WidgetTree(),
        HomeScreen.id: (context) => HomeScreen(),
        LoginScreen.id: (context) => const LoginScreen(),
      };

  static ThemeData getThemeData() => ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      );
}

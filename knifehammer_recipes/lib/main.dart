import 'package:flutter/material.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';
import 'package:knifehammer_recipes/res/recipe_util.dart';
import 'package:knifehammer_recipes/screens/home_screen.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  MobileAds.instance.initialize();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: RecipeUtil.getThemeData(),
      routes: RecipeUtil.getRoutes(),
      initialRoute: HomeScreen.id,
    );
  }
}

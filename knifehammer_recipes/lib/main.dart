import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';
import 'package:knifehammer_recipes/res/recipe_util.dart';
import 'package:knifehammer_recipes/res/widget_tree.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
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
      initialRoute: WidgetTree.id,
      // home: const WidgetTree(),
    );
  }
}

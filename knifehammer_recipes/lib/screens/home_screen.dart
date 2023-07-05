import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:knifehammer_recipes/res/auth.dart';
import 'package:knifehammer_recipes/widgets/buttons.dart';
import 'package:knifehammer_recipes/widgets/screen_base.dart';

class HomeScreen extends StatelessWidget {
  static String id = 'home';
  HomeScreen({Key? key}) : super(key: key);

  final User? user = Auth.currentUser;

  Widget _userUid() => Text(user?.email ?? 'user email');

  @override
  Widget build(BuildContext context) {
    return ScreenBase(
      appbar: AppBar(
        title: Text('Knifehammer Recipe app'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            _userUid(),
            Auth.signOutButton(),
            toLogin(context),
          ],
        ),
      ),
    );
  }
}

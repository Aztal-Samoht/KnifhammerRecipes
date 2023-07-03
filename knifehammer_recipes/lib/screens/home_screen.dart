import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:knifehammer_recipes/res/auth.dart';
import 'package:knifehammer_recipes/screens/login_register_screen.dart';
import 'package:knifehammer_recipes/widgets/screen_base.dart';

class HomeScreen extends StatelessWidget {
  static String id = 'home';
  HomeScreen({Key? key}) : super(key: key);

  final User? user = Auth().currentUser;
  Future<void> signOut() async => await Auth().signOut();

  Widget _userUid() => Text(user?.email ?? 'user email');
  Widget _signOutButton() => ElevatedButton(
        onPressed: signOut,
        child: const Text('sign out'),
      );

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
            _signOutButton(),
            OutlinedButton(
              onPressed: () => Navigator.pushNamed(context, LoginScreen.id),
              child: Text('to Login Screen'),
            ),
          ],
        ),
      ),
    );
  }
}

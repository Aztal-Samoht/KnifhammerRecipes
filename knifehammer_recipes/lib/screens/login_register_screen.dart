import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:knifehammer_recipes/res/auth.dart';
import 'package:knifehammer_recipes/widgets/screen_base.dart';

class LoginScreen extends StatefulWidget {
  static String id = 'login';
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  String? errorMessage = '';
  bool isLogin = true;
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  Future<void> signInWithEmailAndPassword() async {
    try {
      await Auth().signInWithEmailAndPassword(
          email: _emailController.text, password: _passwordController.text);
    } on FirebaseAuthException catch (e) {
      setState(() {
        errorMessage = e.message;
      });
    }
  }

  Future<void> createUserWithEmailAndPassword() async {
    try {
      await Auth().createUserWithEmailAndPassword(
        email: _emailController.text,
        password: _passwordController.text,
      );
    } on FirebaseAuthException catch (e) {
      setState(() {
        errorMessage = e.message;
      });
    }
  }

  Widget _entryField(String title, TextEditingController controller,
          {bool? password}) =>
      TextField(
        controller: controller,
        decoration: InputDecoration(
          labelText: title,
        ),
        obscureText: password ?? false,
      );
  Widget _errorMessage() =>
      Text(errorMessage == '' ? '' : 'humm ?$errorMessage');

  Widget _submitButton() {
    return ElevatedButton(
      onPressed:
          isLogin ? signInWithEmailAndPassword : createUserWithEmailAndPassword,
      child: Text(isLogin ? 'Login' : 'Reg'),
    );
  }

  Widget _toggleLoginReg() => TextButton(
      onPressed: () {
        setState(() {
          isLogin = !isLogin;
        });
      },
      child: Text(isLogin ? 'reg' : 'login'));

  @override
  Widget build(BuildContext context) {
    return ScreenBase(
      appbar: AppBar(title: const Text('Login Screen')),
      body: Column(children: [
        _entryField('email', _emailController),
        _entryField('password', _passwordController, password: true),
        _errorMessage(),
        _submitButton(),
        _toggleLoginReg(),
      ]),
    );
  }
}

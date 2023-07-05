import 'package:flutter/material.dart';

import '../screens/login_register_screen.dart';

OutlinedButton toLogin(BuildContext ctx) => OutlinedButton(
      onPressed: () => Navigator.pushNamed(ctx, LoginScreen.id),
      child: const Text('to Login Screen'),
    );

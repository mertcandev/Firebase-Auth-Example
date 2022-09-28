import 'package:firebase_example/screens/signin_screen.dart';
import 'package:firebase_example/screens/signup_screen.dart';
import 'package:flutter/material.dart';

class AuthPage extends StatefulWidget {
  const AuthPage({super.key});

  @override
  State<AuthPage> createState() => _AuthPageState();
}

class _AuthPageState extends State<AuthPage> {
  bool showSignInPage = true;
  void toggleScreens() {
    setState(() {
    showSignInPage = !showSignInPage;
      
    });
  }

  @override
  Widget build(BuildContext context) {
    if (showSignInPage) {
      return SignInScreen(showSignUpScreen: toggleScreens);
    } else {
      return SignUpScreen(showSignInPage: toggleScreens);
    }
  }
}

import 'package:firebase_example/screens/forgotpassword_screen.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';

class SignInScreen extends StatefulWidget {
  final VoidCallback showSignUpScreen;
  const SignInScreen({super.key, required this.showSignUpScreen});

  @override
  State<SignInScreen> createState() => _SignInScreenState();
}

class _SignInScreenState extends State<SignInScreen> {
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();

  Future signIn() async {
    showDialog(
        context: context,
        builder: (context) {
          return const Center(
            child: CircularProgressIndicator(
              color: Colors.white,
            ),
          );
        });
    await FirebaseAuth.instance.signInWithEmailAndPassword(
        email: _emailController.text.trim(),
        password: _passwordController.text.trim());

    Navigator.of(context).pop();
  }

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
      ),
      body: Container(
        width: double.maxFinite,
        height: double.maxFinite,
        padding:
            const EdgeInsets.only(top: 60, left: 30, right: 30, bottom: 20),
        decoration: const BoxDecoration(
            gradient: LinearGradient(
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
                colors: [Color(0xff07635D), Color(0x8807635D)])),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              "Welcome\nBack",
              style: TextStyle(
                  color: Colors.white,
                  fontSize: 40,
                  fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 50),
            TextField(
              controller: _emailController,
              style: const TextStyle(
                  color: Colors.white, fontWeight: FontWeight.w700),
              cursorColor: Colors.white.withOpacity(0.5),
              keyboardType: TextInputType.emailAddress,
              decoration: InputDecoration(
                  border: InputBorder.none,
                  filled: true,
                  hintText: "Email",
                  hintStyle: TextStyle(color: Colors.white.withOpacity(0.4))),
            ),
            const Divider(
              height: 3,
              color: Colors.white,
            ),
            TextField(
              obscureText: true,
              controller: _passwordController,
              style: const TextStyle(
                  color: Colors.white, fontWeight: FontWeight.w700),
              cursorColor: Colors.white.withOpacity(0.5),
              keyboardType: TextInputType.emailAddress,
              decoration: InputDecoration(
                  border: InputBorder.none,
                  filled: true,
                  hintText: "Password",
                  hintStyle: TextStyle(color: Colors.white.withOpacity(0.4))),
            ),
            TextButton(
                onPressed: widget.showSignUpScreen,
                child: const Text(
                  "Create an account",
                  style: TextStyle(color: Colors.white, fontSize: 12),
                )),
            InkWell(
              onTap: () {
                signIn();
              },
              child: Container(
                height: 50,
                width: double.maxFinite,
                decoration: BoxDecoration(
                  color: const Color(0xffFF7A30),
                  borderRadius: BorderRadius.circular(15),
                ),
                child: const Center(
                  child: Text(
                    "SIGN IN",
                    style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                        fontSize: 16),
                  ),
                ),
              ),
            ),
            Center(
              child: TextButton(
                  onPressed: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: ((context) =>
                                const ForgotPasswordScreen())));
                  },
                  child: Text(
                    "Forgot password?",
                    style: TextStyle(
                      color: Colors.white.withOpacity(0.8),
                      fontSize: 12,
                    ),
                  )),
            )
          ],
        ),
      ),
    );
  }
}

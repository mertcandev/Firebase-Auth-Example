import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class SignUpScreen extends StatefulWidget {
  final VoidCallback showSignInPage;
  const SignUpScreen({super.key, required this.showSignInPage});

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  final _confirmPasswordController = TextEditingController();

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    _confirmPasswordController.dispose();
    super.dispose();
  }

  Future signUo() async {
    if (passwordConfirmed()) {
      await FirebaseAuth.instance.createUserWithEmailAndPassword(
          email: _emailController.text.trim(),
          password: _passwordController.text.trim());
    }
  }

  bool passwordConfirmed() {
    if (_passwordController.text.trim() ==
        _confirmPasswordController.text.trim()) {
      return true;
    } else {
      return false;
    }
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
              "Create\nAccount",
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
              controller: _passwordController,
              obscureText: true,
              style: const TextStyle(
                  color: Colors.white, fontWeight: FontWeight.w700),
              cursorColor: Colors.white.withOpacity(0.5),
              decoration: InputDecoration(
                  border: InputBorder.none,
                  filled: true,
                  hintText: "Password",
                  hintStyle: TextStyle(color: Colors.white.withOpacity(0.4))),
            ),
            const Divider(
              height: 3,
              color: Colors.white,
            ),
            TextField(
              controller: _confirmPasswordController,
              obscureText: true,
              style: const TextStyle(
                  color: Colors.white, fontWeight: FontWeight.w700),
              cursorColor: Colors.white.withOpacity(0.5),
              decoration: InputDecoration(
                  border: InputBorder.none,
                  filled: true,
                  hintText: "Confirm Password",
                  hintStyle: TextStyle(color: Colors.white.withOpacity(0.4))),
            ),
            TextButton(
                onPressed: widget.showSignInPage,
                child: const Text(
                  "Go back and sign in",
                  style: TextStyle(color: Colors.white, fontSize: 12),
                )),
            InkWell(
              onTap: signUo,
              child: Container(
                height: 50,
                width: double.maxFinite,
                decoration: BoxDecoration(
                  color: const Color(0xffFF7A30),
                  borderRadius: BorderRadius.circular(15),
                ),
                child: const Center(
                  child: Text(
                    "SIGN UP",
                    style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                        fontSize: 16),
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}

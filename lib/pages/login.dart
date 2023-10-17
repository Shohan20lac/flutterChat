import 'package:fchat/components/my_button.dart';
import 'package:fchat/components/my_text_field.dart';
import 'package:flutter/material.dart';

class Login extends StatefulWidget {
  final void Function()? onTap;
  const Login({super.key, required this.onTap});

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  final emailController = TextEditingController();
  final passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SafeArea(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 25.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Center(
              child: Icon(Icons.message, size: 80),
            ),
            const Text('Welcome Back!',
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
            const SizedBox(height: 20),
            MyTextField(
                controller: emailController,
                hintText: 'Email',
                obscureText: false),
            const SizedBox(height: 20),
            MyTextField(
                controller: passwordController,
                hintText: 'Password',
                obscureText: false),
            const SizedBox(height: 20),
            MyButton(onTap: () {}, text: 'Log In'),
            const SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text('Not a member?'),
                SizedBox(
                  width: 20,
                ),
                GestureDetector(
                    onTap: widget.onTap, child: const Text('Sign up'))
              ],
            )
          ],
        ),
      ),
    ));
  }
}

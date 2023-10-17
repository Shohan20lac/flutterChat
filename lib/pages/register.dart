import 'package:fchat/components/my_button.dart';
import 'package:fchat/components/my_text_field.dart';
import 'package:fchat/services/auth/auth_service.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class Register extends StatefulWidget {
  final void Function()? onTap;
  const Register({super.key, required this.onTap});

  @override
  State<Register> createState() => _RegisterState();
}

class _RegisterState extends State<Register> {
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final confirmPasswordController = TextEditingController();

  void createUser() async {
    // get authservice isntance
    final authService = Provider.of<AuthService>(context, listen: false);

    try {
      await authService.signUpWithEmailandPassword(
          emailController.text, passwordController.text);
    } catch (e) {
      ScaffoldMessenger.of(context)
          .showSnackBar(SnackBar(content: Text(e.toString())));
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SafeArea(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 25.0),
        child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
          const Center(
            child: Icon(Icons.message, size: 80),
          ),
          const Text('Create Account',
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
              obscureText: true),
          const SizedBox(height: 20),
          MyTextField(
              controller: confirmPasswordController,
              hintText: 'Confirm Password',
              obscureText: true),
          const SizedBox(height: 20),
          MyButton(onTap: createUser, text: 'Create Account'),
          const SizedBox(height: 20),
          Row(mainAxisAlignment: MainAxisAlignment.center, children: [
            const Text('Already a member?'),
            const SizedBox(
              width: 20,
            ),
            GestureDetector(onTap: widget.onTap, child: const Text('Log In'))
          ])
        ]),
      ),
    ));
  }
}

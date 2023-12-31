import 'package:fchat/components/identity_screen.dart';
import 'package:fchat/components/my_button.dart';
import 'package:fchat/components/my_text_field.dart';
import 'package:fchat/services/auth/auth_service.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class Login extends StatefulWidget {
  final void Function()? onTap;
  const Login({super.key, required this.onTap});

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  final emailController = TextEditingController();
  final passwordController = TextEditingController();

  bool isLoading = false;

  void signIn() async {
    // get authservice isntance
    final authService = Provider.of<AuthService>(context, listen: false);

    try {
      setState(() {
        isLoading = true;
      });
      await authService.signInWithEmailandPassword(
          emailController.text, passwordController.text);
      setState(() {
        isLoading = false;
      });
    } catch (e) {
      ScaffoldMessenger.of(context)
          .showSnackBar(SnackBar(content: Text(e.toString())));
    }
  }

  @override
  Widget build(BuildContext context) {
    return IdentityScreen(children: [
      const Center(
        child: Icon(Icons.message, size: 80),
      ),
      const Text('Welcome Back!',
          style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
      const SizedBox(height: 20),
      MyTextField(
          controller: emailController, hintText: 'Email', obscureText: false),
      const SizedBox(height: 20),
      MyTextField(
          controller: passwordController,
          hintText: 'Password',
          obscureText: false),
      const SizedBox(height: 20),
      Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          MyButton(onTap: signIn, text: 'Log In'),
          if (isLoading) const CircularProgressIndicator()
        ],
      ),
      const SizedBox(height: 20),
      Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Text('Not a member?'),
          const SizedBox(
            width: 20,
          ),
          GestureDetector(onTap: widget.onTap, child: const Text('Sign up'))
        ],
      )
    ]);
  }
}

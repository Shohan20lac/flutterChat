import 'package:fchat/pages/homepage.dart';
import 'package:fchat/services/login_or_register.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

// Checks if user is logged in or not =

class AuthGate extends StatelessWidget {
  const AuthGate({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: StreamBuilder(
            stream: FirebaseAuth.instance.authStateChanges(),
            builder: (context, snapshot) {
              // case1: user is logged in
              if (snapshot.hasData) {
                print("user is signed in");
                return const Homepage();
              }

              // case2: user is NOT logged in
              else {
                print("user is not signed in");
                return const LoginOrRegister();
              }
            }));
  }
}

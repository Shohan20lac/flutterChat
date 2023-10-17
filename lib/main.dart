import 'package:fchat/pages/register.dart';
import 'package:fchat/services/login_or_register.dart';
import 'package:flutter/material.dart';
import 'pages/login.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      title: 'Fchat',
      debugShowCheckedModeBanner: false,
      home: LoginOrRegister(),
    );
  }
}

import 'package:flutter/material.dart';
import 'pages/identity.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp (
      title: 'Fchat',
      debugShowCheckedModeBanner: false,
      home: Identity(),
    );
  }
}

import 'package:fchat/firebase_options.dart';
import 'package:fchat/pages/register.dart';
import 'package:fchat/services/auth/auth_gate.dart';
import 'package:fchat/services/auth/auth_service.dart';
import 'package:fchat/services/login_or_register.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'pages/login.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  runApp(
    ChangeNotifierProvider(
        create: (context) => AuthService(), child: const MyApp()),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      title: 'Fchat',
      debugShowCheckedModeBanner: false,
      home: AuthGate(),
    );
  }
}

import 'package:fchat/components/my_text_field.dart';
import 'package:flutter/material.dart';

class Identity extends StatefulWidget {
  const Identity({super.key});

  @override
  State<Identity> createState() => _IdentityState();
}

class _IdentityState extends State<Identity> {
    final emailController = TextEditingController();
    final passwordController = TextEditingController();
    
  @override
  Widget build (BuildContext context) {
    return Scaffold (
        body:
            SafeArea (child: 
                Column (children: [
                    Center (child: 
                        Icon (
                            Icons.message,
                            size: 80
                        ),
                    ),

                    // Welcome back message
                    Text (
                        'Welcome Back!',
                        style: TextStyle (
                            fontSize: 16,
                            fontWeight: FontWeight.bold
                        )
                    ),

                    // Email Textfield
                    MyTextField (
                        controller:  emailController,
                        hintText:    'Email', 
                        obscureText: false
                    ),

                    // Password Textfield

                    // Sign in Button

                    // if not a member, register now
                ],)
            
            ,)
        
        
    );
  }
}
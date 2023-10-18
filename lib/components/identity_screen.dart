import 'package:flutter/material.dart';

class IdentityScreen extends StatelessWidget {
  final List<Widget> children;

  IdentityScreen({required this.children});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Stack(
          children: [
            Container(
              color: Colors.black, // Black background
            ),
            Center(
              child: Container(
                constraints:
                    const BoxConstraints(maxWidth: 300, maxHeight: 500),
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: Colors.white),
                // White foreground
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 25.0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: children,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

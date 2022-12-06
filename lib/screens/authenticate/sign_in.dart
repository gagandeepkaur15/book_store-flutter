import 'package:flutter/material.dart';

class SignIn extends StatefulWidget {
  const SignIn({super.key});

  @override
  State<SignIn> createState() => _SignInState();
}

class _SignInState extends State<SignIn> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        padding: const EdgeInsets.symmetric(vertical: 20,horizontal: 50),
        child: Column(
          children: [
            ElevatedButton(onPressed: (){}, child: Text('Sign in anonymously'))
          ],
        ),
      ),
    );
  }
}

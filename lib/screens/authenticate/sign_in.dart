import 'package:book_store/services/auth.dart';
import 'package:flutter/material.dart';

class SignIn extends StatefulWidget {
  const SignIn({super.key});

  @override
  State<SignIn> createState() => _SignInState();
}

class _SignInState extends State<SignIn> {
  final AuthService _auth = AuthService(); //instance of the AuthService class

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 50),
        child: Column(
          children: [
            ElevatedButton(
              onPressed: () async {
                dynamic result = await _auth
                    .signInAnon(); //dynamic as it can be the user or null
                if (result == null) {
                  print('error signing in');
                } else {
                  print('signed in');
                  print(result);
                  print(result.uid);
                }
              },
              child: Text('Sign in anonymously'),
            )
          ],
        ),
      ),
    );
  }
}

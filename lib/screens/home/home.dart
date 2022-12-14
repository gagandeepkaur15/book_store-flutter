import 'package:flutter/material.dart';
import 'package:book_store/services/auth.dart';

class Home extends StatelessWidget {
  Home({super.key});

  final AuthService _auth = AuthService();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.brown,
        title: const Text('Florish and Blotts Book Store'),
        elevation: 0,
        actions: <Widget>[
          TextButton.icon(
            icon: const Icon(
              Icons.person,
              color: Colors.black,
            ),
            label: const Text(
              'logout',
              style: TextStyle(
                color: Colors.black,
              ),
            ),
            onPressed: (() async {
              await _auth.signOutUser();
            }),
          ),
        ],
      ),
    );
  }
}

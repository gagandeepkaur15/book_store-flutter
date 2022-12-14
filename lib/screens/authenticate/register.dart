import 'package:book_store/screens/authenticate/sign_in.dart';
import 'package:book_store/services/auth.dart';
import 'package:flutter/material.dart';

class Register extends StatefulWidget {
  const Register({super.key});

  @override
  State<Register> createState() => _RegisterState();
}

class _RegisterState extends State<Register> {
  final AuthService _auth = AuthService(); //instance of the AuthService class
  final _formKey = GlobalKey<FormState>();

  String email = '';
  String password = '';
  String error = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: Colors.brown,
        title: const Text('Register'),
        actions: <Widget>[
          TextButton.icon(
            icon: const Icon(
              Icons.person,
              color: Colors.white,
            ),
            label: const Text(
              'Sign In',
              style: TextStyle(color: Colors.white),
            ),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => const SignIn(),
                ),
              );
            },
          )
        ],
      ),
      body: Container(
        padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 50),
        child: Form(
          key: _formKey,
          child: Column(
            children: [
              const SizedBox(
                height: 20,
              ),
              TextFormField(
                decoration: const InputDecoration(
                  hintText: 'Email',
                ),
                validator: (val) => val!.isEmpty ? 'Enter the email' : null,
                onChanged: (value) {
                  setState(() {
                    email = value;
                  });
                },
              ),
              const SizedBox(
                height: 20,
              ),
              TextFormField(
                decoration: const InputDecoration(
                  hintText: 'Password',
                ),
                validator: (val) =>
                    val!.length < 6 ? 'Enter atleast 6 characters' : null,
                obscureText: true,
                onChanged: (value) {
                  password = value;
                },
              ),
              const SizedBox(
                height: 20,
              ),
              ElevatedButton(
                style: ButtonStyle(
                  backgroundColor: MaterialStateProperty.all(Colors.brown),
                ),
                onPressed: () async {
                  if (_formKey.currentState!.validate()) {
                    dynamic result = await _auth.register(email, password);
                    if (result == null) {
                      setState(() {
                        error = 'Enter correct email';
                      });
                    }
                  }
                },
                child: const Text(
                  'Register',
                  style: TextStyle(
                    color: Colors.white,
                  ),
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              Text(
                error,
                style: TextStyle(
                  color: Colors.red,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

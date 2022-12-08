import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import './authenticate/authenticate.dart';
import './home/home.dart';
import '../models/user.dart';

class Wrapper extends StatelessWidget {
  const Wrapper({super.key});

  @override
  Widget build(BuildContext context) {
    final user = Provider.of<MyUser? >(context); //accesses MyUser data from the provider everytime we get a new value
    print(user);
    if (user == null) {
      return Authenticate();
    } else {
      return Home();
    }
  }
}

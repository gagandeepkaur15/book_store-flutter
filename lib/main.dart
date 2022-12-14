import 'package:flutter/material.dart';

import 'package:firebase_core/firebase_core.dart';
import 'firebase_options.dart';

import 'package:provider/provider.dart';

import 'package:book_store/services/auth.dart';
import 'package:book_store/screens/wrapper.dart';
import './models/user.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return StreamProvider<MyUser?>.value(
      //we can even create a stream using create instead of providing value
      value: AuthService()
          .user, //user is the stream we want to listen to which is being accessed from the AuthSerive class
      initialData: MyUser(),
      child: const MaterialApp(
        debugShowCheckedModeBanner: false,
        home:
            Wrapper(), //Now in wrapper widget(descendant) we can access the MyUser data whenever we get some
        //whenever change occurs it can listen to it
      ),
    );
  }
}

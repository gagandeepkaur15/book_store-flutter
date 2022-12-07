import 'package:firebase_auth/firebase_auth.dart';
import '../models/user.dart';

class AuthService {
  //creating an auth instance
  final FirebaseAuth _auth = FirebaseAuth.instance;

  //create user object based on FirebaseUser
  MyUser? _userFromFirebaseUser(User? user) {
    return user != null ? MyUser(uid: user.uid) : null;
  }

  //auth change user stream
  //returns value ie user object based on user class if signed in and null if not signed in
  //we can also use firebase generic object instead of custom user class
  Stream<MyUser?> get user {
    // return _auth.authStateChanges();
    return _auth
        .authStateChanges()
        // .map((User? user) { return user != null ? User.fromFirebase(user, 0) : null;});
        // .map((User? user) => _userFromFirebaseUser(user));
        .map(_userFromFirebaseUser);  //same as in above commented line
  }

  //sign in anon
  Future signInAnon() async {
    try {
      UserCredential result = await _auth.signInAnonymously();
      User? user = result.user;
      //return user;
      return _userFromFirebaseUser(user);
    } catch (e) {
      print(e.toString());
      return null;
    }
  }

  //sign in with email and password

  //register with email and password

  //sign out
}
